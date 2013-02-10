import vamos/State

import Player
import Text
import SolidBlock

MenuState: class extends State {
	
	player:Player
	block:SolidBlock
	
	create: func {
		add(Text new(200,100))
		add(player = Player new(100, 100))
		add(block = SolidBlock new(200, 200, 40, 40))
	}
	
	update: func (dt:Double) {
		super(dt)
		"hitting: %s" printfln(player mask check(block mask) toString())
	}
	
}