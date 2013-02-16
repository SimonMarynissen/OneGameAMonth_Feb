import AI
import Projectile

ShootingAI: class extends AI {
	
	protoType: Projectile
	
	init: func (=protoType) {
		name = "ShootingAI"
	}
}