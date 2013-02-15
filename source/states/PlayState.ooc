import vamos/State
import Player
import BasicEnemy
import Fleet

PlayState: class extends State {
	
	player: Player
	enemy: BasicEnemy
	enemies: Fleet
	
	create: func {
		player = Player new(200, 100)
		add(player)
		enemy = BasicEnemy new(200, 100, 270, 40)
		enemies = Fleet new(200, 0, enemy)
		enemies amount = 10
		enemies interval = 1
		add(enemies)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}