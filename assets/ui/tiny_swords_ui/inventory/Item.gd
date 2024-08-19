extends Sprite2D
class_name InventoryItem

@onready var label = $Label
@onready var item_name:String = ""
@onready var item_texture:CompressedTexture2D
var quantity:int = 0

func _init():
	self.visible = false

func _add_new_item(item_name_input:String, texture_path:String) -> InventoryItem:
	self.set_texture(load(texture_path))
	item_name = item_name_input
	quantity += 1
	label.text = str(quantity)
	self.visible = true
	return self

func _update_quantity(value:int):
	quantity = value
	label.text = str(quantity)
	#print(label.text)
