import Enemy

BasicEnemy: class extends Enemy {

	init: func (=x, =y) {
		ai = BasicAI new()
		hit = 10
		interval = 1.0
		type = "basic"
	}
	
	shoot: func () {
		world add(Bullet new(x, y))
	}
}