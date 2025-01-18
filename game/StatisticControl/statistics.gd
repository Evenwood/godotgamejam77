# Author: Darien Roach
# Date Created: 1/13/2025
# Purpose: The main script for the statistics screen - used to handle processing statistics and their visuals

extends Node

# Constant used to determine how much the value is modified for positive and negative correlation
const CORRELATION_QUOTIENT = 2

# Constants determine max value of statistics
const INFLUENCE_MAX = 100
const WEALTH_MAX = 1000
const FREEDOM_MAX = 50
const HEALTH_MAX = 50
const FAITH_MAX = 50
const EDUCATION_MAX = 50
const FOREIGN_RELATIONS_MAX = 50
const MILITARY_STRENGTH_MAX = 50
const POPULATION_MAX = 1000
const MATERIALS_MAX = 100
const MAGIC_MAX = 50
const FOOD_MAX = 100
const HAPPINESS_MAX = 50

# Constants determine min value of statistics
const INFLUENCE_MIN = -100
const WEALTH_MIN = 0
const FREEDOM_MIN = -50
const HEALTH_MIN = -50
const FAITH_MIN = -50
const EDUCATION_MIN = -50
const FOREIGN_RELATIONS_MIN = -50
const MILITARY_STRENGTH_MIN = -50
const POPULATION_MIN = 0
const MATERIALS_MIN = 0
const MAGIC_MIN = -50
const FOOD_MIN = 0
const HAPPINESS_MIN = -50

# Constants determine positive correlation of statistics
const INFLUENCE_POS_CORRELATION = Datatypes.STATISTICS.Wealth
const WEALTH_POS_CORRELATION = Datatypes.STATISTICS.Education
const FREEDOM_POS_CORRELATION = Datatypes.STATISTICS.Happiness
const HEALTH_POS_CORRELATION = Datatypes.STATISTICS.Population
const FAITH_POS_CORRELATION = Datatypes.STATISTICS.Magic
const EDUCATION_POS_CORRELATION = Datatypes.STATISTICS.Materials
const FOREIGN_RELATIONS_POS_CORRELATION = Datatypes.STATISTICS.Population
const MILITARY_STRENGTH_POS_CORRELATION = Datatypes.STATISTICS.Influence
const POPULATION_POS_CORRELATION = Datatypes.STATISTICS.Wealth
const MATERIALS_POS_CORRELATION = Datatypes.STATISTICS.Food
const MAGIC_POS_CORRELATION = Datatypes.STATISTICS.MilitaryStrength
const FOOD_POS_CORRELATION = Datatypes.STATISTICS.Health
const HAPPINESS_POS_CORRELATION = Datatypes.STATISTICS.Wealth

# Constants determine negative correlation of statistics
const INFLUENCE_NEG_CORRELATION = Datatypes.STATISTICS.Freedom
const WEALTH_NEG_CORRELATION = Datatypes.STATISTICS.Faith
const FREEDOM_NEG_CORRELATION = Datatypes.STATISTICS.MilitaryStrength
const HEALTH_NEG_CORRELATION = Datatypes.STATISTICS.Faith
const FAITH_NEG_CORRELATION = Datatypes.STATISTICS.Education
const EDUCATION_NEG_CORRELATION = Datatypes.STATISTICS.Influence
const FOREIGN_RELATIONS_NEG_CORRELATION = Datatypes.STATISTICS.Influence
const MILITARY_STRENGTH_NEG_CORRELATION = Datatypes.STATISTICS.Happiness
const POPULATION_NEG_CORRELATION = Datatypes.STATISTICS.Food
const MATERIALS_NEG_CORRELATION = Datatypes.STATISTICS.Faith
const MAGIC_NEG_CORRELATION = Datatypes.STATISTICS.Materials
const FOOD_NEG_CORRELATION = Datatypes.STATISTICS.Wealth
const HAPPINESS_NEG_CORRELATION = Datatypes.STATISTICS.Faith

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func negativeCorrelation(statistic: Datatypes.STATISTICS, val: int) -> void:
	decreaseStatistic(statistic, floor(val/CORRELATION_QUOTIENT))
			
func positiveCorrelation(statistic: Datatypes.STATISTICS, val: int) -> void:
	increaseStatistic(statistic, floor(val/CORRELATION_QUOTIENT))

func checkCorrelation(val: int) -> bool:
	if(floor(val/CORRELATION_QUOTIENT) > 1):
		return true
	else:
		return false

