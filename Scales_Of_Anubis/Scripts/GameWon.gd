extends Node2D

@onready var Anubis : AnimatedSprite2D = get_node("UI/Anubis")
@onready var button : Button = get_node("UI/Button")
@onready var musicSound : AudioStreamPlayer2D = get_node("AudioStreamPlayer2D")

var animationPlayed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var sound = preload("res://Audio/winning_sound.mp3")
	musicSound.stream = sound
	musicSound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !animationPlayed:
		Anubis.play("default")
		animationPlayed = true

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/intro.tscn")

func _on_anubis_animation_finished():
	Anubis.stop()
	Anubis.play("last")

func _on_anubis_animation_looped():
	Anubis.stop()
	Anubis.play("last")
