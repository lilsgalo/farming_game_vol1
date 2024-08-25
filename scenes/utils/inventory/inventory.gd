extends Resource
class_name Inventory

signal itemAdded()

@export var items:Array[InventoryItem]
const MAX_INVENTORY_QUANTITY:int = 15
const MAX_ITEM_QUANTITY:int = 10

func AddItem(newItem:InventoryItem):
	var itemInList:bool = CheckItemAlreadyInList(newItem)
	if !itemInList:
		var slot = GetFirstEmptySlot()
		if slot < 0:
			print("Your inventory is full.")
			return
		newItem.quantity += 1
		items[slot] = newItem
	else:
		var itemIndex = items.find(newItem)
		if items[itemIndex].quantity >= MAX_ITEM_QUANTITY:
			print("You cannot get more of '" + items[itemIndex].name
			+ "', you've reached the maximum quantity for this item.")
			return
		else:
			items[itemIndex].quantity += 1
	
	#print(items)
	itemAdded.emit()
	

func CheckItemAlreadyInList(newItem:InventoryItem) -> bool:
	if items.size() == 0:
		return false
	
	for item in items:
		if item == newItem:
			return true
		
	return false

func GetFirstEmptySlot() -> int:
	for i in range(items.size()):
		if !items[i]:
			return i
	return -1
