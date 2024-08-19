extends Area2D
signal bush_searched()
@onready var interactionArea = $InteractionArea
@onready var inventoryManager = InventoryManager

var rng = RandomNumberGenerator.new()
var system_items = {
	0: "res://assets/environment/decorations/bush_md.png",
	1: "res://assets/environment/decorations/mushroom_md.png",
	2: "res://assets/environment/decorations/rock_md.png",
	#3:"res://assets/environment/decorations/bone_1.png",
	3: "res://assets/environment/decorations/vegetable_md.png",
}

func _ready():
	interactionArea.interact = Callable(self, "_search_bush")

func _search_bush():
	var random_item = rng.randi_range(0, 3)
	bush_searched.emit(system_items[random_item])
