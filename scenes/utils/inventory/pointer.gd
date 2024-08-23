extends Sprite2D

@export var hotbar:TileMapLayer
@export var label:Label
@onready var hotbarSlots:Array = get_tree().get_nodes_in_group("HotbarSlots")
var timer:Timer
var pointingSlot:InventoryItem

func _init():
	self.visible = false
	SetTimer()

#func _process(_delta):
	#if Input.is_action_just_pressed("hotbar1"):
		#AdjustGlobalPosition(0)
	#elif Input.is_action_just_pressed("hotbar2"):
		#AdjustGlobalPosition(1)
	#elif Input.is_action_just_pressed("hotbar3"):
		#AdjustGlobalPosition(2)
	#elif Input.is_action_just_pressed("hotbar4"):
		#AdjustGlobalPosition(3)

#func AdjustGlobalPosition(index:int):
	#self.visible = true
	#self.global_position = hotbarSlots[index].global_position
	#self.position.x += self.texture.get_size().x/2
	#self.position.y -= self.texture.get_size().y
	#pointingSlot = hotbarSlots[index].get_children()[0]
	#label.text = pointingSlot.itemName
	#print("itemName: ", pointingSlot.itemTexture)
	#timer.start()

func SetTimer():
	timer = Timer.new()
	timer.wait_time = 5
	timer.one_shot = true
	add_child(timer)
	
	timer.connect("timeout", _on_timer_timeout)

func _on_timer_timeout():
	label.text = ""
	self.visible = false
