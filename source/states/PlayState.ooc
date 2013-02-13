import vamos/State
import Player
import BasicEnemy

PlayState: class extends State {
	
	player: Player
	enemy: BasicEnemy
	
	create: func {
		player = Player new(200, 100)
		add(player)
		enemy = BasicEnemy new(300.0, 100.0, 270.0, 2.0)
		add(enemy)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}