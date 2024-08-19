extends Node2D
signal bush_searched_on_collectable()

func _on_bush_searched(texture_path:String):
	bush_searched_on_collectable.emit(texture_path)
