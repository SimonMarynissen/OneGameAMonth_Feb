import vamos/State
import Player, Enemy, Fleet
import ai/ComplexMotion

PlayState: class extends State {
	
	player: Player
	enemy: Enemy
	enemies: Fleet
	
	create: func {
		player = Player new(200, 100)
		add(player)
		
		enemies = Fleet new(200, 0, "example")
		enemies amount = 10
		enemies interval = 1
		add(enemies)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}