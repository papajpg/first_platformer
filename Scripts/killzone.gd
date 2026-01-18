extends Area2D

@onready var timer: Timer = $Timer

const REBOUND = -200

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		#body.velocity.y = REBOUND
		print("You Died")
		Engine.time_scale = 0.5
		timer.start()
		body.get_node("CollisionShape2D").queue_free()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
