# Author: Darien Roach
# Date Created: 1/16/2025
# Purpose: The main script for handling actions and processing their details
extends Node

# Constants to modify action output
const REDUCED_OUTPUT = 0.5
const OUTPUT = 1
const HIGH_OUTPUT = 2
const MAJOR_OUTPUT = 3

# Variables to adjust action efficacy
var diplomacy_mod = 0
var clairvoyance_mod = 0
var harvest_mod = 0
var explore_mod = 0
var market_mod = 0
var shrine_mod = 0
var tower_mod = 0
var prison_mod = 0
var barracks_mod = 0
var academy_mod = 0
var charity_mod = 0
var hold_mod = 0
var infrastructure_mod = 0
var dark_ritual_mod = 0
var warfare_mod = 0
var otherworldly_ritual_mod = 0
var revelry_mod = 0
var forbidden_research_mod = 0
var global_mod = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func resetGlobalMod() -> void:
	global_mod = 0

func modifyValue(modifier: int, val: int) -> int:
	if(val + global_mod < 0):
		val = 0
	else:
		val += global_mod
		
	if(val + modifier < 0):
		val = 0
	else:
		val += modifier
	
	return val

static func actionText(actionID: Datatypes.ACTIONS, val: int) -> String:
	var text = ""
	match actionID:
		Datatypes.ACTIONS.Diplomacy:
			#var rng = RandomNumberGenerator.new()
			#Statistics.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * MAJOR_OUTPUT)
			text = Datatypes.get_action_string(actionID)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.ForeignRelations) \
				+ " +" + str(val * MAJOR_OUTPUT)
				
			text += "\n" +"One of (at random):"
			text += "\n  " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Food) \
				+ " +" + str(val * OUTPUT)
			text += "\n  " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " +" + str(val * OUTPUT)
			text += "\n  " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " +" + str(val * OUTPUT)

			#Statistics.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.MilitaryStrength) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.Clairvoyance:
			text = Datatypes.get_action_string(actionID)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Magic) \
				+ " -" + str(val * HIGH_OUTPUT)
			return text
		Datatypes.ACTIONS.Harvest:
			text = Datatypes.get_action_string(actionID)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Food) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " +" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Health) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.Explore:
			text = Datatypes.get_action_string(actionID)
			#State.chaos += 1
			text += "\nChaos +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Freedom) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Random 1-4
			text += "\nOne of (at random)"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Food) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Magic) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " +" + str(val * OUTPUT)
			
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Food) \
				+ " -" + str(val * OUTPUT)
			return text
		Datatypes.ACTIONS.Market:
			text = Datatypes.get_action_string(actionID)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " +" + str(val * MAJOR_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Food) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " -" + str(val * OUTPUT)
			return text
		Datatypes.ACTIONS.Shrine:
			text = Datatypes.get_action_string(actionID)
			#State.order += 1
			text += "\nOrder +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Magic) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Random 1-3
			text += "\nOne of (at random)"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Health) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Happiness) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " +" + str(val * OUTPUT)
				
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.MilitaryStrength) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.Tower:
			text = Datatypes.get_action_string(actionID)
			#State.chaos += 1
			text += "\nChaos +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Magic) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.MilitaryStrength) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.Prison:
			text = Datatypes.get_action_string(actionID)
			#State.order += 1
			text += "\nOrder +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.MilitaryStrength) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Freedom) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Happiness) \
				+ " -" + str(val * OUTPUT)
			return text
		Datatypes.ACTIONS.Barracks:
			text = Datatypes.get_action_string(actionID)
			#State.order += 1
			text += "\nOrder +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.MilitaryStrength) \
				+ " +" + str(val * MAJOR_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " +" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.ForeignRelations) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " -" + str(val * OUTPUT)
			return text
		Datatypes.ACTIONS.Academy:
			text = Datatypes.get_action_string(actionID)
			#State.chaos += 1
			text += "\nChaos +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * MAJOR_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " +" + str(val * MAJOR_OUTPUT)
			#Random 1-8
			text += "\nOne of (at random)"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Freedom) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Magic) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.MilitaryStrength) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Happiness) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Health) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)
			text += "\n   " + Datatypes.get_statistics_string(Datatypes.STATISTICS.ForeignRelations) \
				+ " +" + str(val * REDUCED_OUTPUT)
			
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.Charity:
			text = Datatypes.get_action_string(actionID)
			#State.chaos += 1
			text += "\nChaos +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Happiness) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Health) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " -" + str(val * MAJOR_OUTPUT)
			return text
		Datatypes.ACTIONS.Hold:
			text = Datatypes.get_action_string(actionID)
			#State.order += 1
			text += "\nOrder +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Happiness) \
				+ " +" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.MilitaryStrength) \
				+ " -" + str(val * MAJOR_OUTPUT)
			return text
		Datatypes.ACTIONS.Infrastructure:
			text = Datatypes.get_action_string(actionID)
			#State.order += 1
			text += "\nOrder +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Population) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Health) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * MAJOR_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " -" + str(val * MAJOR_OUTPUT)
			return text
		Datatypes.ACTIONS.DarkRitual:
			text = Datatypes.get_action_string(actionID)
			#State.order += 1
			text += "\nOrder +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Magic) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Food) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Population) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Happiness) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Influence) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.Warfare:
			text = Datatypes.get_action_string(actionID)
			#State.order += 1
			text += "\nOrder +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Freedom) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Wealth) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Population) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Health) \
				+ " -" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.ForeignRelations) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.OtherworldlyRitual:
			text = Datatypes.get_action_string(actionID)
			#State.chaos += 1
			text += "\nChaos +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Population, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Population) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Food) \
				+ " +" + str(val * OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Materials) \
				+ " +" + str(val * REDUCED_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Magic) \
				+ " -" + str(val * HIGH_OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " -" + str(val * REDUCED_OUTPUT)
			return text
		Datatypes.ACTIONS.Revelry:
			text = Datatypes.get_action_string(actionID)
			#State.chaos += 1
			text += "\nChaos +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Happiness) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Freedom) \
				+ " +" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " -" + str(val * OUTPUT)
			return text
		Datatypes.ACTIONS.ForbiddenResearch:
			text = Datatypes.get_action_string(actionID)
			#State.chaos += 1
			text += "\nChaos +"
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * HIGH_OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Education) \
				+ " +" + str(val * HIGH_OUTPUT)
			#Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Freedom) \
				+ " +" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Faith) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.Health) \
				+ " -" + str(val * OUTPUT)
			#Statistics.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * OUTPUT)
			text += "\n" + Datatypes.get_statistics_string(Datatypes.STATISTICS.ForeignRelations) \
				+ " -" + str(val * OUTPUT)
			return text
		_:
			return "UNKNOWN"

