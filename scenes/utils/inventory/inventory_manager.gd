extends Control

@onready var hotbarSlots:Node2D = $"/root/Main/GUI/Hotbar/Hotbar/Slots"
const MAX_QUANTITY:int = 10

var simpleItem:Dictionary = { "name" : "", "quantity" : 0 }
var itemsList:Array

func _on_item_collected(texturePath:String):
	var path = texturePath.split("/")
	var itemNameFromPath = path[path.size() - 1].split("_")[0]
	var _return = CheckItemAlreadyInList(itemNameFromPath)
	if _return == Dictionary():
		var firstEmptySlot = GetFirstEmptySlot()
		if firstEmptySlot != null:
			var item = firstEmptySlot.AddItem(itemNameFromPath, texturePath)
			var newItem = simpleItem.duplicate()
			newItem.name = item.itemName
			newItem.quantity = item.quantity
			itemsList.append(newItem)
		
	elif _return != Dictionary():
		var itemIndex = itemsList.find(_return)
		var slot = GetItemSlotByIndex(itemIndex)
		if itemsList[itemIndex].quantity >= MAX_QUANTITY:
			print("You cannot get more of '" + slot.itemName.capitalize()
			+ "', you've reached the maximum quantity for this item.")
			return
		else:
			itemsList[itemIndex].quantity += 1
			slot.UpdateQuantity(itemsList[itemIndex].quantity)
	
	#print(itemsList)

func GetFirstEmptySlot() -> InventoryItem:
	var itemSlots = hotbarSlots.find_children("Item")
	for i in itemSlots:
		if i.itemName.is_empty():
			return i
	return null

func GetItemSlotByIndex(index:int) -> InventoryItem:
	var itemSlots = hotbarSlots.find_children("Item")
	return itemSlots[index]

func CheckItemAlreadyInList(itemName:String) -> Dictionary:
	if itemsList.size() == 0:
		return Dictionary()
	
	for index in range(itemsList.size()):
		if itemsList[index].name == itemName:
			return itemsList[index]
		
	return Dictionary()
