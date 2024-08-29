extends Button

@onready var background:Sprite2D = $Background
@onready var itemPanel:ItemPanel = $Container/ItemPanel

func UpdateToHotbar(slot:InventorySlot):
	if !slot.item:
		itemPanel.visible = false
		return
	itemPanel.slot = slot
	itemPanel.Update()
	itemPanel.visible = true
