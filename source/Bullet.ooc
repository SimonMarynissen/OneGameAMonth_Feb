import vamos/[Entity, Vamos]
use Math

Bullet: class extends Projectile {
	
	speed: Double
	angle: Int {
		set(a) {
			angle %= a
		}
		get {angle}
	}
	
	init: super func
	init: super func ~rawArray
	
	added: func {
		rad := Vamos rad(angle)
		physics maxVelX = speed * Math cos(rad)
		physics maxVelY = speed * Math sin(rad)
		physics accX = 1000
		physics accY = 1000
	}
	
	clone: func -> Bullet {
		return Bullet new(x, y, types)
	}
}