import Enemy
import vamos/Entity
import vamos/comps/Timer

Fleet: class extends Entity {

	protoType: Enemy
	interval: Double
	amount: Int = 10
	_timer: Timer
	
	init: func (=x, =y, =protoType)
	
	added: func {
		_timer = Timer new(interval, || spawn())
		addComp(_timer)
		// _timer loop()
	}
	
	spawn: func {
		if (amount > 0) {
			amount -= 1
			newEnemy := protoType clone()
			newEnemy x = x
			newEnemy y = y
			// state add(newEnemy)
		} else {
			// _timer stop()
			removeSelf()
		}
	}
}