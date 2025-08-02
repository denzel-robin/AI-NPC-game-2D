extends Control

var current_lines = []
var current_index = 0

@onready var dialogue_label = $Panel/Label

func start_dialogue(lines: Array):
	current_lines = lines
	current_index = 0
	show()
	show_next_line()

func show_next_line():
	if current_index < current_lines.size():
		dialogue_label.text = current_lines[current_index]
		current_index += 1
	else:
		hide() # End of conversation
