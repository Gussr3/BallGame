extends CharacterBody2D

var speed = 10
var player_value : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position = position.move_toward($MarkerDir.global_position, speed)
	look_at(get_global_mouse_position())
	$MarkerDir.look_at(get_global_mouse_position())
	move_and_slide()
	
	#assign player value
	$ValueMeter.text = str(player_value)
