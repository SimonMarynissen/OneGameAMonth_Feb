import math
import structs/[HashBag, ArrayList]
import vamos/[Entity, Util]
import vamos/comps/Physics
import Actor, BagUtil

Bullet: class extends Entity {
	
	damage: Int = 0
	speed: Double = 1000
	angle: Double
	target: Actor
	velX, velY: Double
	
	// Recommend to set this if you want the bullet to hit anything ;)
	damageTypes: ArrayList<String>
	init: func {
		type = "bullet"
	}
	
	added: func {
		rad: Double
		if (target) rad = atan2(target x - x, target y - y)
		else rad = angle toRadians()
		velX = speed * rad cos()
		velY = speed * rad sin()
	}
	
	update: func (dt:Double) {
		x += velX
		y += velY
		if (damageTypes) {
			e := collide(damageTypes)
			if (e) {
				"BANG" println()
				state = null
			}
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
		graphic = FilledRect new(4, 4, 0,0,0)
	}
}
