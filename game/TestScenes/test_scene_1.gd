extends Node2D

@onready var drop_zone_1: Area2D = $DropZone1
@onready var drop_zone_2: Area2D = $DropZone2
@onready var dice_scene: Node2D = $DiceScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drop_zone_1.position = Vector2(600, 400)
	drop_zone_2.position = Vector2(300, 120)
	dice_scene.position = Vector2(520, 595)
	#dice_scene.position = Vector2(0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
