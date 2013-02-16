import ShootingAI
import Actor

IntervalShooter: class extends ShootingAI {
	
	actor: Actor
	interval: Double = 10.0
	_timer: Timer
	
	init: func (=interval, .protoType) {
		super(protoType)
	}
	
	added: func {
		actor = entity as Actor
		_timer = Timer new(interval, actor shoot)
		_timer loop()
	}
}