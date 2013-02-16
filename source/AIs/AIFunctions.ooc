import Actor
import vamos/Engine

ai1: func (actor: Actor) -> Double { // wall bouncing
	if (actor x < 0 && actor angle > 90 && actor angle < 270) {
		if (actor angle < 180) actor angle = 180 - actor angle
		else if (actor angle == 180) actor angle = 0
		else actor angle = 360 - (actor angle - 180)
	} else if (actor x + actor hitbox width > engine width && (actor angle < 90 || actor angle > 270)) {
		
	}
	if (actor y < 0 && actor angle > 0 && actor angle < 180) {
	
	} else if (actor y + actor hitbox height > engine height && actor angle > 180 && actor angle < 360) {
	
	}
	return actor angle
}