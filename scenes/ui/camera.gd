extends Camera2D
class_name GameCamera

@export var player:Player

func _physics_process(_delta):
	self.global_position = player.global_position
