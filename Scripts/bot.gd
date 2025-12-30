extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var speed : int = 100
var rayCasts = []
var rayDirections = []

var player_value : int = rng.randi_range(3, 15)
var is_stuck : bool
var avoid_pos : Vector2
var random_pos = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in $RayCasts.get_children():
		if child is RayCast2D:
			rayCasts.append(child)
			
			
	for child in $RayCasts.get_children():
		if child is RayCast2D:
			rayDirections.append(get_ray_direction(child))
			
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_ray_collision()
	scale_player()
	die()
	
	#assign value
	$ValueMeter.text = str(player_value)
	if is_stuck:
		get_unstuck()
		move_and_slide()
	
	
	
func check_ray_collision():
	for ray in rayCasts:
		if ray.is_colliding():
			is_stuck = false
			var colliding_ray = ray
			var colliding_ray_index = rayCasts.find(colliding_ray)
			AI_movement(colliding_ray_index)
		elif !ray.is_colliding():
			is_stuck = true
			
			
func get_ray_direction(ray: RayCast2D):
	return ray.global_transform.y
	
func AI_movement(collidingRay : int):
	velocity = rayDirections[collidingRay] * speed

	move_and_slide()

func get_unstuck():
	velocity.x = random_pos.x * speed
	velocity.y = random_pos.y * speed



func _on_movement_tick_timeout() -> void:
	random_pos.x = rng.randi_range(-10, 10)
	random_pos.y = rng.randi_range(-10, 10)
	
func scale_player():
	self.scale = Vector2(player_value/10, player_value/10)
	
func die():
	if player_value <= 1:
		queue_free()
