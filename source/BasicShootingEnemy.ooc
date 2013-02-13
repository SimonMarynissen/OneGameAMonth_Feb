import BasicEnemy

BasicShootingEnemy: class extends BasicEnemy {

	bulletProtoType: Bullet
	bulletSpeed: Double = 10.0
	interval = 1.0
	timer: Timer

	init: func (.x, .y, horizontal: Bool, speed: Double, =bulletProtoType) {
		super(x, y, horizontal, speed)
	}
	
	added: func {
		timer = Timer(interval, || shoot())
	}
	
	shoot: func {
		bullet := bulletProtoType clone()
		bullet x = x
		bullet y = y
		bullet type = ["player"]
		bullet angle = Vamos deg(Math atan2(state player x, state player y))
		bullet speed = bulletSpeed 
		state add(bullet)
	}
}