import vamos/Entity

Projectile: class extends Entity {

	physics: Physics
	damage: Int = 0
	types: ArrayList<String>
	
	init: func (=x, =y, =types) {
		physics = Physics new(types)
		addComp(physics)
		type = "projectile"
	}
	
	init: func ~rawArray (.x, .y, types:String[]) {
		init(x, y, types as ArrayList<String>)
	}
	
	update: func (dt: Double) {
		for (t in types) {
			e := collide(t)
			if (e) {
				if (e is Actor) {
					e damage(damage)
					removeSelf()
				}
			}
		}
	}
	
	clone: abstract func
}