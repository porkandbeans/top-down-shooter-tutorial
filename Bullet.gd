extends Area2D

const SPEED = 750

func _physics_process(delta):
	position += transform.x * SPEED * delta

func _on_Bullet_body_entered(body):
	queue_free()
	body.queue_free()
