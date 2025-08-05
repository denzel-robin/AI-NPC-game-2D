extends Node2D

@onready var npc : RigidBody2D = $NPC
@onready var dialog : Control = $DialogBox
@onready var input_text : Control = $InputText



func _process(delta: float) -> void:
	if npc.dialog_start:
		input_text.open()
		#dialog.display_line(npc.dialogue ,npc.npc_name)
	else:
		input_text.close()
		#dialog.close()
