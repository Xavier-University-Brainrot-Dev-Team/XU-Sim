extends StaticBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


var _is_open: bool = false


func _ready() -> void:
	interaction_area.interact = Callable(self, "_open_door")
	

func _open_door():
	if _is_open:
		collision_shape_2d.disabled = false
		interaction_area.action_name = "open"
	else:
		collision_shape_2d.disabled = true
		interaction_area.action_name = "close"
	
	_is_open = !_is_open
