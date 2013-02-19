import structs/HashBag
import vamos/comps/Physics
import vamos/graphics/Image
import Actor
import ai/LinearMotion

Enemy: class extends Actor {

	damageAmount:Int = 10
	
	init: super func {
		//physics handle(|e|
		//	if (e type == "player") {
		//		//e as Actor 
		//		return false
		//	}
		//	return true
		//)
		
		type = "enemy"
	}
	
	create: static func (type:String) -> Enemy {
		match type {
			case "example" => ExampleEnemy new()
			case =>
				Exception new("No class for type '%s'" format(type)) throw()
				null
		}
	}
	
	create: static func~withPos(type:String, x, y:Double) -> Enemy {
		e := create(type)
		e x = x; e y = y
		return e
	}
	
	configure: func (data:HashBag) {
		for (k in data getKeys()) {
			match k {
				case "damage" => damageAmount = data get("damage", Int)
				case "health" =>
					maxHealth = data get("health", Int)
					health = maxHealth
			}
		}
	}
}

ExampleEnemy: class extends Enemy {
	
	init: super func {
		graphic = Image new("blueship.png")
		type = "example"
	}
	
	configure: func (data:HashBag) {
		super(data)
		angle := data get("angle", Double)
		speed := data get("speed", Double)
		addComp(LinearMotion new(angle, speed))
	}
	
}
