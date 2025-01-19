extends Node

var event_array = []
const EVENT_COUNT = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var events = 0
	var randEvent = 0
	while events != EVENT_COUNT:
		randEvent = rng.randi_range(0, Datatypes.MAJOR_EVENTS.DarkOneDescent)
		if(event_array.has(randEvent) != true):
			event_array.append(randEvent)
			events += 1
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func getEventDescription() -> String:
	var description
	if(State.number_of_events == 4):
		get_tree().change_scene_to_file("res://GUI/credits.tscn")
		State.number_of_events = 0
	match event_array[State.number_of_events]:
		Datatypes.MAJOR_EVENTS.VolcanicEruption:
			description = "As long foretold by oracles of the past, the time has finally come for the great volcano, Cataclysmos, to erupt. What they could not foresee however is the advancement of our nation and how widespread the peoples of the land have become. If we don't act, the volcano's eruption may wipe out thousands. How shall we respond?"
		Datatypes.MAJOR_EVENTS.RampantPoverty:
			description = "Our efforts to steer the nation in a new direction has been mostly successful; however, the struggles wrought by the empire of the past cannot be so easily undone. The people still struggle to afford basic necessities and common amenities. It is a common sight to see beggars around street corners and even the nobles of the land hardly compare to the nobility of nations across the sea. How shall we respond to the growing poverty threating our nation?"
		Datatypes.MAJOR_EVENTS.PoliticalDivision:
			description = "The people have long been divided and the empire's fall has only bolstered that division -- nobody can agree on the best course forward. Tensions have risen and entirely new political blocs and factions have formed, pitting neighbor against neighbor - sibling against sibling. Surely our nation cannot survive such tumult, what shall we do?"
		Datatypes.MAJOR_EVENTS.WarringNations:
			description = "The empire was a force of ruin and evil, but it also was a force of stability. Its fall has led to nations across the Realm to break out into war - fighting over resources, for conquest, for pride. We surely are in no position to survive should their ire turn towards us. What shall we do in these times of chaos?"
		Datatypes.MAJOR_EVENTS.DarkOneDescent:
			description = "Dark magics have been stirring for some time but now, the truth has been revealed. There is a being of pure shadow and fury wreaking havoc the Realms over. Their armies of darkness threaten to swallow the world. What can we do?"
	return description

func getEventName() -> String:
	var name
	match event_array[State.number_of_events]:
		Datatypes.MAJOR_EVENTS.VolcanicEruption:
			name = "Cataclysmos Erupts!"
		Datatypes.MAJOR_EVENTS.RampantPoverty:
			name = "Poverty Runs Rampant!"
		Datatypes.MAJOR_EVENTS.PoliticalDivision:
			name = "The People Divided!"
		Datatypes.MAJOR_EVENTS.WarringNations:
			name = "Nations At War!"
		Datatypes.MAJOR_EVENTS.DarkOneDescent:
			name = "The Dark One Descends!"
	return name

func getEventOptionOne() -> String:
	var option_one
	match event_array[State.number_of_events]:
		Datatypes.MAJOR_EVENTS.VolcanicEruption:
			option_one = "We shall commit our forces of magic to the task of shielding the people and soothing the elements."
		Datatypes.MAJOR_EVENTS.RampantPoverty:
			option_one = "We shall invest the nation's coffers in the people."
		Datatypes.MAJOR_EVENTS.PoliticalDivision:
			option_one = "Perhaps a show of our progress and developments shall unite them..."
		Datatypes.MAJOR_EVENTS.WarringNations:
			option_one = "We cannot show weakness, shore up our military through any means necessary."
		Datatypes.MAJOR_EVENTS.DarkOneDescent:
			option_one = "We must have faith that the gods of fate shall protect us, send word to the chaplain and unite the people in hymn."
	return option_one

func getEventOptionTwo() -> String:
	var option_two
	match event_array[State.number_of_events]:
		Datatypes.MAJOR_EVENTS.VolcanicEruption:
			option_two = "We can rebuild, evacuate anyone nearby and commit our resources to reconstruction ASAP."
		Datatypes.MAJOR_EVENTS.RampantPoverty:
			option_two = "We'll invigorate entrepreneurial spirit and make the markets freer."
		Datatypes.MAJOR_EVENTS.PoliticalDivision:
			option_two = "We cannot afford to be fractured, crush any and all descent."
		Datatypes.MAJOR_EVENTS.WarringNations:
			option_two = "To ensure survival, we shall ingratiate ourselves with the mightiest nation."
		Datatypes.MAJOR_EVENTS.DarkOneDescent:
			option_two = "We have the strength to make it through this, let the dark armies come - they'll meet their end here."
	return option_two
	
