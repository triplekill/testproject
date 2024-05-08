extends Control

@onready var LanguageSeleted = $Panel/MarginContainer/VBoxContainer/LanguagePanel/OptionButton
@onready var ScreenSetting = $Panel/MarginContainer/VBoxContainer/FullScreenPanel/CheckButton
@onready var DisplaySetting = $Panel/MarginContainer/VBoxContainer/DisplayPanel/OptionButton


func _ready():
	if GameData.config.get_value("SETTING",GameData.LANGUAGE) == "en":
		LanguageSeleted.selected = 1
	else:
		LanguageSeleted.selected = 0
	
	if GameData.isFullScreen():
		ScreenSetting.set_pressed_no_signal(true)
	else:
		ScreenSetting.set_pressed_no_signal(false)

	var display = GameData.config.get_value("SETTING",GameData.DISPLAY)

	if display == "1920x1080":
		DisplaySetting.selected = 0
	elif  display == "2560x1440":
		DisplaySetting.selected = 1
	elif  display == "1440x900":
		DisplaySetting.selected = 2
	elif  display == "1920x1200":
		DisplaySetting.selected = 3
	else:
		DisplaySetting.selected = 0
