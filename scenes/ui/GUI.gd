extends CanvasLayer

@onready var inventoryGui:Control = $InventoryGui
@onready var hotbarGui:Control = $HotbarGui

func _ready():
	inventoryGui.Close()

func _input(event):
	if event.is_action_pressed("toggleInventory"):
		if inventoryGui.isOpen:
			inventoryGui.Close()
			hotbarGui.visible = true
		else:
			inventoryGui.Open()
			hotbarGui.visible = false
	
	if event.is_action_pressed("quit"):
		get_tree().quit()
