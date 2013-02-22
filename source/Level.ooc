import vamos/[Engine, State]
import vamos/audio/Music
import Fleet, Player
import structs/[ArrayList, Bag, HashBag]
import BagUtil

use sdl2
import sdl2/Event
import vamos/Input

Level: class extends State {
	
	name: String
	player: Player
	fleets := ArrayList<Fleet> new()
	
	padding := const 20
	width, height: Double
	top, bottom, left, right: Double
	
	init: func (data:HashBag) {
		name = data getString("name")
		color set(data getString("color"))
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
		
		music := Music new("assets/music/geckojsc - Mothership.ogg")
		engine mixer add(music)
	}
	
	update: func (dt:Double) {
		super(dt)
		if (Input keyPressed(SDLK_b))
			"breakpoint here?" println()
	}
}