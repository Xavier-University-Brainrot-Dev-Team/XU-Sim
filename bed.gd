extends StaticBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
var resource = load("res://dialogue/example.dialogue")
const dialogue = preload("res://dialogue/balloon.tscn")

var _dialogue_running: bool = false

func _ready() -> void:
	interaction_area.interact = func(): _start_dialogue()
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	
	

func _start_dialogue():
	if _dialogue_running:
		return

	_dialogue_running = true
	var baloon : Node = dialogue.instantiate()
	get_tree().current_scene.add_child(baloon)
	baloon.start(resource, "start")
	
	# This starts the dialogue at the "start" node

func _on_dialogue_ended(resource):
	print("Dialogue finished.")
	_dialogue_running = false
