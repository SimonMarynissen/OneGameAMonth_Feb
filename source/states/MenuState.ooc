import vamos/[State, Input]
import Player
import Text
import SolidBlock
import Button
import structs/ArrayList

MenuState: class extends State {
	
	levelButtons := ArrayList<Button> new()
	
	create: func {
		for (i in 0..9) levelButtons add(Button new(32*i, 32, "" + i))
		for (button in levelButtons) add(button)
	}
	
	update: func (dt:Double) {
		super(dt)
	}
}