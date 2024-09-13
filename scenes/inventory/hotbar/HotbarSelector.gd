extends AnimatedSprite2D
class_name HotbarSelector
signal ItemSelected()

@onready var slots:Array = get_tree().get_nodes_in_group("HotbarSlots")
var timer:Timer

func _init():
	self.visible = false
	self.play()
	SetTimer()

func AdjustGlobalPosition(i:int):
	self.visible = true
	self.global_position = slots[i].global_position
	if slots[i].IsEmpty():
		timer.start()
		return

func SetTimer():
	timer = Timer.new()
	timer.wait_time = 5
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", _on_timer_timeout)

func _on_timer_timeout():
	self.visible = false
