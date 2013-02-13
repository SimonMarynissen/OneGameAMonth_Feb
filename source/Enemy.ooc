import Actor

Enemy: class extends Actor {

	ai: AI
	hit: Int // when the player hits the ship, the player gets this amount of damage
	interval := 1000
	
	init: func (=x, =y) {
		health = maxHealth = 10
		physics = Physics new(["player"])
		addComp(physics)
		type = "enemy"
	}
	
	update: func (dt: Double) {
		// per interval call shoot()
	}
	
	shoot: func // defined in subclasses
}