extends Node

signal new_message

var api_file = preload("res://gitignore/npc-ai-api.gd")
var api_inst = api_file.new()
var api = api_inst.api

var new_dialog
var dialog = []
var history = []


func start(player_line : String):
	if not $HTTPRequest.is_connected("request_completed", Callable(self, "_on_request_completed")):
		$HTTPRequest.request_completed.connect(_on_request_completed)
	new_dialog = player_line
	send_request(player_line)


func send_request(player_line: String):
	var headers = [
		"Authorization: Bearer " + api,
		"Content-Type: application/json"
	]

	# Start conversation history with system prompt
	var messages = [
		{
			"role": "system",
			"content": "You are a grumpy medieval castle guard. Speak in short, blunt phrases. Stay in character, don't explain yourself."
		}
	]

	# Build full conversation
	for i in range(min(dialog.size(), history.size())):
		messages.append({ "role": "user", "content": dialog[i] })
		messages.append({ "role": "assistant", "content": history[i] })

	# Add the new player dialog
	messages.append({ "role": "user", "content": player_line })

	var body = {
		"model": "deepseek/deepseek-r1:free",
		#"model" : "google/gemma-3n-e2b-it:free",
		"messages": messages
	}

	var json_data = JSON.stringify(body)
	$HTTPRequest.request("https://openrouter.ai/api/v1/chat/completions", headers, HTTPClient.METHOD_POST, json_data)


func _on_request_completed(result, response_code, headers, body):
	var text = body.get_string_from_utf8()
	var json = JSON.parse_string(text)

	if json:
		var message = json["choices"][0]["message"]["content"].strip_edges()
		dialog.append(new_dialog)
		history.append(message)
		emit_signal("new_message", message)
		print(message)
	else:
		print("Failed to parse response")
