extends Node2D

@onready var language = $CanvasLayer/SettingControl/Panel/MarginContainer/VBoxContainer/LanguagePanel/OptionButton
@onready var display = $CanvasLayer/SettingControl/Panel/MarginContainer/VBoxContainer/DisplayPanel/OptionButton
@onready var screensetting = $CanvasLayer/SettingControl/Panel/MarginContainer/VBoxContainer/FullScreenPanel/CheckButton
@onready var info_control = $CanvasLayer/InfoControl
@onready var version = $CanvasLayer/Label
@onready var chose_difficulty = $CanvasLayer/ChoseDifficulty


func _ready():
	TranslationServer.set_locale(GameSetting.config.get_value("SETTING",GameSetting.LANGUAGE))
	version.text = "Version:" + GameSetting.VERSION

	DisplayServer.window_set_size(GameSetting.CURRENT_DISPLAY,0)
	if GameSetting.isFullScreen():
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	#ProjectSettings
# 新游戏
func _on_new_game_button_pressed():
	chose_difficulty.show()


# 读取存档
func _on_load_save_button_pressed():
	pass # Replace with function body.


# 系统设置进入
func _on_setting_button_pressed():
	$CanvasLayer/SettingControl.show()
# 系统设置保存
func _on_save_setting_button_pressed():
	if language.text == "S_ENGLISH":
		GameSetting.setLanguage("en")
	else :	
		GameSetting.setLanguage("zh")
	if screensetting.is_pressed():
		GameSetting.setFullScreen(true)
	else:
		GameSetting.setFullScreen(false)
	get_tree().change_scene_to_file("res://scenes/Main.tscn")


func _on_check_button_pressed():
	pass # Replace with function body.

# 致谢
func _on_info_button_pressed():
	$CanvasLayer/InfoControl.show()

func _on_close_button_pressed():
	$CanvasLayer/InfoControl.hide()

# 开始游戏
func _on_start_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/NewGame.tscn")

# 退出游戏
func _on_exit_button_pressed():
	get_tree().quit()


