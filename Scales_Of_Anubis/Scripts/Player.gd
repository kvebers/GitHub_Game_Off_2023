extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = get_node("Sprite")
@onready var shield : Sprite2D = get_node("shield")
@onready var khopesh : Sprite2D = get_node("khopesh")

var speed : float = 200.0
var speedMP : float = 8.0
var speedDIV : float = 3.0
var shieldOffset : float = 12.0
var khopeshOffset : float = 32.0
var health: float = 100.0

func _physics_process(_delta):
	var totalVelocity : float = sqrt(velocity.x * velocity.x + velocity.y * velocity.y)
	if velocity.x != 0:
		if velocity.x > 0 && velocity.x < (speed / speedDIV / 2):
			velocity.x = 0
		elif velocity.x < 0 && velocity.x > -(speed / speedDIV / 2):
			velocity.x = 0
		elif velocity.x > 0:
			velocity.x -= (totalVelocity / speedDIV)
		elif velocity.x < 0:
			velocity.x += (totalVelocity / speedDIV)
	if velocity.y != 0:
		if velocity.y > 0 && velocity.y < (speed / speedDIV / 2):
			velocity.y = 0
		elif velocity.y < 0 && velocity.y > -(speed / speedDIV / 2):
			velocity.y = 0
		elif velocity.y > 0:
			velocity.y -= (totalVelocity / speedDIV)
		elif velocity.y < 0:
			velocity.y += (totalVelocity / speedDIV)
	if Input.is_action_pressed("move_up"):
		if velocity.y > - speed * speedMP:
			if totalVelocity < speed * speedMP:
				velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		if velocity.y < speed * speedMP:
			if totalVelocity < speed * speedMP:
				velocity.y += speed
	if Input.is_action_pressed("move_left"):
		if velocity.x > - speed * speedMP:
			if totalVelocity < speed * speedMP:
				velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		if velocity.x < speed * speedMP:
			if totalVelocity < speed * speedMP:
				velocity.x += speed
	var mouse_position = get_global_mouse_position()
	var direction = (mouse_position - sprite.global_position).normalized()
	if Input.is_action_pressed("left_click_down"):
		shield.position  = sprite.position + direction * shieldOffset
		shield.look_at(mouse_position)
	if Input.is_action_pressed("right_click_down"):
		khopesh.position  = sprite.position + direction * khopeshOffset
		khopesh.look_at(mouse_position)
	move_and_slide()
