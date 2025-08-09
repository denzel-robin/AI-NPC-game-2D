extends Node2D

@onready var npc : RigidBody2D = $NPC
@onready var chat_npc : Control = $InputText


func _process(delta: float) -> void:
	if npc.dialog_start:
		chat_npc.start_chat()
	else:
		chat_npc.close_chat()
