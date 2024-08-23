extends State
class_name PlayerWalk

@onready var stateMachine:StateMachine = self.get_parent()
var animationPlayer:AnimationPlayer
var player:Player
var direction:Vector2 = Vector2.ZERO
var speed = 120.0

func _ready():
	player = stateMachine.player
	animationPlayer = player.get_node("AnimationPlayer")
	#print(stateMachine)

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
