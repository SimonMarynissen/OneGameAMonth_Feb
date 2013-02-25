import structs/HashBag, BagUtil
import vamos/Entity
import vamos/comps/Timer
import Enemy, Level

Fleet: class extends Entity {
	
	level: Level
	data: HashBag
	spawnType: String
	amount: Int 
	delay: Double
	interval: Double
	spreadX, spreadY: Double
	
	spawned := 0
	
	timer: Timer
	age: Double
	
	init: func (=data) {
		x = data getDouble("x")
		y = data getDouble("y")
		spawnType = data getString("type")
		amount = data getInt("amount", 1)
		delay = data getDouble("after", 0)
		interval = data getDouble("interval", 0.3)
		spreadX = data getDouble("spread_x", 0)
		spreadY = data getDouble("spread_y", 0)
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
		if (spawned < amount) {
			e := Enemy create(spawnType)
			e fleetPos = spawned
			e x = (x + spawned*spreadX) * (level right - level left) - level padding
			e y = (y + spawned*spreadY) * (level bottom - level top) - level padding
			e configure(data)
			state add(e)
			spawned += 1
		} else {
			timer stop()
			removeComp("timer")
			state remove(this)
		}
	}
}