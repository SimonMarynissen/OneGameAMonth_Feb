import vamos/comps/Physics
import vamos/graphics/Image
import Actor
import ai/LinearMotion

Enemy: class extends Actor {

	damage: Int = 10
	
	init: func (.x, .y) {
		super(x, y)
		health = maxHealth = 10
		
		physics = Physics new(["player"])
		addComp(physics)
		physics handle(|e|
			if (e type == "player") {
				"ermahgerd!" println()
				return true
			}
			return true
		)
		
		type = "enemy"
	}
	
	build: func (type:String) {
		match type {
			case "example" =>
				addComp(LinearMotion new(225, 40))
				graphic = Image new("blueship.png")
			case =>
				Exception new("No instructions for building enemy '$s'" format(type)) throw()
		}
	}
}
