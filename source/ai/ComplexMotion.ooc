import ai/LinearMotion
import Actor

ComplexMotion: class extends LinearMotion {
	
	newAngle: Func(Actor) -> Double
	
	init: func (angle, speed:Double, =newAngle) {
		super(angle, speed)
	}
	
	update: func (dt: Double) {
		newAngle(actor)
	}
}