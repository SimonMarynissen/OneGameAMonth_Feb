import vamos/[Entity, Vamos]
import structs/HashBag
import math

Bullet: class extends Projectile {
	
	speed: Double
	angle: Double
	aim: Bool = false
	
	init: super func
	init: super func ~rawArray
	
	added: func {
		rad: Double
		if (aim) {
			rad = atan2((state as PlayState) player x - x, (state as PlayState) player y - y)
		} else {
			rad = Vamos rad(angle)
		}
		physics maxVelX = speed * cos(rad)
		physics maxVelY = speed * sin(rad)
		physics accX = 1000
		physics accY = 1000
	}
	
	configure: func (data:HashBag) {
		super(data)
		for (k in data getKeys()) {
			match k {
				case "speed" => speed = data get("speed", Double)
				case "angle" => angle = data get("angle", Double)
				case "aim" => aim = data get("aiming", Bool)
			}
		}
	}
}