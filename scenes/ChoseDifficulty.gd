extends Control

@onready var button_1 = $Panel/MarginContainer/VBoxContainer/HBoxContainer/Panel/Button1
@onready var button_2 = $Panel/MarginContainer/VBoxContainer/HBoxContainer/Panel2/Button2
@onready var button_3 = $Panel/MarginContainer/VBoxContainer/HBoxContainer/Panel3/Button3
@onready var button_4 = $Panel/MarginContainer/VBoxContainer/HBoxContainer2/Panel/Button4
@onready var button_5 = $Panel/MarginContainer/VBoxContainer/HBoxContainer2/Panel2/Button5
@onready var button_6 = $Panel/MarginContainer/VBoxContainer/HBoxContainer2/Panel3/Button6
@onready var start_game_button = $Panel/StartGameButton

var choiseDic = {}

signal change

func _ready():
	var choisButton = ButtonGroup.new()
	button_1.button_group = choisButton
	button_2.button_group = choisButton
	button_3.button_group = choisButton
	button_4.button_group = choisButton
	button_5.button_group = choisButton
	button_6.button_group = choisButton
	connect("change",Callable(self,"_on_choise"))

func _on_button_1_pressed():
	choiseDic = {"aaa":20}
	emit_signal("change",choiseDic)

func _on_button_2_pressed():
	choiseDic = {"bbb":30}
	emit_signal("change",choiseDic)

func _on_button_3_pressed():
	choiseDic ={"ccc":40}
	emit_signal("change",choiseDic)

func _on_button_4_pressed():
	choiseDic ={"ddd":50}
	emit_signal("change",choiseDic)

func _on_button_5_pressed():
	choiseDic ={"eee":60}
	emit_signal("change",choiseDic)

func _on_button_6_pressed():
	choiseDic = {"fff":70}
	emit_signal("change",choiseDic)

func _on_choise(choiseDic):
	print("_on_choise",choiseDic)
	start_game_button.disabled = false
