import AI

BasicAI: class {

	speed: Double
	angle: Int {
		set(a) {
			angle %= a
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