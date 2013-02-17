import Actor
import vamos/comps/Physics

Enemy: class extends Actor {

	//movementAI: MovementAI
	damage: Int = 10
	
	init: func (.x, .y) {
		super(x, y)
		health = maxHealth = 10
		physics = Physics new()
		addComp(physics)
		type = "enemy"
	}
	
	//addAI: func (movementAI: MovementAI) {
	//	this movementAI = movementAI
	//	addComp("movementAI", movementAI)
	//}
	//
	clone: func -> Enemy {
		Enemy new(x, y)
	}
}