import vamos/State
import Player
//import ComplexEnemy
import Fleet
import ai/AIFunctions

PlayState: class extends State {
	
	player: Player
	//enemy: ComplexEnemy
	enemies: Fleet
	
	create: func {
		player = Player new(200, 100)
		add(player)
		//enemy = ComplexEnemy new(200, 100, 225, 40)
		//enemy aiFunction = ai1(enemy)
		//enemies = Fleet new(200, 0, enemy)
		//enemies amount = 10
		//enemies interval = 1
		//add(enemies)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}