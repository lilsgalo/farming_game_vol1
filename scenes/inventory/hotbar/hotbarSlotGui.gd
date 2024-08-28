extends Button

@onready var background: Sprite2D = $Background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item
@onready var quantityText: Label = $CenterContainer/Panel/ItemQuantity
@onready var quantity: int = 0

func Update(slot:InventorySlot):
	if !slot.item:
		itemSprite.visible = false
	else:
		itemSprite.visible = true
		itemSprite.texture = slot.item.texture
		quantity = slot.quantity
		if quantity > 1:
			quantityText.text = str(quantity)
		else:
			quantityText.text = ""
