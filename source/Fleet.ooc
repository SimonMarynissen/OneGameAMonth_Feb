import Enemy
import vamos/Entity
import vamos/comps/Timer

Fleet: class extends Entity {

	spawnType: String
	interval: Double = 1.0
	amount: Int = 10
	timer: Timer
	
	init: func (=x, =y, =spawnType)
	
	added: func {
		timer = Timer new(interval, || spawn())
		addComp("timer", timer)
		timer loop()
	}
	
	spawn: func {
		if (amount > 0) {
			amount -= 1
			enemy := Enemy new(x, y) .build(spawnType)
			state add(enemy)
		} else {
			timer stop()
			removeComp("timer")
			removeSelf()
		}
	}
}