func increaseStatistic(statistic: Datatypes.STATISTICS, val: int) -> void:
	match statistic:
		Datatypes.STATISTICS.Education:
			if((State.education + val) > EDUCATION_MAX):
				State.education = EDUCATION_MAX
			else:
				State.education += val
			if(checkCorrelation(val)):
				positiveCorrelation(EDUCATION_POS_CORRELATION, val)
				negativeCorrelation(EDUCATION_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Faith:
			if((State.faith + val) > FAITH_MAX):
				State.faith = FAITH_MAX
			else:
				State.faith += val
			if(checkCorrelation(val)):
				positiveCorrelation(FAITH_POS_CORRELATION, val)
				negativeCorrelation(FAITH_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Food:
			if((State.food + val) > FOOD_MAX):
				State.food = FOOD_MAX
			else:
				State.food += val
			if(checkCorrelation(val)):
				positiveCorrelation(FOOD_POS_CORRELATION, val)
				negativeCorrelation(FOOD_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Magic:
			if((State.magic + val) > MAGIC_MAX):
				State.magic = MAGIC_MAX
			else:
				State.magic += val
			if(checkCorrelation(val)):
				positiveCorrelation(MAGIC_POS_CORRELATION, val)
				negativeCorrelation(MAGIC_NEG_CORRELATION, val)
		Datatypes.STATISTICS.ForeignRelations:
			if((State.foreign_relations + val) > FOREIGN_RELATIONS_MAX):
				State.foreign_relations = FOREIGN_RELATIONS_MAX
			else:
				State.foreign_relations += val
			if(checkCorrelation(val)):
				positiveCorrelation(FOREIGN_RELATIONS_POS_CORRELATION, val)
				negativeCorrelation(FOREIGN_RELATIONS_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Freedom:
			if((State.freedom + val) > FREEDOM_MAX):
				State.freedom = FREEDOM_MAX
			else:
				State.freedom += val
			if(checkCorrelation(val)):
				positiveCorrelation(FREEDOM_POS_CORRELATION, val)
				negativeCorrelation(FREEDOM_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Health:
			if((State.health + val) > HEALTH_MAX):
				State.health = HEALTH_MAX
			else:
				State.health += val
			if(checkCorrelation(val)):
				positiveCorrelation(HEALTH_POS_CORRELATION, val)
				negativeCorrelation(HEALTH_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Influence:
			if((State.influence + val) > INFLUENCE_MAX):
				State.influence = INFLUENCE_MAX
			else:
				State.influence += val
			if(checkCorrelation(val)):
				positiveCorrelation(INFLUENCE_POS_CORRELATION, val)
				negativeCorrelation(INFLUENCE_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Magic:
			if((State.magic + val) > MAGIC_MAX):
				State.magic = MAGIC_MAX
			else:
				State.magic += val
			if(checkCorrelation(val)):
				positiveCorrelation(MAGIC_POS_CORRELATION, val)
				negativeCorrelation(MAGIC_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Materials:
			if((State.materials + val) > MATERIALS_MAX):
				State.materials = MATERIALS_MAX
			else:
				State.materials += val
			if(checkCorrelation(val)):
				positiveCorrelation(MATERIALS_POS_CORRELATION, val)
				negativeCorrelation(MATERIALS_NEG_CORRELATION, val)
		Datatypes.STATISTICS.MilitaryStrength:
			if((State.military_strength + val) > MILITARY_STRENGTH_MAX):
				State.military_strength = MILITARY_STRENGTH_MAX
			else:
				State.military_strength += val
			if(checkCorrelation(val)):
				positiveCorrelation(MILITARY_STRENGTH_POS_CORRELATION, val)
				negativeCorrelation(MILITARY_STRENGTH_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Population:
			if((State.population + val) > POPULATION_MAX):
				State.population = POPULATION_MAX
			else:
				State.population += val
			if(checkCorrelation(val)):
				positiveCorrelation(POPULATION_POS_CORRELATION, val)
				negativeCorrelation(POPULATION_NEG_CORRELATION, val)
		Datatypes.STATISTICS.Wealth:
			if((State.wealth + val) > WEALTH_MAX):
				State.wealth = WEALTH_MAX
			else:
				State.wealth += val
			if(checkCorrelation(val)):
				positiveCorrelation(WEALTH_POS_CORRELATION, val)
				negativeCorrelation(WEALTH_NEG_CORRELATION, val)
		_:
			pass

func decreaseStatistic(statistic: Datatypes.STATISTICS, val: int) -> void:
	match statistic:
		Datatypes.STATISTICS.Education:
			if((State.education - val) < EDUCATION_MIN):
				State.education = EDUCATION_MIN
			else:
				State.education -= val
			if(checkCorrelation(val)):
				positiveCorrelation(EDUCATION_NEG_CORRELATION, val)
				negativeCorrelation(EDUCATION_POS_CORRELATION, val)
		Datatypes.STATISTICS.Faith:
			if((State.faith - val) < FAITH_MIN):
				State.faith = FAITH_MIN
			else:
				State.faith -= val
			if(checkCorrelation(val)):
				positiveCorrelation(FAITH_NEG_CORRELATION, val)
				negativeCorrelation(FAITH_POS_CORRELATION, val)
		Datatypes.STATISTICS.Food:
			if((State.food - val) < FOOD_MIN):
				State.food = FOOD_MIN
			else:
				State.food -= val
			if(checkCorrelation(val)):
				positiveCorrelation(FOOD_NEG_CORRELATION, val)
				negativeCorrelation(FOOD_POS_CORRELATION, val)
		Datatypes.STATISTICS.Magic:
			if((State.magic - val) < MAGIC_MIN):
				State.magic = MAGIC_MIN
			else:
				State.magic -= val
			if(checkCorrelation(val)):
				positiveCorrelation(MAGIC_NEG_CORRELATION, val)
				negativeCorrelation(MAGIC_POS_CORRELATION, val)
		Datatypes.STATISTICS.ForeignRelations:
			if((State.foreign_relations - val) < FOREIGN_RELATIONS_MIN):
				State.foreign_relations = FOREIGN_RELATIONS_MIN
			else:
				State.foreign_relations -= val
			if(checkCorrelation(val)):
				positiveCorrelation(FOREIGN_RELATIONS_NEG_CORRELATION, val)
				negativeCorrelation(FOREIGN_RELATIONS_POS_CORRELATION, val)
		Datatypes.STATISTICS.Freedom:
			if((State.freedom - val) < FREEDOM_MIN):
				State.freedom = FREEDOM_MIN
			else:
				State.freedom -= val
			if(checkCorrelation(val)):
				positiveCorrelation(FREEDOM_NEG_CORRELATION, val)
				negativeCorrelation(FREEDOM_POS_CORRELATION, val)
		Datatypes.STATISTICS.Health:
			if((State.health - val) < HEALTH_MIN):
				State.health = HEALTH_MIN
			else:
				State.health -= val
			if(checkCorrelation(val)):
				positiveCorrelation(HEALTH_NEG_CORRELATION, val)
				negativeCorrelation(HEALTH_POS_CORRELATION, val)
		Datatypes.STATISTICS.Influence:
			if((State.influence - val) < INFLUENCE_MIN):
				State.influence = INFLUENCE_MIN
			else:
				State.influence -= val
			if(checkCorrelation(val)):
				positiveCorrelation(INFLUENCE_NEG_CORRELATION, val)
				negativeCorrelation(INFLUENCE_POS_CORRELATION, val)
		Datatypes.STATISTICS.Magic:
			if((State.magic - val) < MAGIC_MIN):
				State.magic = MAGIC_MIN
			else:
				State.magic -= val
			if(checkCorrelation(val)):
				positiveCorrelation(MAGIC_NEG_CORRELATION, val)
				negativeCorrelation(MAGIC_POS_CORRELATION, val)
		Datatypes.STATISTICS.Materials:
			if((State.materials - val) < MATERIALS_MIN):
				State.materials = MATERIALS_MIN
			else:
				State.materials -= val
			if(checkCorrelation(val)):
				positiveCorrelation(MATERIALS_NEG_CORRELATION, val)
				negativeCorrelation(MATERIALS_POS_CORRELATION, val)
		Datatypes.STATISTICS.MilitaryStrength:
			if((State.military_strength - val) < MILITARY_STRENGTH_MIN):
				State.military_strength = MILITARY_STRENGTH_MIN
			else:
				State.military_strength -= val
			if(checkCorrelation(val)):
				positiveCorrelation(MILITARY_STRENGTH_NEG_CORRELATION, val)
				negativeCorrelation(MILITARY_STRENGTH_POS_CORRELATION, val)
		Datatypes.STATISTICS.Population:
			if((State.population - val) < POPULATION_MIN):
				State.population = POPULATION_MIN
			else:
				State.population -= val
			if(checkCorrelation(val)):
				positiveCorrelation(POPULATION_NEG_CORRELATION, val)
				negativeCorrelation(POPULATION_POS_CORRELATION, val)
		Datatypes.STATISTICS.Wealth:
			if((State.wealth - val) < WEALTH_MIN):
				State.wealth = WEALTH_MIN
			else:
				State.wealth -= val
			if(checkCorrelation(val)):
				positiveCorrelation(WEALTH_NEG_CORRELATION, val)
				negativeCorrelation(WEALTH_POS_CORRELATION, val)
		_:
			pass
		
	

	


func _on_button_pressed() -> void:
	pass # Replace with function body.
