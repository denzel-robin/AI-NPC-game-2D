extends Node2D

@onready var npc : RigidBody2D = $NPC
@onready var dialog : Control = $DialogBox

func _process(delta: float) -> void:
	if npc.dialog_start:
		dialog.display_line(npc.dialogue ,npc.npc_name)
	else:
		dialog.close()
