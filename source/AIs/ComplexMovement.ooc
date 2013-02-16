import LineairMovement
import Actor

ComplexMovement: class extends LineairMovement {
	
	newAngle: Func(Actor)
	
	init: func (=angle, =speed, =newAngle)
	
	update: func (dt: Double) {
		if (newAngle) {
			newAngle(actor)
			angle = actor angle
		}
	}
}