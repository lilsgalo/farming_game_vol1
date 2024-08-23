extends State
class_name PlayerDoing

@onready var stateMachine:StateMachine = self.get_parent()
var animationPlayer:AnimationPlayer

func _ready():
	animationPlayer = stateMachine.player.get_node("AnimationPlayer")

func Enter():
	var interactable = InteractionManager.activeAreas[0].get_parent()
	animationPlayer.play("doing")
	await animationPlayer.animation_finished
	interactable.Init()
	
	StateTransition.emit(self, "idle")
