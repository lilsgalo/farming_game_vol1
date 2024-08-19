extends CharacterBody2D
class_name Player

@onready var animation_tree:AnimationTree = $AnimationTree
var direction:Vector2 = Vector2.ZERO

const speed = 275.0
const movement_inputs = ["left", "right", "up", "down"]

func _ready():
	animation_tree.active = true

func _process(delta):
	update_animation_params(velocity)
	handle_inputs()

func _physics_process(delta):
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
	move()

func update_animation_params(vel:Vector2):
	animation_tree.set("parameters/conditions/idle", vel == Vector2.ZERO)
	animation_tree.set("parameters/conditions/is_moving",
		vel != Vector2.ZERO && (direction.x != 0 || direction.y != 0))
	
	if vel != Vector2.ZERO:
		animation_tree["parameters/idle/blend_position"] = direction
		animation_tree["parameters/walk/blend_position"] = direction

func move() -> void:
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = direction * speed
	move_and_slide()

func handle_inputs() -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
