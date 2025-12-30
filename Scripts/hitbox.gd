extends Area2D

var leeching : bool
var victim : Node2D
var stealing_factor = 0.01

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	steal_points()

func steal_points():
	if victim is CharacterBody2D:
		victim.player_value -= stealing_factor
		self.get_parent().player_value += stealing_factor


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("steal_points"):
		stealing_factor = 0.01
		victim = area.get_parent()
		print(victim)


func _on_area_exited(area: Area2D) -> void:
	stealing_factor = 0
	victim = $"."
	
