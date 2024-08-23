extends Sprite2D
class_name InventoryItem

@onready var label = $Label
var itemName:String
var itemTexture:String
var quantity:int = 0

func _init():
	self.visible = false

func AddItem(nameInput:String, texturePath:String) -> InventoryItem:
	self.set_texture(load(texturePath))
	quantity += 1
	self.visible = true
	label.text = str(quantity)
	itemTexture = texturePath
	itemName = nameInput
	print(itemTexture)
	return self

func UpdateQuantity(value:int):
	quantity = value
	label.text = str(quantity)
	#print(label.text)
