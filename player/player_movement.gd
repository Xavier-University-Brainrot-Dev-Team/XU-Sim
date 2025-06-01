class_name player extends CharacterBody2D

var move_speed: float = 250.0
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	var direction : Vector2 = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	velocity = direction * move_speed
	pass
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	pass
