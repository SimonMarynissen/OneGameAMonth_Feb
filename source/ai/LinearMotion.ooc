import math
import vamos/[Component, Util, Entity]
import vamos/comps/Physics
import Actor

LinearMotion: class extends Component {
	
	actor: Actor
	speed: Double
	angle: Double
	
	init: func (=angle, =speed)
	
	added: func {
		actor = entity as Actor
		actor angle = angle
		adjustVelocity()
	}
	
	adjustVelocity: func {
		if (actor) {
			r := angle toRadians()
			xSpeed := speed * r cos()
			ySpeed := speed * r sin()
			actor physics maxVelX = xSpeed abs()
			actor physics maxVelY = ySpeed abs()
			actor physics accX = 10000 * xSpeed sign()
			actor physics accY = 10000 * -ySpeed sign()
		}
	}
}
