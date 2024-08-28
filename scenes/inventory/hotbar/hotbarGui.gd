extends Control

@onready var inventory:Inventory = preload("res://scenes/inventory/PlayerInventory.tres")
@onready var hotbarSlots = get_tree().get_nodes_in_group("HotbarSlots")

func _ready():
	inventory.itemAdded.connect(UpdateHotbarSlots)

func UpdateHotbarSlots():
	for i in range(5):
		hotbarSlots[i].Update(inventory.slots[i])
