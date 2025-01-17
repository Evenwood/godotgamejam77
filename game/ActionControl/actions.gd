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

func triggerAction(actionID: int, val: int) -> void:
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
	pass

func processClairvoyance(val: int) -> void:
	pass

func processHarvest(val: int) -> void:
	pass
	
func processExplore(val: int) -> void:
	pass

func processMarket(val: int) -> void:
	pass

func processShrine(val: int) -> void:
	pass

func processTower(val: int) -> void:
	pass

func processPrison(val: int) -> void:
	pass

func processBarracks(val: int) -> void:
	pass

func processAcademy(val: int) -> void:
	pass
	
func processCharity(val: int) -> void:
	pass

func processHold(val: int) -> void:
	pass

func processInfrastructure(val: int) -> void:
	pass

func processDarkRitual(val: int) -> void:
	pass

func processWarfare(val: int) -> void:
	pass

func processOtherworldlyRitual(val: int) -> void:
	pass
	
func processRevelry(val: int) -> void:
	pass
	
func processForbiddenResearch(val: int) -> void:
	pass
