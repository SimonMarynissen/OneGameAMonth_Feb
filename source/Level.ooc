import vamos/State
import Fleet, Player
import structs/[ArrayList, Bag, HashBag]

Level: class extends State {
	
	fleets: ArrayList<Fleet>
	player: Player
	
	init: func (data:HashBag) {
		fleetBag := data get("fleets", Bag)
		for (i in 0..fleetBag size-1) {
			fleets[i] = Fleet new(fleetBag get(i, HashBag))
		}
	}
	
	create: func {
		for (fleet in fleets) add(fleet)
		add(Player new(100, 100))
	}
}