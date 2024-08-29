extends Control

@onready var inventory:Inventory = preload("res://scenes/inventory/PlayerInventory.tres")
@onready var slots = get_tree().get_nodes_in_group("HotbarSlots")

func _ready():
	UpdateHotbarSlots()
	inventory.Updated.connect(UpdateHotbarSlots)

func UpdateHotbarSlots():
	for i in range(slots.size()):
		var inventorySlot:InventorySlot = inventory.slots[i]
		slots[i].UpdateToHotbar(inventorySlot)
