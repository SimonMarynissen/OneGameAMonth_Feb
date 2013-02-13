import vamos/State
import Player
import BasicEnemy

PlayState: class extends State {
	
	player: Player
	enemy: BasicEnemy
	
	create: func {
		player = Player new(200, 100)
		add(player)
		enemy = BasicEnemy new(200, 100, 315, 20)
		add(enemy)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}