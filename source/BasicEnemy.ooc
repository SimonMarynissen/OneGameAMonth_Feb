import Enemy
import AIs/BasicAI

BasicEnemy: class extends Enemy {

	init: func (.x, .y, horizontal: Bool, speed: Double) {
		super(x, y)
		ai = BasicAI new(horizontal, speed)
		addComp(ai)
		hit = 10
		type = "basic"
	}
}