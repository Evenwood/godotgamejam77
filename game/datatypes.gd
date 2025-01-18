# Author: Darien Roach
# Date Created: 1/16/2025
# Purpose: A script used to maintain a global set of enums

extends Node

enum ACTIONS {Diplomacy, Clairvoyance, Harvest, Explore, Market, Shrine, Tower, Prison, Barracks, Academy, Charity, Hold, Infrastructure, DarkRitual, Warfare, OtherworldlyRitual, Revelry, ForbiddenResearch}
enum STATISTICS {Influence, Wealth, Freedom, Health, Faith, Education, ForeignRelations, MilitaryStrength, Population, Materials, Magic, Food, Happiness}
enum MINOR_EVENTS {}
enum MAJOR_EVENTS {}


static var  action_strings = {
	ACTIONS.Diplomacy: "Diplomacy",
	ACTIONS.Clairvoyance: "Clairvoyance",
	ACTIONS.Harvest: "Harvest",
	ACTIONS.Explore: "Explore",
	ACTIONS.Market: "Market",
	ACTIONS.Shrine: "Shrine",
	ACTIONS.Tower: "Tower",
	ACTIONS.Prison: "Prison",
	ACTIONS.Barracks: "Barracks",
	ACTIONS.Academy: "Academy",
	ACTIONS.Charity: "Charity",
	ACTIONS.Hold: "Hold",
	ACTIONS.Infrastructure: "Infrastructure",
	ACTIONS.DarkRitual: "Dark Ritual",
	ACTIONS.Warfare: "Warfare",
	ACTIONS.OtherworldlyRitual: "Otherworldly Ritual",
	ACTIONS.Revelry: "Revelry",
	ACTIONS.ForbiddenResearch: "Forbidden Research"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
static func get_action_string(value):
	return action_strings.get(value, "UNKNOWN")