func getEventOptionThree() -> String:
	var option_three
	match event_array[State.number_of_events]:
		Datatypes.MAJOR_EVENTS.VolcanicEruption:
			option_three = "This is divine judgment foreseen by fate. If it is our fate to perish, so be it."
		Datatypes.MAJOR_EVENTS.RampantPoverty:
			option_three = "Put the beggars to work, we'll increase production while providing a steady wage and basic housing."
		Datatypes.MAJOR_EVENTS.PoliticalDivision:
			option_three = "Let's encourage this. So long as it stays peaceful it may lead to good in our nation's future."
		Datatypes.MAJOR_EVENTS.WarringNations:
			option_three = "War is hardly our concern, let the other nations duke it out. That's opportunity to focus on ourselves."
		Datatypes.MAJOR_EVENTS.DarkOneDescent:
			option_three = "Unity across the realms is what shall get us through this. I propose a council of nations."
	return option_three
			
func getEventResults(choice: int) -> String:
	var result
	match event_array[State.number_of_events]:
		Datatypes.MAJOR_EVENTS.VolcanicEruption:
			match choice:
				1:
					result = "This will expend a lot of magical power; however, it should keep the people safe and happy and may even improve our magical studies in the future."
				2:
					result = "This will cost a lot of wealth and materials but the people will be safe, if not a bit rattled. Should lead to great infrastructural development opportunities though."
				3:
					result = "The people's faith will skyrocket and opportunities for prayer at the shrine and gifts of charity will greatly strengthen...but our people WILL suffer."
				_:
					result = "UNKNOWN"
		Datatypes.MAJOR_EVENTS.RampantPoverty:
			match choice:
				1:
					result = "We'll be expending a lot of wealth and food, but surely our people will be beyond thrilled and may even be more willing to cooperate in the future."
				2:
					result = "Undoubtedly the people will enjoy new freedoms and the market will get much stronger; though its unclear if this will actually solve the problem."
				3:
					result = "We'll pay a little in wealth and materials, but make up for it quickly by heighting our harvesting efforts. I doubt the impoverished will be very happy with this deal however."
				_:
					result = "UNKNOWN"
		Datatypes.MAJOR_EVENTS.PoliticalDivision:
			match choice:
				1:
					result = "We'll have to expend many materials and tap into our education funding, but it should be quite the show! May even energize the academy and draw the attention of other nations...but martial exploits will start lacking."
				2:
					result = "Certainly, our influence will grow and unity will strengthen much of what we do; however, lessened freedom comes with great discontent."
				3:
					result = "We'll become a home of freedom and innovation where people can freely speak their minds! Of course, you do accept this will weaken your claims to power and influence, yes?"
				_:
					result = "UNKNOWN"
		Datatypes.MAJOR_EVENTS.WarringNations:
			match choice:
				1:
					result = "We'll invest our wealth heavily into bolstering our military strength. The barracks shall be greater and wars more easily won. Many other less martial efforts will suffer though and the people may grow weary."
				2:
					result = "Gifts of food and material goods offered at a premium should bolster our foreign relations. The people will take a hit to morale though and we'll be forced to weaken our armies."
				3:
					result = "Through this chance we can strengthen the vast majority of our nation and find a great many investment opportunities. While the people may be happy with isolation, other nations will not and our armies and exploration efforts will falter greatly."
				_:
					result = "UNKNOWN"
		Datatypes.MAJOR_EVENTS.DarkOneDescent:
			match choice:
				1:
					result = "This is asking much of the people's faith but should the gods hear our prayers, fate shall surely smile upon us. This should allievate the people's worries and greatly enhance our clairvoyance."
				2:
					result = "It'll exhaust much our military but no doubt we can fight off any and all threats. Faith and morale will grow from victory but this will be permanently taxing on all our internal investments."
				3:
					result = "We'll exhaust many of our foreign connections and accrued favors to do this, but yes, I think it'll work. Much good can come from a Realms potentially united!"
				_:
					result = "UNKNOWN"
	return result
	
