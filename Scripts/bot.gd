extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var speed : int = 10
var rayCasts = []
var rayDirections = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in $RayCasts.get_children():
		if child is RayCast2D:
			rayCasts.append(child)
			
			
	for child in $RayCasts.get_children():
		if child is RayCast2D:
			rayDirections.append(get_ray_direction(child))
			
	print(rayCasts)
	print(rayDirections)
	
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_ray_collision()
	
func check_ray_collision():
	for ray in rayCasts:
		if ray.is_colliding():
			#fill upp
			pass
			
func get_ray_direction(ray: RayCast2D):
	return ray.global_transform.x
		
