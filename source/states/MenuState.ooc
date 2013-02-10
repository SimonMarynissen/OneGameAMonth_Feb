import vamos/State

import Player
import Text

MenuState: class extends State {
	
	create: func {
		add(Player new(100, 100))
		add(Text new(200,100))
	}
	
	update: func (dt:Double) {
		super(dt)
	}
	
}