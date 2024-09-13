extends Node2D

#@export var sceneManager:SceneManager
@onready var player:Player = $Player
@onready var initialZone:Scene = $InitialZone

func _ready():
	initialZone.player = player

func _on_inventory_opened():
	ResumePauseGame(true)

func _on_inventory_closed():
	ResumePauseGame(false)

func ResumePauseGame(state:bool):
	get_tree().paused = state
