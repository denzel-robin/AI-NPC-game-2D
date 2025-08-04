extends Node

func _ready():
	if not $HTTPRequest.is_connected("request_completed", Callable(self, "_on_request_completed")):
		$HTTPRequest.request_completed.connect(_on_request_completed)

	var headers = [
		"Authorization: Bearer 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",
		"Content-Type: application/json"
	]

	var body = {
		"model": "deepseek/deepseek-r1:free",
		"messages": [
			{
				"role": "user",
				"content": "What is the meaning of life?"
			}
		]
	}

	var json_data = JSON.stringify(body)

	# Send POST request
	$HTTPRequest.request("https://openrouter.ai/api/v1/chat/completions", headers, HTTPClient.METHOD_POST, json_data)


func _on_request_completed(result, response_code, headers, body):
	print("Response Code:", response_code)
	var text = body.get_string_from_utf8()
	var json = JSON.parse_string(text)

	if json:
		var message = json["choices"][0]["message"]["content"]
		print("AI says:", message)
	else:
		print("Failed to parse response")
