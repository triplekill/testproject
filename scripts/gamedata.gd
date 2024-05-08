extends Node


const SETTING:String = "SETTING"
const LANGUAGE:String = "Language"
const DISPLAY:String = "Display"
const FULLSCREEN:String = "FullScreen"

var FIRST_NAME_ARRAY = []
var LAST_NAME_ARRAY = []
var VERSION = '0.1b'
var CURRENT_DISPLAY = Vector2i.ZERO
var CURRENT_ISFULL:bool = true

const filePath:String = "user://settings.ini"
var config:ConfigFile

func _ready():
	if not FileAccess.file_exists(filePath):
		config = ConfigFile.new()
		config.load(filePath)
		if OS.get_locale_language() == "zh":
			config.set_value(SETTING,LANGUAGE, "zh")
		else:
			config.set_value(SETTING,LANGUAGE, "en")
		
		var display = getDisplay()
		config.set_value(SETTING,DISPLAY, display)
		CURRENT_DISPLAY = setDisplay(display)
		config.set_value(SETTING,FULLSCREEN, true)
		config.save(filePath)
	else:
		config = ConfigFile.new()
		config.load(filePath)
		CURRENT_DISPLAY = setDisplay(config.get_value(SETTING,DISPLAY))
		CURRENT_ISFULL = isFullScreen()

	gNameDataInit()

func getDisplay():
	var display = ""
	var current = DisplayServer.screen_get_size()
	if current.x == 1920 and current.y == 1080:
		display = "1920x1080"
	elif current.x == 1920 and current.y == 1200:
		display = "1920x1200"
	elif current.x == 2560 and current.y == 1440:
		display = "2560x1440"
	elif current.x == 1440 and current.y == 900:
		display = "1440x900"
	elif current.x < 1440 or current.y < 900:
		display = "1280x800"
	else:
		display = "1920x1080"
	return display

func setLanguage(language):
	config = ConfigFile.new()
	config.load(filePath)
	config.set_value(SETTING,LANGUAGE, language)
	config.save(filePath)

func setFullScreen(isFull:bool):
	config = ConfigFile.new()
	config.load(filePath)
	config.set_value(SETTING,FULLSCREEN, isFull)
	config.save(filePath)

func isFullScreen():
	return config.get_value(SETTING,FULLSCREEN)

func setDisplay(display):
	var split_values = display.split("x")
	var width = int(split_values[0])
	var height = int(split_values[1])
	return Vector2i(int(split_values[0]),int(split_values[1]))
	

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
