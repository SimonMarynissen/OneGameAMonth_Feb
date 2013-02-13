import vamos/[Entity, Vamos]
use Math

Bullet: class extends Entity {
	
	physics: Physics
	damage: Int = 0
	speed: Double
	angle: Int {
		set(a) {
			angle %= a
		}
		get {angle}
	}
	
	init: func (=x, =y, types:ArrayList<String>) {
		physics = Physics new(collideTypes)
		addComp(physics)
		type = "bullet"
	}
	
	init: func ~rawArray (=x, =y, types:String[]) {
		init(x, y, types as ArrayList<String>)
	}
	
	added: func {
		rad := Vamos rad(angle)
		xSpeed := speed * Math cos(rad)
		ySpeed := speed * Math sin(rad)
		// update physics
	}
	
	/* when bullet hits entity of right type {
		if (entity is Actor) {
			(state as PlayState) entity damage(damage)
		}
		world remove(this)
	*/
}