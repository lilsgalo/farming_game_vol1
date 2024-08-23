extends State
class_name PlayerDig

@onready var stateMachine:StateMachine = self.get_parent()
var animationPlayer:AnimationPlayer

func _ready():
	animationPlayer = stateMachine.player.get_node("AnimationPlayer")

func Enter():
	animationPlayer.play("dig")
	await animationPlayer.animation_finished
	StateTransition.emit(self, "idle")
