import math
import vamos/[Component, Util, Entity]
import vamos/comps/Physics
import Actor

LinearMotion: class extends Component {
	
	actor: Actor
	speed: Double = 0.0
	physics: Physics
	angle: Double {
		set(a) {
			angle = a
			while (angle < 0.0) angle += 360.0
			while (angle >= 360.0) angle -= 360.0
			adjustVelocity()
		}
		get {angle}
	}
	
	init: func (=angle, =speed)
	
	added: func {
		actor = entity as Actor
		physics = actor physics
		adjustVelocity()
	}
	
	adjustVelocity: func {
		if (actor && physics) {
			r := rad(angle)
			xSpeed := speed * r cos()
			ySpeed := speed * r sin()
			actor physics maxVelX = xSpeed abs()
			actor physics maxVelY = ySpeed abs()
			actor physics accX = 10000 * sign(xSpeed)
			actor physics accY = 10000 * -sign(ySpeed)
		}
	}
}
