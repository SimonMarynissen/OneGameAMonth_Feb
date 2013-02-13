import vamos/[Entity, Vamos]
import math

Bullet: class extends Projectile {
	
	speed: Double
	angle: Double {
		set(a) {
			angle %= a
		}
		get {angle}
	}
	
	init: super func
	init: super func ~rawArray
	
	added: func {
		rad := Vamos rad(angle)
		physics maxVelX = speed * cos(rad)
		physics maxVelY = speed * sin(rad)
		physics accX = 1000
		physics accY = 1000
	}
	
	clone: func -> Bullet {
		return Bullet new(x, y, types)
	}
}