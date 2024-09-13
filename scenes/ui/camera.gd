extends Camera2D
class_name GameCamera

@export var player:Player

func _ready():
	self.set_limit(SIDE_LEFT, 0)
	self.set_limit(SIDE_RIGHT, 1280)
	self.set_limit(SIDE_TOP, 0)
	self.set_limit(SIDE_BOTTOM, 720)

func _physics_process(_delta):
	self.global_position = player.global_position
