import Actor

Enemy: class extends Actor {

	ai: AI
	hit: Int // when the player hits the ship, the player gets this amount of damage
	interval := 1000
	angle: Double
	
	init: func (=x, =y) {
		health = maxHealth = 10
		physics = Physics new(["player"])
		addComp(physics)
		type = "enemy"
	}
	
	shoot: func // defined in subclasses
}