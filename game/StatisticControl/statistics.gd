# Author: Darien Roach
# Date Created: 1/13/2025
# Purpose: The main script for the statistics screen - used to handle processing statistics and their visuals

extends Node

# Variables representing each bar and label in the stat screen
@onready var influence_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/InfluenceStatSet/Stat")
@onready var influence_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/InfluenceStatSet/ProgressBar")
@onready var wealth_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/WealthStatSet/Stat")
@onready var wealth_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/WealthStatSet/ProgressBar")
@onready var freedom_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/FreedomStatSet/Stat")
@onready var freedom_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/FreedomStatSet/ProgressBar")
@onready var health_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/HealthStatSet/Stat")
@onready var health_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/HealthStatSet/ProgressBar")
@onready var faith_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/FaithStatSet/Stat")
@onready var faith_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/FaithStatSet/ProgressBar")
@onready var education_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/EducationStatSet/Stat")
@onready var education_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/EducationStatSet/ProgressBar")
@onready var foreign_relations_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/ForeignRelationsStatSet/Stat")
@onready var foreign_relations_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/ForeignRelationsStatSet/ProgressBar")
@onready var military_strength_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/MilitaryStrengthStatSet/Stat")
@onready var military_strength_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/MilitaryStrengthStatSet/ProgressBar")
@onready var population_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/PopulationStatSet/Stat")
@onready var population_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/PopulationStatSet/ProgressBar")
@onready var materials_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/MaterialsStatSet/Stat")
@onready var materials_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/MaterialsStatSet/ProgressBar")
@onready var magic_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/MagicStatSet/Stat")
@onready var magic_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/MagicStatSet/ProgressBar")
@onready var food_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/FoodStatSet/Stat")
@onready var food_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/FoodStatSet/ProgressBar")
@onready var happiness_label = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/HappinessStatSet/Stat")
@onready var happiness_bar = get_node("CanvasLayer/Panel/MarginContainer/GridContainer/HappinessStatSet/ProgressBar")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	influence_bar.min_value = StatisticalGrowth.INFLUENCE_MIN
	influence_bar.max_value = StatisticalGrowth.INFLUENCE_MAX
	wealth_bar.min_value = StatisticalGrowth.WEALTH_MIN
	wealth_bar.max_value = StatisticalGrowth.WEALTH_MAX
	freedom_bar.min_value = StatisticalGrowth.FREEDOM_MIN
	freedom_bar.max_value = StatisticalGrowth.FREEDOM_MAX
	health_bar.min_value = StatisticalGrowth.HEALTH_MIN
	health_bar.max_value = StatisticalGrowth.HEALTH_MAX
	faith_bar.min_value = StatisticalGrowth.FAITH_MIN
	faith_bar.max_value = StatisticalGrowth.FAITH_MAX
	education_bar.min_value = StatisticalGrowth.EDUCATION_MIN
	education_bar.max_value = StatisticalGrowth.EDUCATION_MAX
	foreign_relations_bar.min_value = StatisticalGrowth.FOREIGN_RELATIONS_MIN
	foreign_relations_bar.max_value = StatisticalGrowth.FOREIGN_RELATIONS_MAX
	military_strength_bar.min_value = StatisticalGrowth.MILITARY_STRENGTH_MIN
	military_strength_bar.max_value = StatisticalGrowth.MILITARY_STRENGTH_MAX
	population_bar.min_value = StatisticalGrowth.POPULATION_MIN
	population_bar.max_value = StatisticalGrowth.POPULATION_MAX
	materials_bar.min_value = StatisticalGrowth.MATERIALS_MIN
	materials_bar.max_value = StatisticalGrowth.MATERIALS_MAX
	magic_bar.min_value = StatisticalGrowth.MAGIC_MIN
	magic_bar.max_value = StatisticalGrowth.MAGIC_MAX
	food_bar.min_value = StatisticalGrowth.FOOD_MIN
	food_bar.max_value = StatisticalGrowth.FOOD_MAX
	happiness_bar.min_value = StatisticalGrowth.HAPPINESS_MIN
	happiness_bar.max_value = StatisticalGrowth.HAPPINESS_MAX


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	setBarsandLabels()
	
func setBarsandLabels() -> void:
	influence_label.text = "Influence: %d" % [State.influence]
	influence_bar.value = State.influence
	wealth_label.text = "Wealth: %d" % [State.wealth]
	wealth_bar.value = State.wealth
	freedom_label.text = "Freedom: %d" % [State.freedom]
	freedom_bar.value = State.freedom
	health_label.text = "Health: %d" % [State.health]
	health_bar.value = State.health
	faith_label.text = "Faith: %d" % [State.faith]
	faith_bar.value = State.faith
	education_label.text = "Education: %d" % [State.education]
	education_bar.value = State.education
	foreign_relations_label.text = "Foreign Relations: %d" % [State.foreign_relations]
	foreign_relations_bar.value = State.foreign_relations
	military_strength_label.text = "Military Strength: %d" % [State.military_strength]
	military_strength_bar.value = State.military_strength
	population_label.text = "Population: %d" % [State.population]
	population_bar.value = State.population
	materials_label.text = "Materials: %d" % [State.materials]
	materials_bar.value = State.materials
	magic_label.text = "Magic: %d" % [State.magic]
	magic_bar.value = State.magic
	food_label.text = "Food: %d" % [State.food]
	food_bar.value = State.food
	happiness_label.text = "Happiness: %d" % [State.happiness]
	happiness_bar.value = State.happiness

func _on_close_requested() -> void:
	$".".hide()
