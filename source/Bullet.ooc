import math
import structs/[HashBag, ArrayList]
import vamos/[Entity, Util]
import vamos/comps/Physics
import Actor, BagUtil

Bullet: class extends Entity {
	
	physics := Physics new()
	damage: Int = 0
	speed: Double = 1000
	angle: Double
	target: Actor
	
	// Recommend to set this if you want the bullet to hit anything ;)
	damageTypes: ArrayList<String> {
		get { physics types }
		set (v) {
			if (v != null) physics types = v
			else physics types = ArrayList<String> new()
		}
	}
	
	init: func {
		physics handle(|e|
			if (e instanceOf?(Actor)) {
				(e as Actor) damage(damage)
				state remove(this)
			}
			false
		)
		addComp(physics)
		type = "bullet"
	}
	
	added: func {
		rad: Double
		if (target) {
			rad = atan2(target x - x, target y - y)
		} else {
			rad = angle toRadians()
		}
		physics velX = speed * rad cos()
		physics velY = speed * rad sin()
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
