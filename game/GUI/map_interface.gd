extends Control

@onready var dice_scene: Node2D = $PanelContainer/DiceScene
@onready var pause_menu = $PanelContainer2/PauseMenu
@onready var stat_screen = $StatScreen
@onready var influence: Button = $StatMargins/StatGrid/Influence
@onready var population: Button = $StatMargins/StatGrid/Population
@onready var wealth: Button = $StatMargins/StatGrid/Wealth
@onready var food: Button = $StatMargins/StatGrid/Food
@onready var materials: Button = $StatMargins/StatGrid/Materials
@onready var happiness: Button = $StatMargins/StatGrid/Happiness
@onready var health: Button = $StatMargins/StatGrid/Health
@onready var freedom: Button = $StatMargins/StatGrid/Freedom
@onready var faith: Button = $StatMargins/StatGrid/Faith
@onready var education: Button = $StatMargins/StatGrid/Education
@onready var magic: Button = $StatMargins/StatGrid/Magic
@onready var military_strength: Button = $StatMargins/StatGrid/MilitaryStrength
@onready var foreign_relations: Button = $StatMargins/StatGrid/ForeignRelations
@onready var stat_info: Label = $StatInfo

var dropzone_scene = preload("res://DropZoneControl/drop_zone.tscn")
#var Actions = preload("res://ActionControl/actions.gd")
var dropzones = []
var dropzone_positions = {}
var paused = false;
var turn_order = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	load_dropzones()
	setup_dropzone_positions()
	dice_scene.position = Vector2(800, 945)

func _process(delta):
	influence.text = "Inf: %d" % [State.influence]
	population.text = "Pop: %d" % [State.population]
	wealth.text = "Wea: %d" % [State.wealth]
	food.text = "Food: %d" % [State.food]
	materials.text = "Mat: %d" % [State.materials]
	happiness.text = "Hap: %d" % [State.happiness]
	health.text = "Hea: %d" % [State.health]
	freedom.text = "Free: %d" % [State.freedom]
	faith.text = "Fai: %d" % [State.faith]
	education.text = "Edu: %d" % [State.education]
	magic.text = "Mag: %d" % [State.magic]
	military_strength.text = "Mil Str: %d" % [State.military_strength]
	foreign_relations.text = "For Rel: %d" % [State.foreign_relations]
	if Input.is_action_just_pressed("escape"):
		stat_screen.hide()
		stat_info.hide()
		pauseMenu()

#Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func load_dropzones() -> void:
	var grid_columns = 10
	var i = 0
	var spacing = 100
	for key in Datatypes.ACTIONS.keys():
		var dropzone = dropzone_scene.instantiate()
		dropzone.set_action_id(Datatypes.ACTIONS[key])
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
		
func clear_dropzones():
	for dropzone in dropzones:
		dropzone.clear()

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

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else: 
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
	
#func victoryScreen():
	#if turn_order = 5
		#pass
		#


func _on_button_pressed() -> void:
	stat_info.hide()
	stat_screen.show()


func _on_influence_pressed() -> void:
	stat_info.text = "Influence measures your control over the populace as a whole. As it grows, the nation grows wealthier; however, your people lose more and more freedom."
	stat_info.show()


func _on_population_pressed() -> void:
	stat_info.text = "Population measures the number of working-age citizens of your nations. As it grows, the nation grows wealther; however, the demand for food increases in turn."
	stat_info.show()


func _on_wealth_pressed() -> void:
	stat_info.text = "Wealth measures the currency available to the people and the strength of the nation's trade. As it grows, more education is made available to your people; however, material desire causes people to lose their faith."
	stat_info.show()


func _on_food_pressed() -> void:
	stat_info.text = "Food measures the nutrition available to fill the hungry bellies of your people. With more food, your people will be healthier; however, maintaining food stores comes at monetary cost."
	stat_info.show()


func _on_materials_pressed() -> void:
	stat_info.text = "Materials measures the amount of common supplies used for industry and artistry. More materials available leads to more food being available; however, material desire causes people to lose their faith."
	stat_info.show()


func _on_happiness_pressed() -> void:
	stat_info.text = "Happiness measures the satisfaction of your people and is a core metric of success. The happier your people, the more wealth will come in; however, they will be less inclined to work with foreign powers."
	stat_info.show()

func _on_health_pressed() -> void:
	stat_info.text = "Health measures the vital spirit, life energy, and overall physical condition of your people. A healthy populace is a growing populace; however, high health does not lead to great piety."
	stat_info.show()


func _on_freedom_pressed() -> void:
	stat_info.text = "Freedom measures the liberty and independence of your people. The freer your people, the happier they'll be; however, a highly free populace won't offer much in times of war."
	stat_info.show()


func _on_faith_pressed() -> void:
	stat_info.text = "Faith measures how connected to the gods of fate your people are. Great faith leads to great magical power; however, reliance on faith will lead to intellectual degredation."
	stat_info.show()


func _on_education_pressed() -> void:
	stat_info.text = "Education measures the academic and intellectual prowess of your people. A more educated populace will allow for the use and discovery of more materials; however, it will also be harder to exert influence over them."
	stat_info.show()


func _on_magic_pressed() -> void:
	stat_info.text = "Magic measures the arcane and primordial power of your nation. Bolstering your magic shall grow your military might; however, investing in magic demands great amounts of exotic materials."
	stat_info.show()


func _on_military_strength_pressed() -> void:
	stat_info.text = "Military strength measures the might of your nation. As your nation grows stronger, as does the influence you can exert over it; however, investing in the military does little for the happiness of the nation."
	stat_info.show()


func _on_foreign_relations_pressed() -> void:
	stat_info.text = "Foreign relations measures the positive connections you have formed with other nations. As it grows, new people will come in, adding to your population; however, focus on external factors will decrease your influence over internal factors."
	stat_info.show()
