extends Area2D

const JUMPSCALE = 1.1
signal player_jumped


func _on_body_entered(body):
	if body is CharacterBody2D:
		body.velocity.y = -body.velocity.y * JUMPSCALE
		player_jumped.emit()
	
