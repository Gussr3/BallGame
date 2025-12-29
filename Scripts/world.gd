extends Node2D


var spawning : bool
@onready var orb = preload("res://Scenes/orb.tscn")
@onready var bot = preload("res://Scenes/bot.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_orbs()
	spawn_bots()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_orbs():
	for x in range(0, 1000):
		var orb_instance = orb.instantiate()
		add_child(orb_instance)
		orb_instance.position = Vector2(RandomNumberGenerator.new().randi_range(-20000, 20000), RandomNumberGenerator.new().randi_range(-20000, 20000))

func spawn_bots():
	for x in range(0, 30):
		var bot_instance = bot.instantiate()
		add_child(bot_instance)
		bot_instance.position = Vector2(RandomNumberGenerator.new().randi_range(-2000, 2000), RandomNumberGenerator.new().randi_range(-20000, 20000))
	
	
	
	
	
	
	

func _on_timer_timeout() -> void:
	spawning = false
