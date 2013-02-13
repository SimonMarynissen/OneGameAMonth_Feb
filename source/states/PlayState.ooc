import vamos/State
import Player

PlayState: class extends State {
	
	player: Player
	enemy: BasicEnemy
	
	create: func {
		player = Player new(200, 100)
		add(player)
		enemy = BasicEnemy(300, 100, 270, 2)
		add(enemy)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}