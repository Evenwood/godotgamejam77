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
			processHold(val)
		Datatypes.ACTIONS.DarkRitual:
			val = modifyValue(dark_ritual_mod, val)
			processHold(val)
		Datatypes.ACTIONS.Warfare:
			val = modifyValue(warfare_mod, val)
			processHold(val)
		Datatypes.ACTIONS.OtherworldlyRitual:
			val = modifyValue(otherworldly_ritual_mod, val)
			processHold(val)
		Datatypes.ACTIONS.Revelry:
			val = modifyValue(revelry_mod, val)
			processHold(val)
		Datatypes.ACTIONS.ForbiddenResearch:
			val = modifyValue(forbidden_research_mod, val)
			processHold(val)
		_:
			pass

func processDiplomacy(val: int) -> void:
	var rng = RandomNumberGenerator.new()
	Statistics.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * MAJOR_OUTPUT)
	var randStat = rng.randi_range(1, 3)
	match randStat:
		1:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
		2:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
		3:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
		_:
			pass
	Statistics.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)

func processClairvoyance(val: int) -> void:
	Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)

func processHarvest(val: int) -> void:
	Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
	
func processExplore(val: int) -> void:
	State.chaos += 1
	var rng = RandomNumberGenerator.new()
	Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
	var randStat = rng.randi_range(1, 4)
	match randStat:
		1:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
		2:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * OUTPUT)
		3:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
		4:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
		_:
			pass
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Food, val * HIGH_OUTPUT)

func processMarket(val: int) -> void:
	Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)

func processShrine(val: int) -> void:
	State.order += 1
	var rng = RandomNumberGenerator.new()
	Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * REDUCED_OUTPUT)
	var randStat = rng.randi_range(1, 3)
	match randStat:
		1:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
		2:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
		3:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
		_:
			pass
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)

func processTower(val: int) -> void:
	State.chaos += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)

func processPrison(val: int) -> void:
	State.order += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Freedom, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)

func processBarracks(val: int) -> void:
	State.order += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * OUTPUT)

func processAcademy(val: int) -> void:
	State.chaos += 1
	var rng = RandomNumberGenerator.new()
	Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * MAJOR_OUTPUT)
	var randStat = rng.randi_range(1, 8)
	match randStat:
		1:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
		2:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * REDUCED_OUTPUT)
		3:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * REDUCED_OUTPUT)
		4:
			Statistics.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * REDUCED_OUTPUT)
		5:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * REDUCED_OUTPUT)
		6:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
		7:
			Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
		8:
			Statistics.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)
		_:
			pass
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)
	
func processCharity(val: int) -> void:
	State.chaos += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Wealth, val * MAJOR_OUTPUT)

func processHold(val: int) -> void:
	State.order += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Influence, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, val * MAJOR_OUTPUT)

func processInfrastructure(val: int) -> void:
	State.order += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Materials, val * MAJOR_OUTPUT)

func processDarkRitual(val: int) -> void:
	State.order += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * REDUCED_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * REDUCED_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Influence, val * REDUCED_OUTPUT)

func processWarfare(val: int) -> void:
	State.order += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Wealth, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Faith, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Population, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Health, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * REDUCED_OUTPUT)

func processOtherworldlyRitual(val: int) -> void:
	State.chaos += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Population, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Food, val * OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Materials, val * REDUCED_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Magic, val * HIGH_OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Education, val * REDUCED_OUTPUT)
	
func processRevelry(val: int) -> void:
	State.chaos += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Happiness, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Education, val * OUTPUT)
	
func processForbiddenResearch(val: int) -> void:
	State.chaos += 1
	Statistics.increaseStatistic(Datatypes.STATISTICS.Education, val * HIGH_OUTPUT)
	Statistics.increaseStatistic(Datatypes.STATISTICS.Freedom, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Faith, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.Health, val * OUTPUT)
	Statistics.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, val * OUTPUT)
