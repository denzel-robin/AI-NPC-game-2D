extends Node

var api_file = preload("res://gitignore/npc-ai-api.gd")
var api_inst = api_file.new()
var api = api_inst.api

func _ready() -> void:
	handshake_ai()


func handshake_ai():
	var headers = [
		"Authorization: Bearer " + api,
		"Content-Type: application/json"
	]

	var messages = [
		{
			"role": "system",
			"content": "Just checking in. Say 'Ready' if you can hear me."
		}
	]

	var body = {
		"model": "deepseek/deepseek-r1:free",
		"messages": messages
	}

	var json_data = JSON.stringify(body)
	print("Sending handshake to AI...")
	$HTTPRequest.request("https://openrouter.ai/api/v1/chat/completions", headers, HTTPClient.METHOD_POST, json_data)
	
	

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	print('AI Warmed Up')
