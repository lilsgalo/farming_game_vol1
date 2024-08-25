extends Panel

@onready var background: Sprite2D = $Background
@onready var quantity: int = 0
@onready var quantityText: Label = $Quantity
@onready var itemSprite: Sprite2D = $Item

#func AddItem(nameInput:String, texturePath:String) -> InventoryItem:
	#texture = ImageTexture.create_from_image(Image.load_from_file(texturePath))
	#self.set_texture_normal(texture)
	#quantity += 1
	#label.text = str(quantity)
	#name = nameInput
	#return self
#
func Update(item:InventoryItem):
	if !item:
		itemSprite.visible = false
	else:
		itemSprite.visible = true
		itemSprite.texture = item.texture
		quantity = item.quantity
		quantityText.text = str(quantity)
		print(quantity)
