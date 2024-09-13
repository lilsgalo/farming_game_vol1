extends Control

@onready var inventory:Inventory = preload("res://scenes/inventory/PlayerInventory.tres")
@onready var slots = get_tree().get_nodes_in_group("HotbarSlots")
@onready var selector:HotbarSelector = $NinePatchRect/HotbarSelector
var selectedSlot

var hotbar = {
	"1":0,
	"2":1,
	"3":2,
	"4":3,
	"5":4
}

func _ready():
	UpdateHotbarSlots()
	inventory.Updated.connect(UpdateHotbarSlots)

func UpdateHotbarSlots():
	for i in range(slots.size()):
		var inventorySlot:InventorySlot = inventory.slots[i]
		slots[i].UpdateToHotbar(inventorySlot)

func _process(_delta):
	if Input.is_action_just_pressed("1"):
		selector.AdjustGlobalPosition(hotbar["1"])
		selectedSlot = slots[hotbar["1"]]
	elif Input.is_action_just_pressed("2"):
		selector.AdjustGlobalPosition(hotbar["2"])
		selectedSlot = slots[hotbar["2"]]
	elif Input.is_action_just_pressed("3"):
		selector.AdjustGlobalPosition(hotbar["3"])
		selectedSlot = slots[hotbar["3"]]
	elif Input.is_action_just_pressed("4"):
		selector.AdjustGlobalPosition(hotbar["4"])
		selectedSlot = slots[hotbar["4"]]
	elif Input.is_action_just_pressed("5"):
		selector.AdjustGlobalPosition(hotbar["5"])
		selectedSlot = slots[hotbar["5"]]
