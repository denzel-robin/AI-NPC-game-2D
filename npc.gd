extends Node2D

@export var npc_name = "Guard"
@export var dialogue = ["Hello there!", "Stay safe in the castle."]

var player_in_range = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact_key"):
		start_dialogue()

func start_dialogue():
	for line in dialogue:
		print(npc_name + ": " + line)


func _on_collision_shape_2d_child_entered_tree(node: Node) -> void:
	player_in_range = true


func _on_collision_shape_2d_child_exiting_tree(node: Node) -> void:
	player_in_range = false
