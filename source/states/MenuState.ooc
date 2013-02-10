import vamos/State

import Player

MenuState: class extends State {
	
	create: func {
		add(Player new(100, 100))
	}
	
	update: func (dt:Double) {
		super(dt)
	}
	
}