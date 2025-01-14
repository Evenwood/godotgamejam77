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
			pass
		"food":
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
		
	

	
