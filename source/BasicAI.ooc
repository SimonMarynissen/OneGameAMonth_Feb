import AI

BasicAI: class {

	horizontal: Bool
	speed: Double
	
	init: func (=horizontal, =speed) {
		name = "basicAI"
	}
	
	added: func {
		if (horizontal) {
			if (entity x < engine width / 2) {
				entity xVelocity = speed
			} else {
				entity xVelocity = -speed
			}
		} else {
			entity yVelocity = speed
		}
	}
}