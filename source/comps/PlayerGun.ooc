import vamos/[Entity, State, Component]
import Bullet, Enemy

GunMode: enum {
	SINGLE,
	DOUBLE,
	TRIPLE
}

PlayerGun: class extends Component {
	
	mode: GunMode = GunMode SINGLE
	rate: Double = 0.1
	timer: Double
	firing := false
	
	init: func {
		
	}
	
	update: func (dt:Double) {
		timer -= dt
		if (timer < 0) {
			if (firing) {
				timer += rate
				shoot()
			}
			else timer = 0
		}
	}
	
	beginFiring: func {
		firing = true
	}
	
	endFiring: func {
		firing = false
	}
	
	shoot: func {
		b := Bullet create("player")
		b position(entity x, entity y)
		b damageTypes = Enemy allTypes
		b angle = 90
		b speed = 500
		state add(b)
	}
}