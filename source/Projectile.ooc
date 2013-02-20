import vamos/Entity
import structs/HashBag

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
			if (e && e instaceOf?(Actor)) {
				(e as Actor) damage(damage)
				state remove(this)
			}
		}
	}

	configure: func (data HashBag) {
		for (k in data getKeys()) {
			match k {
				case "damage" => damage = data get("damage", Int)
			}
		}
	}
	
	clone: func (x, y: Double) -> Projectile {
		proj := Projectile new(x, y, types)
		proj damage = this damage
		return proj
	}
}