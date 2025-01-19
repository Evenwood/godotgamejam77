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
			
