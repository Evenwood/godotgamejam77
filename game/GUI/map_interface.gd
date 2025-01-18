extends Control

@onready var dice_scene: Node2D = $PanelContainer/DiceScene

var dropzone_scene = preload("res://DropZoneControl/drop_zone.tscn")
var dropzones = []
var dropzone_positions = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	load_dropzones()
	setup_dropzone_positions()
	dice_scene.position = Vector2(800, 945)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_dropzones() -> void:
	var grid_columns = 10
	var i = 0
	var spacing = 100
	for key in Datatypes.ACTIONS.keys():
		var dropzone = dropzone_scene.instantiate()
		dropzones.append(dropzone)
		add_child(dropzone)
		var text = key
		if key == "DarkRitual":
			text = "Dark Ritual"
		elif key == "OtherworldlyRitual":
			text = "Otherworldly Ritual"
		elif key == "ForbiddenResearch":
			text = "Forbidden Research"
		dropzone.set_label_text(text)
		dropzone.set_info_text(text)
		
		var row = i / grid_columns
		var col = i % grid_columns
		dropzone.position = Vector2(col * spacing, row * spacing)
		i += 1

func setup_dropzone_positions() -> void:
	# Diplomacy, Clairvoyance, Harvest, Explore, Market, Shrine, Tower, Prison, Barracks, 
	# Academy, Charity, Hold, Infrastructure, DarkRitual, Warfare, OtherworldlyRitual, Revelry, 
	# ForbiddenResearch
	dropzone_positions["Diplomacy"] = Vector2(710, 430)
	dropzone_positions["Clairvoyance"] = Vector2(605, 460)
	dropzone_positions["Harvest"] = Vector2(400, 360)
	dropzone_positions["Explore"] = Vector2(900, 540)
	dropzone_positions["Market"] = Vector2(680, 290)
	dropzone_positions["Shrine"] = Vector2(705, 200)
	dropzone_positions["Tower"] = Vector2(255, 300)
	dropzone_positions["Prison"] = Vector2(785, 150)
	dropzone_positions["Barracks"] = Vector2(837, 85)
	dropzone_positions["Academy"] = Vector2(188, 390)
	dropzone_positions["Charity"] = Vector2(592, 390)
	dropzone_positions["Hold"] = Vector2(897, 265)
	dropzone_positions["Infrastructure"] = Vector2(900, 430)
	dropzone_positions["DarkRitual"] = Vector2(390, 270)
	dropzone_positions["Warfare"] = Vector2(470, 65)
	dropzone_positions["OtherworldlyRitual"] = Vector2(285, 85)
	dropzone_positions["Revelry"] = Vector2(460, 430)
	dropzone_positions["ForbiddenResearch"] = Vector2(95, 230)
	var i = 0
	for key in Datatypes.ACTIONS.keys():
		if(dropzone_positions.has(key)):
			dropzones[i].position = dropzone_positions[key]
		i += 1
