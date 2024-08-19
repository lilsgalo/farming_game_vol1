extends Node2D
signal interactable_bush_searched()

func _on_map_1_bush_searched_on_collectable(texture_path:String):
	interactable_bush_searched.emit(texture_path)
