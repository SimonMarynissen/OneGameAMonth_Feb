import MovementAI
import Actor
import vamos/[Util, Entity]
import vamos/comps/Physics
import math

LineairMovement: class extends MovementAI {
	
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
			rad := rad(angle)
			xSpeed := speed * cos(rad)
			ySpeed := speed * sin(rad)
			actor physics maxVelX = sign(xSpeed) * xSpeed
			actor physics maxVelY = sign(ySpeed) * ySpeed
			actor physics accX = 10000 * sign(xSpeed)
			actor physics accY = 10000 * -sign(ySpeed)
		}
	}
}
