extends Control

signal Opened
signal Closed

@onready var inventory:Inventory = preload("res://scenes/utils/inventory/items/playerInventory.tres")
@onready var inventorySlots = get_tree().get_nodes_in_group("InventorySlots")

var isOpen:bool = false


func _ready():
	inventory.itemAdded.connect(UpdateSlots)
	UpdateSlots()

func UpdateSlots():
	for i in range(min(inventory.items.size(), inventorySlots.size())):
		inventorySlots[i].Update(inventory.items[i])

func Open():
	visible = true
	isOpen = true
	Opened.emit()

func Close():
	visible = false
	isOpen = false
	Closed.emit()
