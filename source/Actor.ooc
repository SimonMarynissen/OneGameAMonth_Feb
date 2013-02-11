import vamos/Entity
import vamos/masks/Hitbox
import vamos/Signal

Actor: class extends Entity {

	dead: Bool {get {health == 0}}
	health: Int
	maxHealth: Int
	physics: Physics
	hitbox: Hitbox
	onDie: Signal

	init: func (=x, =y) {
		health = maxhealth = 10
		physics = Physics new()
		addComp(physics)
		hitbox = Hitbox new(20.0, 20.0)
		mask = hitbox
		onDie = Signal new()
	}
	
	update: func (dt: Double) {
	
	}
	
	damage: func (damage: UInt) {
		health -= damage
		if (health < 0) health = 0
	}
	
	damage: func ~withSource (damage: UInt, source: Entity) {
		damage(damage)
		// knockback stuff
	}
	
	repair: func (repair: UInt) {
		health += repair
		if (health > maxHealth) health = maxHealth
	}
	
	die: func () {
		health = 0
		onDie dispatch()
	}
}