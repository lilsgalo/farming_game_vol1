extends Button

@onready var inventory:Inventory = preload("res://scenes/inventory/PlayerInventory.tres")
@onready var background:Sprite2D = $Background
@onready var container: CenterContainer = $Container
var itemPanel: ItemPanel
var index:int

func PutItem(ip:ItemPanel):
	itemPanel = ip
	container.add_child(itemPanel)
	
	if !itemPanel.slot or inventory.slots[index] == itemPanel.slot:
		return
	inventory.InsertInSlot(index, itemPanel.slot)

func TakeItem() -> ItemPanel:
	var item = itemPanel
	container.remove_child(itemPanel)
	itemPanel = null
	return item

func IsEmpty():
	return !itemPanel
