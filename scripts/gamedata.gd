extends Node


var FIRST_NAME_ARRAY = []
var LAST_NAME_ARRAY = []


func GameDataInit():
	gNameDataInit()


func gNameDataInit():
	var fileFD = FileAccess.open("res://data/name.json",FileAccess.READ)
	var file_contents = fileFD.get_as_text()
	fileFD.close()
	var json_data = JSON.parse_string(file_contents)
	LAST_NAME_ARRAY = json_data["last_name"]
	FIRST_NAME_ARRAY = json_data["first_name"]


func gGenRandomName():
	var randomFirstName = FIRST_NAME_ARRAY[randi() % FIRST_NAME_ARRAY.size()]
	var randomLastName = LAST_NAME_ARRAY[randi() % LAST_NAME_ARRAY.size()]
	var name = randomFirstName+"."+randomLastName
	return name
