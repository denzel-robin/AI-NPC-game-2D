extends RigidBody2D

@onready var input_box : Control = $InputText
@onready var dialog_box : Control = $DialogBox
@onready var npc_ai : Node = $NpcAi

var player_in_range = false

func _ready() -> void:
	input_box.connect("text_submitted", promt_ai)
	npc_ai.connect("new_message", ai_gen)

func _process(delta):
	$AnimatedSprite2D.play("idle")
	if player_in_range and Input.is_action_just_pressed("interact_key"):
		input_box.open_input()
	if !player_in_range or Input.is_action_just_pressed("exit"):
		input_box.close_box()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		player_in_range = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == 'Player':
		player_in_range = false

func promt_ai(prompt : String):
	npc_ai.start(prompt)

func ai_gen(msg: String):
	dialog_box.display_line(msg)
