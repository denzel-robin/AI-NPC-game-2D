extends RigidBody2D

@export var npc_name = "Guard"
@export var dialogue = "Hello there!"

var player_in_range = false
var dialog_start = false

func _process(delta):
	if player_in_range and Input.is_action_just_pressed("interact_key"):
		dialog_start = true
	if !player_in_range:
		dialog_start = false



func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in_range = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_range = false
