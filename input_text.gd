extends Control

@onready var line_edit: LineEdit = $LineEdit

signal text_submitted

var user_input

func _ready() -> void:
	line_edit.text_submitted.connect(_on_text_submitted)
	visible = false

func open_input():
	visible = true
	line_edit.grab_focus()

func close_box():
	visible = false

func _on_text_submitted(new_text: String) -> void:
	user_input = new_text
	visible = false
	emit_signal("text_submitted", user_input)
