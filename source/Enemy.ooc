import Actor
import AIs/AI
import vamos/comps/Physics

Enemy: class extends Actor {

	movementAI: MovementAI
	hit: Int = 10 // when the player hits the ship, the player gets this amount of damage
	
	init: func (.x, .y) {
		super(x, y)
		health = maxHealth = 10
		physics = Physics new([])
		addComp(physics)
		type = "enemy"
	}
	
	addAI: func (movementAI: MovementAI) {
		this movementAI = movementAI
		addComp("movementAI", movementAI)
	}
}