import vamos/[Entity, Signal]
import vamos/masks/Hitbox
import vamos/comps/Physics
import structs/ArrayList

Actor: class extends Entity {

	dead: Bool {get {health == 0}}
	health: Int
	maxHealth: Int
	physics: Physics
	hitbox: Hitbox
	angle: Double
	accel := 10000

	init: func (=x, =y) {
		health = maxHealth = 10
		physics = Physics new(["wall"])
		addComp(physics)
		hitbox = Hitbox new(20.0, 20.0)
		mask = hitbox
		type = "actor"
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
		removeSelf()
	}
	
	shoot: func
}