extends Sprite2D
class_name Collectable

@export var itemResource: InventoryItem

func Collect(inventory:Inventory):
	inventory.AddItem(itemResource)
