import Fleet, Player, Explosion
import structs/[ArrayList, Bag, HashBag], BagUtil
import vamos/[Engine, State]
import vamos/audio/Music

use sdl2
import sdl2/Event
import vamos/Input

Level: class extends State {
	
	data: HashBag
	name: String
	player: Player
	fleets := ArrayList<Fleet> new()
	
	padding := const 20
	width, height: Double
	top, bottom, left, right: Double
	
	init: func (=data) {
		name = data getString("name", "Untitled Level")
		color set(data getString("color", "#ffffffff"))
		fleetBag := data getBag("fleets")
		
		for (i in 0..fleetBag size)
			fleets add(Fleet new(fleetBag getHashBag(i)))
	}
	
	create: func {
		width = engine width
		height = engine height
		top = bottom = -padding
		bottom = height + padding
		right = width + padding
		
		for (fleet in fleets) add(fleet)
		add(Player new(100, 100))
		add(Explosion new(150, 150))
		
		//music := Music new("assets/music/geckojsc - Mothership.ogg")
		//engine mixer add(music)
		
		if (data contains?("backdrop")) {
			//add backdrop
		}
	}
	
	update: func (dt:Double) {
		super(dt)
		
	}
	
}