import structs/ArrayList
import vamos/Component
import vamos/Entity
import vamos/comps/Timer
import Bullet

EnemyGun: class extends Component {
	
	bullet: String
	interval: Double
	timer: Timer
	offsetX, offsetY: Double
	damageTypes: ArrayList<String>
	
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
		b := Bullet create(bullet)
		b position(entity x + offsetX, entity y + offsetY)
		b damageTypes = damageTypes
		entity state add(b)
	}
}