func triggerAction(actionID: Datatypes.ACTIONS, val: int) -> void:
	match actionID:
		Datatypes.ACTIONS.Diplomacy:
			val = modifyValue(diplomacy_mod, val)
			processDiplomacy(val)
		Datatypes.ACTIONS.Clairvoyance:
			val = modifyValue(clairvoyance_mod, val)
			processClairvoyance(val)
		Datatypes.ACTIONS.Harvest:
			val = modifyValue(harvest_mod, val)
			processHarvest(val)
		Datatypes.ACTIONS.Explore:
			val = modifyValue(explore_mod, val)
			processExplore(val)
		Datatypes.ACTIONS.Market:
			val = modifyValue(market_mod, val)
			processMarket(val)
		Datatypes.ACTIONS.Shrine:
			val = modifyValue(shrine_mod, val)
			processShrine(val)
		Datatypes.ACTIONS.Tower:
			val = modifyValue(tower_mod, val)
			processTower(val)
		Datatypes.ACTIONS.Prison:
			val = modifyValue(prison_mod, val)
			processPrison(val)
		Datatypes.ACTIONS.Barracks:
			val = modifyValue(barracks_mod, val)
			processBarracks(val)
		Datatypes.ACTIONS.Academy:
			val = modifyValue(academy_mod, val)
			processAcademy(val)
		Datatypes.ACTIONS.Charity:
			val = modifyValue(charity_mod, val)
			processCharity(val)
		Datatypes.ACTIONS.Hold:
			val = modifyValue(hold_mod, val)
			processHold(val)
		Datatypes.ACTIONS.Infrastructure:
			val = modifyValue(infrastructure_mod, val)
			processInfrastructure(val)
		Datatypes.ACTIONS.DarkRitual:
			val = modifyValue(dark_ritual_mod, val)
			processDarkRitual(val)
		Datatypes.ACTIONS.Warfare:
			val = modifyValue(warfare_mod, val)
			processWarfare(val)
		Datatypes.ACTIONS.OtherworldlyRitual:
			val = modifyValue(otherworldly_ritual_mod, val)
			processOtherworldlyRitual(val)
		Datatypes.ACTIONS.Revelry:
			val = modifyValue(revelry_mod, val)
			processRevelry(val)
		Datatypes.ACTIONS.ForbiddenResearch:
			val = modifyValue(forbidden_research_mod, val)
			processForbiddenResearch(val)
		_:
			pass

func processDiplomacy(val: int) -> void:
	var rng = RandomNumberGenerator.new()
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * MAJOR_OUTPUT)
	var randStat = rng.randi_range(1, 3)
	match randStat:
		1:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
		2:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
		3:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
		_:
			pass
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)

