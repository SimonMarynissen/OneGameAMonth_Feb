import LinearMovement
import Actor

ComplexMovement: class extends LinearMovement {
	
	newAngle: Func(Actor)
	
	init: func (=angle, =speed, =newAngle)
	
	update: func (dt: Double) {
		if (newAngle) {
			newAngle(actor)
			angle = actor angle
		}
	}
}