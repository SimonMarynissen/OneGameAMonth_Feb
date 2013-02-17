import ShootingAI
import Actor

IntervalShooter: class extends Component {
	
	actor: Actor
	interval: Double
	timer: Timer
	
	init: func (=interval)
	
	added: func {
		actor = entity as Actor
		timer = Timer new(interval, actor shoot)
		timer loop()
	}
}