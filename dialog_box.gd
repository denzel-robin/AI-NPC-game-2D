extends Control

@onready var _speaker : Label = $VBoxContainer/Speaker
@onready var _dialog : RichTextLabel = $VBoxContainer/Dialog

func display_line(dialog : String, speaker : String = ""):
	_speaker.visible = (speaker!="")
	_speaker.text = speaker
	_dialog.text = dialog
	open()

func open():
	visible = true
func close():
	visible = false
