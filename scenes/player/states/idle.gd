extends State
class_name PlayerIdle

@onready var stateMachine:StateMachine = self.get_parent()
var animationPlayer:AnimationPlayer
var canInteract:bool = true
var canDig:bool = true

func _ready():
	animationPlayer = stateMachine.player.get_node("AnimationPlayer")

func Enter():
	animationPlayer.play("idle")

func Update(_delta:float):
	HandleInputs()

func HandleInputs() -> void:
	if Input.get_vector("left", "right", "up", "down"):
		StateTransition.emit(self, "walk")
	
	if Input.is_action_just_pressed("interact") and canInteract:
		canInteract = false
		if InteractionManager.activeAreas.size() > 0:
			StateTransition.emit(self, "interact")
			await animationPlayer.animation_finished
		canInteract = true
	
	if Input.is_action_just_pressed("useTool"):
		StateTransition.emit(self, "water")
		#print("tool used")
