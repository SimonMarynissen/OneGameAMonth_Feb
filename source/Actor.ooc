import structs/ArrayList
import vamos/[Entity, Signal]
import vamos/masks/Hitbox
import vamos/comps/Physics
import Level

Actor: class extends Entity {
	
	level: Level
	dead: Bool {get {health == 0}}
	health: Int
	maxHealth: Int
	physics: Physics
	hitbox: Hitbox
	accel: Double = 10000
	angle: Double {
		get
		set(a) {
			while (a < 0) a += 360
			while (a >= 360) a -= 360
			angle = a
		}
	}

	init: func {
		health = maxHealth = 10
		physics = Physics new(["wall"])
		addComp(physics)
		hitbox = Hitbox new(16, 16)
		mask = hitbox
		type = "actor"
	}
	
	added: func {
		level = state as Level
	}
	
	
	update: func (dt: Double) {
		
	}
	
	stopX: func { physics accX = 0 }
	stopY: func { physics accY = 0 }
	moveLeft: func { physics accX = -accel }
	moveRight: func { physics accX = accel }
	moveUp: func { physics accY = -accel }
	moveDown: func { physics accY = accel }
	
	damage: func (damage: UInt) {
		health -= damage
		if (health < 0) {
			health = 0
			die()
		}
	}
	
	damage: func ~withSource (damage: UInt, source: Entity) {
		damage(damage)
		// knockback stuff
	}
	
	repair: func (repair: UInt) {
		health += repair
		if (health > maxHealth) health = maxHealth
	}
	
	die: func {
		state remove(this)
	}
}