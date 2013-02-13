import AI
import Actor
import vamos/[Vamos, Entity]
import vamos/comps/Physics
import math

BasicAI: class extends AI {
	
	actor: Actor
	speed: Double = 0.0
	angle: Double {
		set (a) {
                    if (a > 360.0) {
                        angle = a - 360.0
                    } else if (a < 0.0) {
                        angle = a + 360.0
                    } else {
                        angle = a
                    }
                    adjustVelocity()
		}
		get {
                    angle
                }
	}
	
	init: func (=angle, =speed)
	
	added: func {
		actor = entity as Actor
		adjustVelocity()
	}
	
	adjustVelocity: func {
		if (actor) {
			rad := rad(angle)
			actor physics maxVelX = speed * cos(rad)
			actor physics maxVelY = speed * sin(rad)
			actor physics accX = 1000
			actor physics accY = 1000
		}
	}
}
