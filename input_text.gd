extends Control

@onready var line_edit = $LineEdit
@onready var npc_ai = $"npc-ai"

var player

func _ready() -> void:
	visible = false

func _on_line_edit_text_submitted(new_text: String) -> void:
	player = new_text
	line_edit.clear()
	line_edit.hide()
	line_edit.release_focus()
	visible = false

func open():
	visible = true
	line_edit.grab_focus()
	line_edit.show()

func close():
	if visible == true:
		line_edit.clear()
		line_edit.hide()
		line_edit.release_focus()
		visible = false
