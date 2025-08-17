extends Control

@onready var _dialog : RichTextLabel = $VBoxContainer/Dialog
@onready var timer : Timer = $Timer

func _ready() -> void:
	visible = false

func display_line(dialog : String):
	_dialog.text = dialog
	open()

func open():
	visible = true
	timer.start(3)
func close():
	visible = false


func _on_timer_timeout() -> void:
	print("Timeout")
	close()
