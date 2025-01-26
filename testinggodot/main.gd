extends Node2D

@onready var bubble_manager = $BubbleManager
@onready var cleaner = $Cleaner

@onready var hud: HUD = $HUD

@onready var audio_player: AudioStreamPlayer2D = $MainBGPlayer

# based on number of dirt (25) + dust bunnies (50)
# hard-coded for now
var clean_total: float = 150.0 + 150.0
var clean_current: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	cleaner.connect("cleaner_shot_bubble", Callable(bubble_manager, "handle_bubble_spawned"))
	cleaner.connect("cleaner_health_change", Callable(hud, "handle_health_change"))
	
	if audio_player and not audio_player.playing:
		audio_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func clean_change(amount: float):
	print("Main clean_change prior: ", clean_current)
	print("Main clean_change amount: ", amount)
	clean_current = minf(clean_current + amount, clean_total)
	print("Main clean_change current: ", clean_current)
	var clean_pct = clean_current / clean_total * 100
	hud.handle_clean_change(clean_pct)

	if clean_current >= clean_total:
		level_won()

func level_won():
	print("Main level_won")
	get_tree().change_scene_to_file("res://game_won.tscn")

func _on_tree_exiting() -> void:
	if audio_player and audio_player.playing:
		audio_player.stop()
