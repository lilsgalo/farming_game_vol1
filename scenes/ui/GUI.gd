extends CanvasLayer

@onready var inventory:Control = $Inventory

func _ready():
	inventory.Close()

func _input(event):
	if event.is_action_pressed("toggleInventory"):
		if inventory.isOpen:
			inventory.Close()
		else:
			inventory.Open()
	
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
	if event.is_action_pressed("quit"):
		get_tree().quit()
