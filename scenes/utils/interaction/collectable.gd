extends Area2D
class_name Collectable
signal Collected()

@onready var interactionArea:InteractionArea = $InteractionArea 

func Init():
	interactionArea.Interact = Callable(self, "Interaction")
	Interaction()

func Interaction():
	Collected.emit()
