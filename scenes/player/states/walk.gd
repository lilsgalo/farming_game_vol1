extends State
class_name PlayerWalk

@onready var stateMachine:StateMachine = self.get_parent()
@export var speed = 65.0
var animationPlayer:AnimationPlayer
var player:Player
var direction:Vector2 = Vector2.ZERO

func _ready():
	player = stateMachine.player
	animationPlayer = player.get_node("AnimationPlayer")

func Enter():
	animationPlayer.play("walk")

func Update(_delta:float):
	if direction == Vector2.ZERO:
		StateTransition.emit(self, "idle")
	move()

func move() -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	player.velocity = direction * speed
	player.move_and_slide()
