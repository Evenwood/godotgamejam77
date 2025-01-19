# Author: Darien Roach
# Date Created: 1/16/2025
# Purpose: A script used to maintain a global set of enums

extends Node

enum ACTIONS {Diplomacy, Clairvoyance, Harvest, Explore, Market, Shrine, Tower, Prison, Barracks, Academy, Charity, Hold, Infrastructure, DarkRitual, Warfare, OtherworldlyRitual, Revelry, ForbiddenResearch}
enum STATISTICS {Influence, Wealth, Freedom, Health, Faith, Education, ForeignRelations, MilitaryStrength, Population, Materials, Magic, Food, Happiness}
enum MINOR_EVENTS {Gift, RequestAid, DiplomaticIncident, VisionFear, VisionDelight, VisionInspiration, TiredWorkers, UncoveredTreasure, BountifulHarvest, LostTravelers, MysteriousOthers, GreatDiscovery, MarketBoom, MarketCrash, ForeignIntrigue, PrayersAnswered, Defilers, LostSpirits, MagicalExperiment, FailedSpellcraft, WizardsRequest, Riots, AllsCalm, CriminalRoundup, AdvancedTraining, NewRecruits, TrainingAccident, NewGraduates, ForeignExchange, AcademicMishap, Gratitude, Pacifism, DivineBlessing, Disarmament, MinorSkirmish, PeaceQuiet, SocietalGrowth, Mismanagement, InvestmentOpportunity, Curse, DemonCommune, DesiresFulfilled, MilitaryAdvancement, ExceptionalManeuver, CripplingDefeat, SummonMonsters, SummonVisitors, SummonSpirits, Festival, RunAmok, CulturalWave, DarkDiscovery, EvilAdvances, Miracle}
enum MAJOR_EVENTS {VolcanicEruption, RampantPoverty, PoliticalDivision, WarringNations, DarkOneDescent}


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


static var minor_event_strings = {
	MINOR_EVENTS.Gift: "Gift",
	MINOR_EVENTS.RequestAid: "Request for Aid",
	MINOR_EVENTS.DiplomaticIncident: "Diplomatic Incident",
	MINOR_EVENTS.VisionFear: "A Vision of Fear",
	MINOR_EVENTS.VisionDelight: "A Vision of Delight",
	MINOR_EVENTS.VisionInspiration: "A Vision of Inspiration",
	MINOR_EVENTS.TiredWorkers: "Tired Workers",
	MINOR_EVENTS.UncoveredTreasure: "Uncovered Treasure",
	MINOR_EVENTS.BountifulHarvest: "Bountiful Harvest",
	MINOR_EVENTS.LostTravelers: "Lost Travelers", 
	MINOR_EVENTS.MysteriousOthers: "Mysterious Others", 
	MINOR_EVENTS.GreatDiscovery: "Great Discovery", 
	MINOR_EVENTS.MarketBoom: "Market Boom", 
	MINOR_EVENTS.MarketCrash: "Market Crash", 
	MINOR_EVENTS.ForeignIntrigue: "Foreign Intrigue", 
	MINOR_EVENTS.PrayersAnswered: "Prayers Answered", 
	MINOR_EVENTS.Defilers: "Defilers", 
	MINOR_EVENTS.LostSpirits: "Lost Spirits", 
	MINOR_EVENTS.MagicalExperiment: "Magical Experiment", 
	MINOR_EVENTS.FailedSpellcraft: "Failed Spellcraft", 
	MINOR_EVENTS.WizardsRequest: "Wizard's Request", 
	MINOR_EVENTS.Riots: "Riots", 
	MINOR_EVENTS.AllsCalm: "All's Calm", 
	MINOR_EVENTS.CriminalRoundup: "Criminal Roundup", 
	MINOR_EVENTS.AdvancedTraining: "Advanced Training", 
	MINOR_EVENTS.NewRecruits: "New Recruits", 
	MINOR_EVENTS.TrainingAccident: "Training Accident", 
	MINOR_EVENTS.NewGraduates: "New Graduates", 
	MINOR_EVENTS.ForeignExchange: "Foreign Exchange", 
	MINOR_EVENTS.AcademicMishap: "Academic Mishap", 
	MINOR_EVENTS.Gratitude: "Gratitude", 
	MINOR_EVENTS.Pacifism: "Pacifism", 
	MINOR_EVENTS.DivineBlessing: "Divine Blessing", 
	MINOR_EVENTS.Disarmament: "Disarmament", 
	MINOR_EVENTS.MinorSkirmish: "Minor Skirmish", 
	MINOR_EVENTS.PeaceQuiet: "Peace and Quiet", 
	MINOR_EVENTS.SocietalGrowth: "Societal Growth", 
	MINOR_EVENTS.Mismanagement: "Mismanagement", 
	MINOR_EVENTS.InvestmentOpportunity: "Investment Opportunity", 
	MINOR_EVENTS.Curse: "Curse", 
	MINOR_EVENTS.DemonCommune: "Demon Commune", 
	MINOR_EVENTS.DesiresFulfilled: "Desires Fulfilled", 
	MINOR_EVENTS.MilitaryAdvancement: "Military Advancement", 
	MINOR_EVENTS.ExceptionalManeuver: "Exceptional Maneuver", 
	MINOR_EVENTS.CripplingDefeat: "Crippling Defeat", 
	MINOR_EVENTS.SummonMonsters: "Summon Monsters", 
	MINOR_EVENTS.SummonVisitors: "Summon Visitors", 
	MINOR_EVENTS.SummonSpirits: "Summon Spirits", 
	MINOR_EVENTS.Festival: "Festival", 
	MINOR_EVENTS.RunAmok: "Run Amok", 
	MINOR_EVENTS.CulturalWave: "Cultural Wave", 
	MINOR_EVENTS.DarkDiscovery: "Dark Discovery", 
	MINOR_EVENTS.EvilAdvances: "Evil Advances", 
	MINOR_EVENTS.Miracle: "Miracle"
}

static var statistics_strings = {
	STATISTICS.Influence: "Influence",
	STATISTICS.Wealth: "Wealth",
	STATISTICS.Freedom: "Freedom",
	STATISTICS.Health: "Health",
	STATISTICS.Faith: "Faith",
	STATISTICS.Education: "Education",
	STATISTICS.ForeignRelations: "Foreign Relations",
	STATISTICS.MilitaryStrength: "Military Strength",
	STATISTICS.Population: "Population",
	STATISTICS.Materials: "Materials",
	STATISTICS.Magic: "Magic",
	STATISTICS.Food: "Food",
	STATISTICS.Happiness: "Happiness"

}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
static func get_action_string(value):
	return action_strings.get(value, "UNKNOWN")
	

static func get_minor_event_string(value):
	return minor_event_strings.get(value, "UNKNOWN")
  
static func get_statistics_string(value):
	return statistics_strings.get(value, "UNKNOWN")
