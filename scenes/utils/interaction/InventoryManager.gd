extends Node2D

@onready var hotbar_slots:Node2D = $Hotbar/Slots

var simple_item:Dictionary = { "name" : "", "quantity" : 0 }
var items_list:Array

func _on_interactable_bush_searched(texture_path:String):
	var path = texture_path.split("/")
	var item_name_from_path = path[path.size() - 1].split("_")[0]
	var _return = check_if_item_is_already_on_list(item_name_from_path)
	if _return == Dictionary():
		var first_empty_slot = get_first_empty_slot()
		if first_empty_slot != null:
			var item = first_empty_slot._add_new_item(item_name_from_path, texture_path)
			var new_item = simple_item.duplicate()
			new_item.name = item.item_name
			new_item.quantity = item.quantity
			items_list.append(new_item)
		
	elif _return != Dictionary():
		var item_index = items_list.find(_return)
		var slot = get_item_slot_by_index(item_index)
		items_list[item_index].quantity += 1
		slot._update_quantity(items_list[item_index].quantity)
	
	print(items_list)

func get_first_empty_slot() -> InventoryItem:
	var item_slots = hotbar_slots.find_children("Item")
	for i in item_slots:
		if i.item_name.is_empty():
			return i
	return null

func get_item_slot_by_index(index:int) -> InventoryItem:
	var item_slots = hotbar_slots.find_children("Item")
	return item_slots[index]

func check_if_item_is_already_on_list(item_name:String) -> Dictionary:
	if items_list.size() == 0:
		return Dictionary()
	
	for index in range(items_list.size()):
		if items_list[index].name == item_name:
			return items_list[index]
		
	return Dictionary()
