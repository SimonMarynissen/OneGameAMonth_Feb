import vamos/State
import TimedFleet, Player
import structs/ArrayList

Level: class extends State {
	
	fleets: ArrayList<TimedFleet>
	player: Player
	
	init: func () { // Load JSON String from file
	
	}
	
	create: func {
		parseJSON()
		for (fleet in fleets) add(fleet)
		add(Player new(100, 100))
	}
	
	parseJSON: func { // load fleets
	
	}
}