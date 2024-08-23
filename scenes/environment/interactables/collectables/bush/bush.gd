extends Collectable
class_name Bush

var rng = RandomNumberGenerator.new()
var systemItems = {
	0: "res://assets/environment/decorations/bush_md.png",
	1: "res://assets/environment/decorations/mushroom_md.png",
	2: "res://assets/environment/decorations/rock_md.png",
	3: "res://assets/environment/decorations/vegetable_md.png",
}

func Interaction():
	var randomIndex = rng.randi_range(0, systemItems.size() - 1)
	Collected.emit(systemItems[randomIndex])
