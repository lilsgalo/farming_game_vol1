extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var interaction_button = $interaction_button

var active_areas = []
var can_interact = true

func register_area(area: InteractionArea):
	active_areas.push_back(area)
	active_areas.sort_custom(_sort_by_distance_to_player)

func unregister_area(area: InteractionArea):
	active_areas.erase(area)
	active_areas.sort_custom(_sort_by_distance_to_player)

func _process(delta):
	if active_areas.size() > 0 && can_interact:
		interaction_button.global_position = active_areas[0].global_position
		interaction_button.global_position.y -= 48
		interaction_button.global_position.x -= interaction_button.scale.x / 2
		interaction_button.play("button_pushed")
		interaction_button.show()
	else:
		interaction_button.play("default")
		interaction_button.hide()

func _sort_by_distance_to_player(area1, area2):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player

func _input(event):
	if event.is_action_pressed("interact") && can_interact:
		if active_areas.size() > 0:
			can_interact = false
			interaction_button.hide()
			
			await active_areas[0].interact.call()
			
			can_interact = true
