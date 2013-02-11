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

	init: func {
		health = maxHealth = 10
		physics = Physics new(["wall"])
		addComp(physics)
		hitbox = Hitbox new(20.0, 20.0)
		mask = hitbox
	}
	
	update: func (dt: Double) {
	
	}
	
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
	
	die: func
}