import math
import structs/[HashBag, ArrayList]
import vamos/[Entity, Util]
import vamos/comps/Physics
import vamos/masks/Hitbox
import Actor, Level, BagUtil

Bullet: class extends Entity {
	
	level: Level
	damage: Int = 0
	speed: Double = 100
	angle: Double
	target: Actor
	hitbox: Hitbox
	velX, velY: Double
	damageTypes: ArrayList<String>
	
	init: func {
		type = "bullet"
		hitbox = Hitbox new(4, 4, 1, 1)
		mask = hitbox
	}
	
	added: func {
		level = state as Level
		rad: Double
		if (target) rad = atan2(target x - x, target y - y)
		else rad = angle toRadians()
		velX = speed * rad sin()
		velY = speed * rad cos()
	}
	
	update: func (dt:Double) {
		x += velX * dt
		y += velY * dt
		if (damageTypes) {
			e := collide(damageTypes)
			if (e) {
				state remove(this)
			}
		}
		
		if (y > level bottom || x < level left || x > level right) {
			state remove(this)
		}
	}
	
	create: static func (type:String) -> Bullet {
		match type {
			case "regular" => RegularBullet new()
			case =>
				Exception new("No such enemy '%s'" format(type)) throw()
				null
		}
	}
	
}

import vamos/graphics/FilledRect

RegularBullet: class extends Bullet {
	
	init: func () {
		super()
		type = "regular_bullet"
		graphic = FilledRect new(6, 6, 0,0,0)
	}
}
