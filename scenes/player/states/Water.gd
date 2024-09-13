extends State
class_name PlayerWater

@onready var stateMachine:StateMachine = self.get_parent()
var animationPlayer:AnimationPlayer

func _ready():
	animationPlayer = stateMachine.player.get_node("AnimationPlayer")

func Enter():
	animationPlayer.play("water")
	await animationPlayer.animation_finished
	StateTransition.emit(self, "idle")
