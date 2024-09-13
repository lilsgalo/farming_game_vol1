extends Node2D
class_name Scene

@onready var grass:TileMapLayer = $GroundGrass
@onready var land:TileMapLayer = $Lands
@onready var crops:TileMapLayer = $Crops
@onready var selector:Sprite2D = $Selector
var player:Player

#var localPlayerPos:Vector2i
var localMousePos:Vector2i
var globalMousePos:Vector2
var tileSize = 64
var layers = {
	"grass": 6,
	"land": 8,
	"crop": 9
}

func _process(delta):
	UpdateSelectorPos()
	
	if Input.is_action_just_released("click"):
		var grassAtlasCoords = grass.get_cell_atlas_coords(localMousePos)
		land.set_cell(localMousePos, 0, grassAtlasCoords)

func UpdateSelectorPos():
	globalMousePos = grass.get_global_mouse_position().snapped(Vector2(tileSize,tileSize)) - selector.texture.get_size()
	localMousePos = grass.local_to_map(globalMousePos)
	#localPlayerPos = grass.local_to_map(player.global_position)
	
	selector.global_position = globalMousePos
