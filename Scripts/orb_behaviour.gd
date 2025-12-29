extends StaticBody2D

var rng = RandomNumberGenerator.new()
var scaling_const = rng.randf_range(0.3, 2)
var value = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.modulate = Color(rng.randf_range(0, 1), rng.randf_range(0, 1), rng.randf_range(0, 1))
	self.scale *= scaling_const
	value *= scaling_const

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		#scale colliders---------------------
		body.scale += Vector2(value, value) / 50
		#give value-----------------------------
		body.player_value += round(scaling_const)
		#remove+animations-----------------------------------------
		var tween = create_tween().tween_property($Sprite2D, "scale", Vector2(0, 0), 0.3)
		await get_tree().create_timer(0.3).timeout
		queue_free()
	
	
	
