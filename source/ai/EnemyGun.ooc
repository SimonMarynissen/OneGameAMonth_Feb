import structs/ArrayList
import vamos/[Component, Entity, State]
import vamos/comps/Timer
import Bullet

_damageTypes := static ["player"] as ArrayList<String>

EnemyGun: class extends Component {
	
	bullet: String
	interval: Double
	timer: Timer
	offsetX, offsetY: Double
	target: Entity
	
	init: func (=interval, =bullet) {
		timer = Timer new(interval, || shoot())
		timer loop()
	}
	
	added: func {
		entity addComp(timer)
	}
	removed: func {
		entity removeComp(timer)
	}
	
	offset: func(x, y:Double) {
		offsetX = x
		offsetY = y
	}
	
	shoot: func {
		if (target == null)
			target = state getFirst("player")
			
		b := Bullet create(bullet)
		b position(entity x + offsetX, entity y + offsetY)
		b damageTypes = _damageTypes
		b target = target
		state add(b)
	}
}