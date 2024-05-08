extends Node2D

@onready var loadTimer = $Timer

func _ready():
	loadTimer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
