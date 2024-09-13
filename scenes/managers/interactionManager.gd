extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var interactionButton = $InteractionButton

var activeAreas = []
var canInteract = true

func RegisterArea(area: InteractionArea):
	activeAreas.push_back(area)
	activeAreas.sort_custom(_sort_by_distance_to_player)

func UnregisterArea(area: InteractionArea):
	activeAreas.erase(area)
	activeAreas.sort_custom(_sort_by_distance_to_player)

func _process(_delta):
	if activeAreas.size() > 0 && canInteract:
		interactionButton.global_position = activeAreas[0].global_position
		interactionButton.global_position.y -= 36
		interactionButton.global_position.x -= interactionButton.scale.x / 2
		interactionButton.play("button_pushed")
		interactionButton.show()
	else:
		interactionButton.play("default")
		interactionButton.hide()

func _sort_by_distance_to_player(area1, area2):
	var area1ToPlayer = player.global_position.distance_to(area1.global_position)
	var area2ToPlayer = player.global_position.distance_to(area2.global_position)
	return area2ToPlayer < area1ToPlayer
