extends Node2D

@onready var Anubis : AnimatedSprite2D = get_node("UI/Anubis")
@onready var Anubis2 : AnimatedSprite2D = get_node("UI/Anubis2")
@onready var button : Button = get_node("UI/Button")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Anubis.play("default")
	Anubis2.play("default")


func _on_button_pressed():
	if GlobalVariable.sceneGlobal == 2:
		get_tree().change_scene_to_file("res://Scenes/second_level.tscn")
	elif GlobalVariable.sceneGlobal == 3:
		get_tree().change_scene_to_file("res://Scenes/third_level.tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/intro.tscn")

