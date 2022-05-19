extends KinematicBody2D

export (PackedScene) var Bullet = preload("res://Bullet.tscn")

const SPEED = 300

var velocity = Vector2.ZERO

onready var collider = $CollisionShape2D

func _input(event):
	velocity = Vector2.ZERO
	if(Input.is_action_pressed("up")):
		velocity.y -= 1
	if(Input.is_action_pressed("down")):
		velocity.y += 1
	if(Input.is_action_pressed("left")):
		velocity.x -= 1
	if(Input.is_action_pressed("right")):
		velocity.x += 1
	if(Input.is_action_just_pressed("shoot")):
		shoot()
	
	velocity = velocity.normalized() * SPEED

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Face/Position2D.global_transform

func _physics_process(delta):
	look_at(get_global_mouse_position())
	collider.global_rotation = 0
	velocity = move_and_slide(velocity)
