extends Area2D
class_name InteractionArea

@export var actionName:String = "Interact"

var Interact: Callable = func ():
	pass

func _ready():
	pass

func _on_body_entered(_body):
	InteractionManager.RegisterArea(self)

func _on_body_exited(_body):
	InteractionManager.UnregisterArea(self)
