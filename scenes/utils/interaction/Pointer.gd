extends Sprite2D

@export var hotbar:TileMapLayer
@export var label:Label
var hotbar_slots:Array
var timer:Timer
var pointing_slot:InventoryItem

func _init():
	self.visible = false
	timer = Timer.new()
	timer.wait_time = 5
	timer.one_shot = true
	add_child(timer)
	
	timer.connect("timeout", _on_timer_timeout)

func _ready():
	for i in range(hotbar.find_children("Item").size()):
		hotbar_slots.push_back(hotbar.find_children("Slot_0" + str(i+1)))
		

func _process(delta):
	if Input.is_action_just_pressed("hotbar_1"):
		adjust_global_position(0)
	elif Input.is_action_just_pressed("hotbar_2"):
		adjust_global_position(1)
	elif Input.is_action_just_pressed("hotbar_3"):
		adjust_global_position(2)
	elif Input.is_action_just_pressed("hotbar_4"):
		adjust_global_position(3)

func adjust_global_position(index:int):
	self.visible = true
	self.global_position = hotbar_slots[index][0].global_position
	self.position.x += self.texture.get_size().x/2
	self.position.y -= self.texture.get_size().y
	pointing_slot = hotbar_slots[index][0].get_children()[0]
	label.text = pointing_slot.item_name
	#timer.start()
	#print("x: ", self.position.x)
	#print("y: ", self.position.y)

func _on_timer_timeout():
	label.text = ""
	self.visible = false
