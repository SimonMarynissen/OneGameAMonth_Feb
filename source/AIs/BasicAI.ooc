import AI

BasicAI: class {

	speed: Double
	angle: Double {
		set(a) {
			angle %= a
			adjustVelocity()
		}
		get {angle}
	}
	
	init: func (=angle, =speed)
	
	adjustVelocity: func {
		rad := Vamos rad(angle)
		physics maxVelX = speed * Math cos(rad)
		physics maxVelY = speed * Math sin(rad)
		physics accX = 1000
		physics accY = 1000
	}
}