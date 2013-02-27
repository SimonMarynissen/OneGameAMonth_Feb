import structs/[ArrayList, HashBag], BagUtil
import vamos/Engine
import vamos/comps/[Physics, Tween]
import vamos/graphics/[Image, SpriteMap]
import Actor, Level, Bullet, Explosion
import ai/[Motion, EnemyGun]

Enemy: class extends Actor {
	
	allTypes: static ArrayList<String>
	allTypes = [
		"popcorn", // easy to destroy, doesn't shoot bullets, has many designs
		"rocket",  // red ship, trundles along shooting in the direction of the player
		"shell",   // round blue ship which sprays bullets in different patterns 
		"insect",  // moves horizontally and vertically, fires straight down
		"meteor",  // space debris, just damages you
		"shadow",  // strong, only shoots bullets when hit, explodes into more bullets
		"barrier"  // inflicts high damage on collision, gets in the way
	] as ArrayList<String>
	
	fleetPos:Int
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
	}
	
	update: func (dt:Double) {
		if (x < level left - 20 || x > level right + 20)
			level remove(this)
	}
	
	create: static func (type:String) -> Enemy {
		match type {
			case "popcorn" => Popcorn new()
			case "shell" => Shell new()
			case "rocket" => Rocket new()
			case "insect" => Insect new()
			case "meteor" => Meteor new()
			case "shadow" => Shadow new()
			case "barrier" => Barrier new()
			case =>
				raise("No such enemy '%s'" format(type))
				null
		}
	}
	
	create: static func~withPos(type:String, x, y:Double) -> Enemy {
		e := create(type)
		e position(x, y)
		return e
	}
	
	configure: func (data:HashBag) {
		if (data contains?("damage")) {
			damageAmount = data getInt("damage")
		}
		if (data contains?("health")) {
			maxHealth = data getInt("health")
			health = maxHealth
		}
		if (data contains?("event")) {
			events := data getBag("event")
			for (i in 0..events size)
				addComp(EnemyEvent new(events getHashBag(i)))
		}
		if (data contains?("remove")) {
			state remove(this)
		}
	}
}


// EnemyEvent is a timer that sets properties of an enemy after a certain amount of time
// the properties should be the same as the enemy config itself
// the creation of the enemy could count as an event in itself, removing duplication?

import vamos/Component

EnemyEvent: class extends Component {
	
	enemy: Enemy
	data: HashBag
	time: Double
	
	init: func(=data) {
		time = data getDouble("after", 0)
	}
	
	added: func {
		enemy = entity as Enemy
		time += data getDouble("spread", 0) * enemy fleetPos
	}
	
	update: func(dt:Double) {
		time -= dt
		if (time < dt) {
			enemy configure(data)
			enemy removeComp(this)
		}
	}
}


Popcorn: class extends Enemy {
	
	sheet := SpriteMap new("enemy_popcorn.png", 16, 16)
	motion := Motion new()
	
	init: func {
		super()
		health = maxHealth = 2
		type = "popcorn"
		hitbox set(16, 8) .center()
		addComp(motion)
		sheet center()
		graphic = sheet
	}
	
	configure: func (data:HashBag) {
		super(data)
		
		if (data contains?("style"))
			sheet frame = frame(data getString("style"))
		
		motion configure(data)
	}
	
	damage: func (amount:Int) {
		super(amount)
		addComp(Tween new(0.3, |n| sheet color set(1,1,n,n)))
	}
	
	die: func {
		super()
		state add(Explosion new(x, y))
		state remove(this)
	}
	
	frame: func (style:String) -> Int {
		match style {
			case "dark" => 0
			case "blue" => 1
			case "green" => 2
			case "orange" => 3
			case "yellow" => 4
			case "purple" => 5
			case "white" => 6
			case "palegreen" => 7
			case "palepurple" => 8
			case "paleblue" => 9
			case => 0
		}
	}
}

Shell: class extends Enemy {

	init: func {
		super()
		type = "shell"
		img := Image new("enemy_shell.png") .center()
		graphic = img
	}
	
	configure: func (data:HashBag) {
		super(data)
		rate := data getDouble("fire_rate", 0.5)
		
		addComp(Motion new(data))
		addComp(EnemyGun new(rate, "regular"))
	}
}

Rocket: class extends Enemy {
	
	init: func {
		super()
		type = "rocket"
		sheet := SpriteMap new("enemy_rocket.png", 16, 16) .center()
		graphic = sheet
	}
	
	configure: func (data:HashBag) {
		super(data)
		addComp(Motion new(data))
	}
}

Insect: class extends Enemy {
	
	init: func {
		super()
		type = "insect"
		img := Image new("enemy_insect.png") .center()
		graphic = img
	}
	
	configure: func (data:HashBag) {
		super(data)
	}
}

Meteor: class extends Enemy {
	
	init: func {
		super()
		type = "meteor"
		img := Image new("enemy_meteor.png") .center()
		graphic = img
	}
	
	configure: func (data:HashBag) {
		super(data)
	}
}

Shadow: class extends Enemy {
	
	init: func {
		super()
		type = "shadow"
		img := Image new("enemy_shadow.png") .center()
		graphic = img
	}
	
	configure: func (data:HashBag) {
		super(data)
	}
}

Barrier: class extends Enemy {
	
	init: func {
		super()
		type = "barrier"
		img := Image new("enemy_barrier.png") .center()
		graphic = img
	}
	
	configure: func (data:HashBag) {
		super(data)
	}
}