func processClairvoyance(val: int) -> void:
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)

func processHarvest(val: int) -> void:
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
	
func processExplore(val: int) -> void:
	State.chaos += 1
	var rng = RandomNumberGenerator.new()
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
	var randStat = rng.randi_range(1, 4)
	match randStat:
		1:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
		2:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Magic, val * OUTPUT)
		3:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
		4:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
		_:
			pass
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)

func processMarket(val: int) -> void:
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)

func processShrine(val: int) -> void:
	State.order += 1
	var rng = RandomNumberGenerator.new()
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Faith, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Magic, val * REDUCED_OUTPUT)
	var randStat = rng.randi_range(1, 3)
	match randStat:
		1:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
		2:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
		3:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
		_:
			pass
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)

func processTower(val: int) -> void:
	State.chaos += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)

func processPrison(val: int) -> void:
	State.order += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)

func processBarracks(val: int) -> void:
	State.order += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)

func processAcademy(val: int) -> void:
	State.chaos += 1
	var rng = RandomNumberGenerator.new()
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Education, val * MAJOR_OUTPUT)
	var randStat = rng.randi_range(1, 8)
	match randStat:
		1:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
		2:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Freedom, val * REDUCED_OUTPUT)
		3:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Magic, val * REDUCED_OUTPUT)
		4:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
		5:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, val * REDUCED_OUTPUT)
		6:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
		7:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
		8:
			StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)
		_:
			pass
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
	
func processCharity(val: int) -> void:
	State.chaos += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)

func processHold(val: int) -> void:
	State.order += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)

func processInfrastructure(val: int) -> void:
	State.order += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * MAJOR_OUTPUT)

func processDarkRitual(val: int) -> void:
	State.order += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Food, val * REDUCED_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)

func processWarfare(val: int) -> void:
	State.order += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)

func processOtherworldlyRitual(val: int) -> void:
	State.chaos += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Population, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
	
func processRevelry(val: int) -> void:
	State.chaos += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
	
func processForbiddenResearch(val: int) -> void:
	State.chaos += 1
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Education, val * HIGH_OUTPUT)
	StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * OUTPUT)