func triggerEvent(choice: int) -> void:
	match event_array[State.number_of_events]:
		Datatypes.MAJOR_EVENTS.VolcanicEruption:
			match choice:
				1:
					var magic = State.magic
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Magic, StatisticalGrowth.MAGIC_MAX - 10)
					var diff = 0
					if(magic > 0):
						diff = magic - State.magic
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, diff + 10)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Health, 10)
					Actions.tower_mod += 3
					Actions.academy_mod += 1
				2:
					var wealth = State.wealth
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, 200)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, 35)
					var diff = 0
					if (wealth > 200):
						diff = wealth - State.wealth
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, diff + 10)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, 20)
					Actions.infrastructure_mod += 4
				3:
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Faith, StatisticalGrowth.FAITH_MAX + 20)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, State.faith)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, 100)
					Actions.shrine_mod += 6
					Actions.charity_mod += 6
					Actions.clairvoyance_mod += 1
					
				_:
					pass
		Datatypes.MAJOR_EVENTS.RampantPoverty:
			match choice:
				1:
					var wealth = State.wealth
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, 200)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, 55)
					var diff = 0
					if (wealth > 200):
						diff = wealth - State.wealth
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, diff + 10)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Population, 50)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, 20)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Health, 10)
					Actions.harvest_mod += 2
					Actions.hold_mod += 1
					if(State.food >= 0):
						Actions.global_mod += 1
				2:
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Freedom, 40)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, State.wealth / 10)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Population, 50)
					Actions.market_mod += 10
					Actions.charity_mod -= 5
					Actions.shrine_mod -= 3
				3:
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, 20)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, 20)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, 40)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Population, 40)
					Actions.harvest_mod += 8
					Actions.revelry_mod -= 4
				_:
					pass
		Datatypes.MAJOR_EVENTS.PoliticalDivision:
			match choice:
				1:
					var edu = State.education
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, 50)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Education, 30)
					if (State.education > 0):
						StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, edu)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, 10)
					Actions.academy_mod += 6
					Actions.barracks_mod -= 2
					Actions.warfare_mod -= 2
					Actions.hold_mod -= 2
				2:
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, StatisticalGrowth.INFLUENCE_MAX + 10)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, State.influence)
					Actions.global_mod += 2
				3:
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Freedom, StatisticalGrowth.FREEDOM_MAX)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, State.freedom)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Education, State.freedom / 2)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Influence, State.freedom * 2)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, State.freedom * 2)
					Actions.barracks_mod -= 3
					Actions.warfare_mod -= 3
					Actions.diplomacy_mod += 5
				_:
					pass
		Datatypes.MAJOR_EVENTS.WarringNations:
			match choice:
				1:
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Wealth, 1000)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.MilitaryStrength, StatisticalGrowth.MILITARY_STRENGTH_MAX + 10)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Influence, State.military_strength / 2)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Health, State.military_strength)
					Actions.barracks_mod += 8
					Actions.warfare_mod += 8
					Actions.hold_mod += 4
					Actions.prison_mod += 4
					Actions.academy_mod -= 4
					Actions.tower_mod -= 2
					Actions.dark_ritual_mod -= 2
					Actions.otherworldly_ritual_mod -= 2
					Actions.charity_mod -= 2
				2:
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Food, 40)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Materials, 40)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.ForeignRelations, StatisticalGrowth.FOREIGN_RELATIONS_MAX)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, State.foreign_relations)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Happiness, 20)
					Actions.barracks_mod -= 3
					Actions.warfare_mod -= 5
				3:
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, 30)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, 60)
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, 30)
					Actions.global_mod += 3
					Actions.barracks_mod -= 6
					Actions.warfare_mod -= 6
					Actions.explore_mod -= 6
					
				_:
					pass
		Datatypes.MAJOR_EVENTS.DarkOneDescent:
			match choice:
				1:
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.Faith, StatisticalGrowth.FAITH_MAX)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, 50)
					Actions.clairvoyance_mod += 10
				2:
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.MilitaryStrength, StatisticalGrowth.MILITARY_STRENGTH_MAX)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Faith, 30)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, StatisticalGrowth.HAPPINESS_MAX + 20)
					Actions.global_mod -= 2
				3:
					StatisticalGrowth.decreaseStatistic(Datatypes.STATISTICS.ForeignRelations, StatisticalGrowth.FOREIGN_RELATIONS_MAX)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Happiness, 40)
					StatisticalGrowth.increaseStatistic(Datatypes.STATISTICS.Health, 40)
					Actions.global_mod += 1
					Actions.diplomacy_mod += 5
				_:
					pass
