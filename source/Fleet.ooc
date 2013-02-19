import structs/HashBag
import Enemy
import vamos/Entity
import vamos/comps/Timer

Fleet: class extends Entity {

	spawnType: String
	spawnConf: HashBag
	amount: Int = 10
	delay: Double = 0.0
	interval: Double = 1.0
	
	timer: Timer
	age: Double
	
	init: func (data:HashBag) {
		x = data get("x", Double)
		y = data get("y", Double)
		spawnType = data get("type", String)
		amount = data get("amount", Int)
		delay = data get("delay", Double)
		interval = data get("interval", Double)
		spawnConf = data get("conf", HashBag)
	}
	
	update: func (dt:Double) {
		age += dt
		if (timer == null && age > delay) {
			timer = Timer new(interval, || spawn())
			addComp("timer", timer)
			timer loop()
		}
	}
	
	spawn: func {
		if (amount > 0) {
			amount -= 1
			enemy := Enemy create(spawnType, x, y)
			enemy configure(spawnConf)
			state add(enemy)
		} else {
			timer stop()
			removeComp("timer")
			state remove(this)
		}
	}
}