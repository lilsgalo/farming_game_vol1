extends Control
signal Opened
signal Closed

@onready var inventorySlots:Array = get_tree().get_nodes_in_group("InventorySlots")
var isOpen:bool = false

func Open():
	visible = true
	isOpen = true
	Opened.emit()

func Close():
	visible = false
	isOpen = false
	Closed.emit()
