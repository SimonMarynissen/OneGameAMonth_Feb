import Enemy

ShootingEnemy: class extends Enemy {

	shootingAI: ShootingAI

	init: func (.x, .y) {
		super(x, y)
	}
	
	addShootingAI: func (shootingAI: ShootingAI) {
		this shootingAI = shootingAI
		addComp("shootingAI", shootingAI)
	}
}