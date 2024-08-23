extends Node
class_name StateMachine

@export var initialState:State
@export var player:Player
var states:Dictionary
var currentState:State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.StateTransition.connect(ChangeState)
		
		if initialState:
			initialState.Enter()
			currentState = initialState

func _process(delta):
	if currentState:
		currentState.Update(delta)

func ChangeState(changingState:State, newStateName:String):
	if changingState != currentState:
		print("Invalid changing of states. Trying to change from '"
			+ changingState.name + "' to '" + newStateName + "'.")
		return
	
	#print("states: ", states)
	var newState = states.get(newStateName.to_lower())
	if !newState:
		print("New state is empty.")
		return
	
	if currentState:
		currentState.Exit()
	
	newState.Enter()
	currentState = newState