func canAfford(actionID: Datatypes.ACTIONS, die_value: int) -> bool:
	match actionID:
		Datatypes.ACTIONS.Diplomacy:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * OUTPUT)
			var needed = die_value * OUTPUT
			if State.military_strength - needed < StatisticalGrowth.MILITARY_STRENGTH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
			if State.wealth - needed < StatisticalGrowth.WEALTH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.influence - needed < StatisticalGrowth.INFLUENCE_MIN:
				return false
			return true
		Datatypes.ACTIONS.Clairvoyance:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.magic - needed < StatisticalGrowth.MAGIC_MIN:
				return false
			return true
		Datatypes.ACTIONS.Harvest:
			var needed = die_value * OUTPUT
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			if State.health - needed < StatisticalGrowth.HEALTH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.influence - needed < StatisticalGrowth.INFLUENCE_MIN:
				return false
			return true
		Datatypes.ACTIONS.Explore:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
			var needed = die_value * OUTPUT
			if State.influence - needed < StatisticalGrowth.INFLUENCE_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)
			needed = die_value * HIGH_OUTPUT
			if State.food - needed < StatisticalGrowth.FOOD_MIN:
				return false
			return true
		Datatypes.ACTIONS.Market:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
			var needed = die_value * OUTPUT
			if State.food - needed < StatisticalGrowth.FOOD_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			if State.materials - needed < StatisticalGrowth.MATERIALS_MIN:
				return false
			return true
		Datatypes.ACTIONS.Shrine:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
			var needed = die_value * OUTPUT
			if State.education - needed < StatisticalGrowth.EDUCATION_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.military_strength - needed < StatisticalGrowth.MILITARY_STRENGTH_MIN:
				return false
			return true
		Datatypes.ACTIONS.Tower:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.wealth - needed < StatisticalGrowth.WEALTH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.faith - needed < StatisticalGrowth.FAITH_MIN:
				return false
			return true
		Datatypes.ACTIONS.Prison:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.freedom - needed < StatisticalGrowth.FREEDOM_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
			needed = die_value * OUTPUT
			if State.happiness - needed < StatisticalGrowth.HAPPINESS_MIN:
				return false
			return true
		Datatypes.ACTIONS.Barracks:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.foreign_relations - needed < StatisticalGrowth.FOREIGN_RELATIONS_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			needed = die_value * OUTPUT
			if State.materials - needed < StatisticalGrowth.MATERIALS_MIN:
				return false
			return true
		Datatypes.ACTIONS.Academy:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.materials - needed < StatisticalGrowth.MATERIALS_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.influence - needed < StatisticalGrowth.INFLUENCE_MIN:
				return false
			return true
		Datatypes.ACTIONS.Charity:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)
			var needed = die_value * MAJOR_OUTPUT
			if State.wealth - needed < StatisticalGrowth.WEALTH_MIN:
				return false
			return true
		Datatypes.ACTIONS.Hold:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)
			var needed = die_value * MAJOR_OUTPUT
			if State.military_strength - needed < StatisticalGrowth.MILITARY_STRENGTH_MIN:
				return false
			return true
		Datatypes.ACTIONS.Infrastructure:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * MAJOR_OUTPUT)
			var needed = die_value * MAJOR_OUTPUT
			if State.materials - needed < StatisticalGrowth.MATERIALS_MIN:
				return false
			return true
		Datatypes.ACTIONS.DarkRitual:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.population - needed < StatisticalGrowth.POPULATION_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
			needed = die_value * HIGH_OUTPUT
			if State.happiness - needed < StatisticalGrowth.HAPPINESS_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.influence - needed < StatisticalGrowth.INFLUENCE_MIN:
				return false
			return true
		Datatypes.ACTIONS.Warfare:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.population - needed < StatisticalGrowth.POPULATION_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.health - needed < StatisticalGrowth.HEALTH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.foreign_relations - needed < StatisticalGrowth.FOREIGN_RELATIONS_MIN:
				return false
			return true
		Datatypes.ACTIONS.OtherworldlyRitual:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			var needed = die_value * HIGH_OUTPUT
			if State.magic - needed < StatisticalGrowth.MAGIC_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
			needed = die_value * REDUCED_OUTPUT
			if State.education - needed < StatisticalGrowth.EDUCATION_MIN:
				return false
			return true
		Datatypes.ACTIONS.Revelry:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
			var needed = die_value * OUTPUT
			if State.faith - needed < StatisticalGrowth.FAITH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
			needed = die_value * OUTPUT
			if State.education - needed < StatisticalGrowth.EDUCATION_MIN:
				return false
			return true
		Datatypes.ACTIONS.ForbiddenResearch:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
			var needed = die_value * OUTPUT
			if State.faith - needed < StatisticalGrowth.FAITH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			needed = die_value * OUTPUT
			if State.health - needed < StatisticalGrowth.HEALTH_MIN:
				return false
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * OUTPUT)
			needed = die_value * OUTPUT
			if State.foreign_relations - needed < StatisticalGrowth.FOREIGN_RELATIONS_MIN:
				return false
			return true
		_:
			pass
	return false

func getCostAbbreviations(actionID: Datatypes.ACTIONS) -> String:
	var abbrev = ""
	match actionID:
		Datatypes.ACTIONS.Diplomacy:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			abbrev = "-MiS,-Wea,-Inf"
		Datatypes.ACTIONS.Clairvoyance:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			abbrev = "-Mag"
		Datatypes.ACTIONS.Harvest:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			abbrev = "-Hea,-Inf"
		Datatypes.ACTIONS.Explore:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)
			abbrev = "-Inf,-Foo"
		Datatypes.ACTIONS.Market:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			abbrev = "-Foo,-Mat"
		Datatypes.ACTIONS.Shrine:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
			abbrev = "-Edu,-MiS"
		Datatypes.ACTIONS.Tower:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
			abbrev = "-Wea,-Fai"
		Datatypes.ACTIONS.Prison:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
			abbrev = "-Fre,-Hap"
		Datatypes.ACTIONS.Barracks:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
			abbrev = "-FoR,-Mat"
		Datatypes.ACTIONS.Academy:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			abbrev = "-Mat,-Inf"
		Datatypes.ACTIONS.Charity:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)
			abbrev = "-Wea"
		Datatypes.ACTIONS.Hold:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)
			abbrev = "-MiS"
		Datatypes.ACTIONS.Infrastructure:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, val * MAJOR_OUTPUT)
			abbrev = "-Mat"
		Datatypes.ACTIONS.DarkRitual:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
			abbrev = "-Pop,-Hap,-FoR"
		Datatypes.ACTIONS.Warfare:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)
			abbrev = "-Pop,-Hea,-FoR"
		Datatypes.ACTIONS.OtherworldlyRitual:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
			abbrev = "-Mag,-Edu"
		Datatypes.ACTIONS.Revelry:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
			abbrev = "-Fai,-Edu"
		Datatypes.ACTIONS.ForbiddenResearch:
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
			#StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * OUTPUT)
			abbrev = "-Fai,-Hea,-FoR"
		_:
			pass
	return abbrev;
