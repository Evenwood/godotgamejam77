# Author: Darien Roach
# Date Created: 1/13/2025
# Purpose: The main script for the statistics screen - used to handle processing statistics and their visuals

extends Node

const CORRELATION_QUOTIENT = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func negativeCorrelation(statistic: String, val: int) -> void:
	decreaseStatistic(statistic, floor(val/CORRELATION_QUOTIENT))
			
func positiveCorrelation(statistic: String, val: int) -> void:
	increaseStatistic(statistic, floor(val/CORRELATION_QUOTIENT))

func checkCorrelation(val: int) -> bool:
	if(floor(val/CORRELATION_QUOTIENT) > 1):
		return true
	else:
		return false

func increaseStatistic(statistic: String, val: int) -> void:
	match statistic:
		"education":
			if((State.education + val) > Education.max_value):
				State.education = Education.max_value
			else:
				State.education += val
			if(checkCorrelation(val)):
				positiveCorrelation(Education.positive_correlation, val)
				negativeCorrelation(Education.negative_correlation, val)
		"faith":
			if((State.faith + val) > Faith.max_value):
				State.faith = Faith.max_value
			else:
				State.faith += val
			if(checkCorrelation(val)):
				positiveCorrelation(Faith.positive_correlation, val)
				negativeCorrelation(Faith.negative_correlation, val)
		"food":
			if((State.food + val) > Food.max_value):
				State.food = Food.max_value
			else:
				State.food += val
			if(checkCorrelation(val)):
				positiveCorrelation(Food.positive_correlation, val)
				negativeCorrelation(Food.negative_correlation, val)
		"magic":
			if((State.magic + val) > Magic.max_value):
				State.magic = Magic.max_value
			else:
				State.magic += val
			if(checkCorrelation(val)):
				positiveCorrelation(Magic.positive_correlation, val)
				negativeCorrelation(Magic.negative_correlation, val)
		"foreign relations":
			if((State.foreign_relations + val) > ForeignRelations.max_value):
				State.foreign_relations = ForeignRelations.max_value
			else:
				State.foreign_relations += val
			if(checkCorrelation(val)):
				positiveCorrelation(ForeignRelations.positive_correlation, val)
				negativeCorrelation(ForeignRelations.negative_correlation, val)
		"freedom":
			if((State.freedom + val) > Freedom.max_value):
				State.freedom = Freedom.max_value
			else:
				State.freedom += val
			if(checkCorrelation(val)):
				positiveCorrelation(Freedom.positive_correlation, val)
				negativeCorrelation(Freedom.negative_correlation, val)
		"health":
			if((State.health + val) > Health.max_value):
				State.health = Health.max_value
			else:
				State.health += val
			if(checkCorrelation(val)):
				positiveCorrelation(Health.positive_correlation, val)
				negativeCorrelation(Health.negative_correlation, val)
		"influence":
			if((State.influence + val) > Influence.max_value):
				State.influence = Influence.max_value
			else:
				State.influence += val
			if(checkCorrelation(val)):
				positiveCorrelation(Influence.positive_correlation, val)
				negativeCorrelation(Influence.negative_correlation, val)
		"magic":
			if((State.magic + val) > Magic.max_value):
				State.magic = Magic.max_value
			else:
				State.magic += val
			if(checkCorrelation(val)):
				positiveCorrelation(Magic.positive_correlation, val)
				negativeCorrelation(Magic.negative_correlation, val)
		"materials":
			if((State.materials + val) > Materials.max_value):
				State.materials = Materials.max_value
			else:
				State.materials += val
			if(checkCorrelation(val)):
				positiveCorrelation(Materials.positive_correlation, val)
				negativeCorrelation(Materials.negative_correlation, val)
		"military strength":
			if((State.military_strength + val) > MilitaryStrength.max_value):
				State.military_strength = MilitaryStrength.max_value
			else:
				State.military_strength += val
			if(checkCorrelation(val)):
				positiveCorrelation(MilitaryStrength.positive_correlation, val)
				negativeCorrelation(MilitaryStrength.negative_correlation, val)
		"population":
			if((State.population + val) > Population.max_value):
				State.population = Population.max_value
			else:
				State.population += val
			if(checkCorrelation(val)):
				positiveCorrelation(Population.positive_correlation, val)
				negativeCorrelation(Population.negative_correlation, val)
		"wealth":
			if((State.wealth + val) > Wealth.max_value):
				State.wealth = Wealth.max_value
			else:
				State.wealth += val
			if(checkCorrelation(val)):
				positiveCorrelation(Wealth.positive_correlation, val)
				negativeCorrelation(Wealth.negative_correlation, val)
		_:
			pass

func decreaseStatistic(statistic: String, val: int) -> void:
	match statistic:
		"education":
			if((State.education - val) < Education.min_value):
				State.education = Education.min_value
			else:
				State.education -= val
			if(checkCorrelation(val)):
				positiveCorrelation(Education.negative_correlation, val)
				negativeCorrelation(Education.positive_correlation, val)
		"faith":
			pass
		"food":
			pass
		"magic":
			pass
		"foreign relations":
			pass
		"freedom":
			pass
		"health":
			pass
		"influence":
			pass
		"magic":
			pass
		"materials":
			pass
		"military strength":
			pass
		"population":
			pass
		"wealth":
			pass
		_:
			pass
		
	

	
