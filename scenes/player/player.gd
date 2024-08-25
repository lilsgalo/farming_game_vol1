extends CharacterBody2D
class_name Player

@export var inventory:Inventory

@onready var bodySprite:Sprite2D = $Body
@onready var hairSprite:Sprite2D = $Hair
@onready var toolSprite:Sprite2D = $Tool

var direction:Vector2 = Vector2.ZERO
var xDirection:int = 1

func _ready():
	pass

func _process(_delta):
	HandleInputs()

func _physics_process(_delta):
	if direction.x > 0:
		xDirection = 1
	elif direction.x < 0:
		xDirection = 0
	#print(direction)
	ChangeSpriteDirection()
	move_and_slide()

func ChangeSpriteDirection():
	bodySprite.flip_h = 0 if xDirection == 1 else 1
	hairSprite.flip_h = bodySprite.flip_h
	toolSprite.flip_h = bodySprite.flip_h

func HandleInputs() -> void:
	direction = Input.get_vector("left", "right", "up", "down")
