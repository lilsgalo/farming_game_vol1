extends Panel
class_name ItemPanel

@onready var itemSprite: Sprite2D = $Item
@onready var quantityText: Label = $ItemQuantity
var slot:InventorySlot

func Update():
	if !slot or !slot.item: return
	itemSprite.texture = slot.item.texture
	itemSprite.visible = true
	if slot.quantity > 1:
		quantityText.text = str(slot.quantity)
	else:
		quantityText.text = ""
