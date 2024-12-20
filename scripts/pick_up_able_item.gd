extends Node3D

@export var is_pickable: bool = true
@export var interaction_text: String
@export var required_item: String

@export var inventory_name: String = ""
@export var inventory_icon: Texture = null 


func interact():
	if is_pickable:
		print("Item picked up!", self.name)
		InventoryManager.add_item(self)
		self.visible=false
		self.collision_layer &= ~2
	else:
		print(interaction_text)
		if InventoryManager.selected_item_index!=-1:
			if required_item && !InventoryManager.items[InventoryManager.selected_item_index]:
				print("you need a ", required_item)
			else:
				queue_free()
				InventoryManager.remove_item_by_id(required_item)
