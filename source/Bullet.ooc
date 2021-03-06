import math
import structs/[HashBag, ArrayList], BagUtil
import vamos/[Entity, Util]
import vamos/graphics/Image
import vamos/comps/Physics
import vamos/masks/Hitbox
import Actor, Level, Enemy

Bullet: class extends Entity {
	
	level: Level
	damage: Int = 0
	speed: Double = 60
	angle: Double
	target: Actor
	hitbox: Hitbox
	velX, velY: Double
	damageTypes: ArrayList<String>
	
	init: func {
		type = "bullet"
		hitbox = Hitbox new(0,0)
		mask = hitbox
	}
	
	added: func {
		level = state as Level
		rad: Double
		if (target) rad = atan2(target x - x, target y - y)
		else rad = angle toRadians()
		velX = speed * rad cos()
		velY = speed * -rad sin()
	}
	
	update: func (dt:Double) {
		x += velX * dt
		y += velY * dt
		if (damageTypes) {
			e := collide(damageTypes)
			if (e && e instanceOf?(Actor)) {
				e as Actor damage(damage)
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
			case "player" => PlayerBullet new()
			case =>
				raise("No such enemy '%s'" format(type))
				null
		}
	}
	
}

import vamos/graphics/FilledRect

RegularBullet: class extends Bullet {
	
	init: func {
		super()
		type = "regular_bullet"
		
		fill := FilledRect new(9, 9, 0,0,0) .center()
		graphic = fill
	}
}

PlayerBullet: class extends Bullet {
	
	init: func {
		super()
		type = "player_bullet"
		damage = 100
		hitbox set(6, 6) .center()
		image := Image new("bullets.png") .center()
		graphic = image
	}
	
}
