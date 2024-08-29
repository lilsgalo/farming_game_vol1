extends Resource
class_name Inventory

signal Updated()

@export var slots:Array[InventorySlot]
const MAX_INVENTORY_SLOTS:int = 15
const MAX_ITEM_QUANTITY:int = 3

func AddItem(newItem:InventoryItem):
	var itemInList = CheckItemAlreadyInList(newItem)
	if !itemInList:
		_addItem(newItem)
	else:
		if itemInList.quantity >= MAX_ITEM_QUANTITY:
			_addItem(newItem)
		else:
			itemInList.quantity += 1
	
	#print(slots)
	Updated.emit()
	

func _addItem(newItem:InventoryItem):
	var index = -1
	for i in range(slots.size()):
		if !slots[i].item:
			index = i
			break
	
	if index == -1:
		print("Your inventory is full.")
		return
	
	slots[index].item = newItem
	slots[index].quantity = 1

func CheckItemAlreadyInList(newItem:InventoryItem) -> InventorySlot:
	for slot in slots:
		if slot.item == newItem and slot.quantity < MAX_ITEM_QUANTITY:
			return slot
		
	return null

func RemoveItemAtIndex(index:int):
	slots[index] = InventorySlot.new()
	Updated.emit()

func InsertInSlot(index:int, inventorySlot:InventorySlot):
	var oldIndex:int = slots.find(inventorySlot)
	RemoveItemAtIndex(oldIndex)
	slots[index] = inventorySlot
	Updated.emit()
