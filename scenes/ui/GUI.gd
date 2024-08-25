extends CanvasLayer

@onready var inventoryGui:Control = $InventoryGui

func _ready():
	inventoryGui.Close()

func _input(event):
	if event.is_action_pressed("toggleInventory"):
		if inventoryGui.isOpen:
			inventoryGui.Close()
		else:
			inventoryGui.Open()
	
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
	if event.is_action_pressed("quit"):
		get_tree().quit()
