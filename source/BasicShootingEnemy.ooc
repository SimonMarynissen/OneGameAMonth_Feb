import BasicEnemy

BasicShootingEnemy: class extends BasicEnemy {

	BulletType: Class
	bulletSpeed: Double = 10.0
	interval = 1.0

	init: func (.x, .y, horizontal: Bool, speed: Double, =bulletType) {
		super(x, y, horizontal, speed)
	}
	
	shoot: func () {
		bullet := BulletType new(x, y, ["player"])
		bullet angle = Vamos deg(Math atan2(state player x, state player y))
		bullet speed = bulletSpeed 
		world add(bullet)
	}
}