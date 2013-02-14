import Enemy, ShipGraphic
import AIs/BasicAI

BasicEnemy: class extends Enemy {

	init: func (.x, .y, =angle, speed: Double) {
		super(x, y)
		image := ShipGraphic new(3)
		image scale = 2
		graphic = image
		ai = BasicAI new(angle, speed)
		addComp(ai)
		hit = 10
		type = "basic"
	}
	
	clone: func -> BasicEnemy {
		enemy := BasicEnemy new(x, y, (ai as BasicAI) angle, (ai as BasicAI) speed)
		enemy ai = ai
		enemy hit = hit
		enemy interval = interval
		enemy angle = angle
		return enemy
	}
}