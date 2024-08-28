extends Node2D
signal BushCollected()

func _on_bush_collected(texturePath:String):
	BushCollected.emit(texturePath)
