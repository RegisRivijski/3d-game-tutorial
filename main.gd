extends Node3D

@export var mob_scene: PackedScene

func _ready():
	$UserInterface/Retry.hide()
	$Cylinders.queue_free()

func _on_mob_timer_timeout() -> void:
	$SpawnPath/SpawnLocation.progress_ratio = randf()
	var mob_spawn_position = $SpawnPath/SpawnLocation.position
	var player_position = $Player.position
	var mob = mob_scene.instantiate()

	mob.initialize(mob_spawn_position, player_position)
	mob.squashed.connect($UserInterface/ScoreLabel._on_mob_squashed.bind())

	add_child(mob)

func _on_player_hit() -> void:
	$MobTimer.stop()
	$UserInterface/Retry.show()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") && $UserInterface/Retry.visible:
		get_tree().reload_current_scene()
