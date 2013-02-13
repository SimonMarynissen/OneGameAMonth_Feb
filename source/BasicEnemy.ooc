import Enemy
import AIs/BasicAI

BasicEnemy: class extends Enemy {

	init: func (.x, .y, =angle, speed: Double) {
		super(x, y)
		// ai = BasicAI new(angle, speed)
		// addComp(ai)
		hit = 10
		type = "basic"
	}
}