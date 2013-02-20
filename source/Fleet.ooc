import structs/HashBag, BagUtil
import vamos/Entity
import vamos/comps/Timer
import Enemy, Level

Fleet: class extends Entity {
	
	level: Level
	spawnType: String
	spawnConf: HashBag
	amount: Int = 10
	delay: Double = 0.0
	interval: Double = 1.0
	
	timer: Timer
	age: Double
	
	init: func (data:HashBag) {
		x = data getDouble("x")
		y = data getDouble("y")
		spawnType = data getString("type")
		amount = data getInt("amount")
		delay = data getDouble("delay")
		interval = data getDouble("interval")
		spawnConf = data getHashBag("conf")
	}
	
	added: func {
		level = state as Level
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
			enemy := Enemy create(spawnType,
				x * (level right - level left) - level padding,
				y * (level bottom - level top) - level padding)
			enemy configure(spawnConf)
			state add(enemy)
		} else {
			timer stop()
			removeComp("timer")
			state remove(this)
		}
	}
}