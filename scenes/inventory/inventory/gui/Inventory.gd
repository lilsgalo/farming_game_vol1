extends Control

signal Opened
signal Closed

@onready var inventory:Inventory = preload("res://scenes/inventory/PlayerInventory.tres")
@onready var itemPanelClass = preload("res://scenes/inventory/inventory/gui/ItemPanel.tscn")
@onready var slots = get_tree().get_nodes_in_group("InventorySlots")

var isOpen:bool = false
var itemInHand:ItemPanel

func _ready():
	ConnectSlots()
	inventory.Updated.connect(UpdateSlots)
	UpdateSlots()

func _process(_delta):
	UpdateItemInHand()

func ConnectSlots():
	for i in range(slots.size()):
		var slot = slots[i]
		slot.index = i
		var callable = Callable(_on_slot_clicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

func UpdateSlots():
	for i in range(min(inventory.slots.size(), slots.size())):
		var inventorySlot: InventorySlot = inventory.slots[i]
		if !inventorySlot.item: continue
		var itemPanel: ItemPanel = slots[i].itemPanel
		if !itemPanel:
			itemPanel = itemPanelClass.instantiate()
			slots[i].PutItem(itemPanel)
		itemPanel.slot = inventorySlot
		itemPanel.Update()

func Open():
	visible = true
	isOpen = true
	Opened.emit()

func Close():
	visible = false
	isOpen = false
	Closed.emit()

func _on_slot_clicked(slot):
	if slot.IsEmpty() and itemInHand:
		PutItemInSlot(slot)
		return
	if !slot.IsEmpty() and !itemInHand:
		TakeItemFromSlot(slot)
		return
	if !slot.IsEmpty() and itemInHand:
		SwapItems(slot)

func TakeItemFromSlot(slot):
	itemInHand = slot.TakeItem()
	add_child(itemInHand)
	UpdateItemInHand()

func PutItemInSlot(slot):
	var item = itemInHand
	remove_child(itemInHand)
	itemInHand = null
	slot.PutItem(item)

func SwapItems(slot):
	var itemInSlot = slot.TakeItem()
	PutItemInSlot(slot)
	remove_child(itemInHand)
	itemInHand = itemInSlot
	add_child(itemInHand)
	UpdateItemInHand()

func UpdateItemInHand():
	if !itemInHand: return
	itemInHand.global_position = get_global_mouse_position() - itemInHand.size / 1.5
