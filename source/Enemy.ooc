import structs/HashBag, BagUtil
import vamos/Engine
import vamos/comps/Physics
import vamos/graphics/[Image, SpriteMap]
import Actor
import ai/LinearMotion

Enemy: class extends Actor {

	damageAmount:Int = 10
	
	init: func {
		super()
		 
		physics handle(|e|
			if (e type == "player") {
				// damage
				return false
			}
			return true
		)
		
		type = "enemy"
	}
	
	create: static func (type:String) -> Enemy {
		match type {
			case "blue" => BlueEnemy new()
			case "red" => RedEnemy new()
			case =>
				Exception new("No such enemy '%s'" format(type)) throw()
				null
		}
	}
	
	create: static func~withPos(type:String, x, y:Double) -> Enemy {
		e := create(type)
		e x = x
		e y = y
		return e
	}
	
	configure: func (data:HashBag) {
		for (k in data getKeys()) {
			match k {
				case "damage" => damageAmount = data getInt("damage")
				case "health" =>
					maxHealth = data getInt("health")
					health = maxHealth
			}
		}
	}
}

BlueEnemy: class extends Enemy {
	
	init: super func {
		graphic = Image new("enemy_blue.png")
		type = "blue"
	}
	
	configure: func (data:HashBag) {
		super(data)
		angle := data getDouble("angle")
		speed := data getDouble("speed")
		"b angle = %f, speed = %f" printfln(angle, speed)
		addComp(LinearMotion new(angle, speed))
	}
}

BlueShooter: class extends BlueEnemy {

	init: super func {
		graphic = Image new("enemy_blue.png")
		type = "blueshooter"
	}
	
	configure: func (data:HashBag) {
		super(data)
		interval := data get("interval", Double)
		comp := IntervalShooter new(interval)
		bullet := Bullet new(0, 0, ["player"])
		bullet configure(data get("bullet", HashBag))
		comp prototype = bullet
		addComp(comp)
	}
}

RedEnemy: class extends Enemy {
	
	init: super func {
		graphic = SpriteMap new("enemy_red.png", 16, 16)
		type = "red"
	}
	
	configure: func (data:HashBag) {
		super(data)
		angle := data getDouble("angle")
		speed := data getDouble("speed")
		"r angle = %f, speed = %f" printfln(angle, speed)
		addComp(LinearMotion new(angle, speed))
	}
}
