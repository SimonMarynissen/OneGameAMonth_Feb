import Actor
import AIs/AI
import vamos/comps/Physics

Enemy: class extends Actor {

	ai: AI
	hit: Int // when the player hits the ship, the player gets this amount of damage
	interval := 1000
	angle: Double
	
	init: func (.x, .y) {
		super(x, y)
		health = maxHealth = 10
		physics = Physics new(["player"])
		addComp(physics)
		type = "enemy"
	}
	
	clone: func -> Enemy {
		enemy := Enemy new(x, y)
		enemy ai = ai
		enemy hit = hit
		enemy interval = interval
		enemy angle = angle
		return enemy
	}
	
	shoot: func // defined in subclasses
}