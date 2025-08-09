extends Control

@onready var line_edit = $LineEdit
@onready var npc_ai : Node = $"npc-ai"

func _ready() -> void:
	visible = false

func start_chat():
	open()

func close_chat():
	close()

func _on_line_edit_text_submitted(new_text: String) -> void:
	line_edit.clear()
	line_edit.hide()
	line_edit.release_focus()
	visible = false
	npc_ai.start(new_text)

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
