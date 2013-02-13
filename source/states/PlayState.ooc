import vamos/State
import Player

PlayState: class extends State {
	
	player: Player
	
	create: func {
		player = Player new(200, 100)
		add(player)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}