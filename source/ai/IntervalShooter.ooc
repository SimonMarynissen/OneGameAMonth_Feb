

IntervalShooter: class extends Component {
	
	interval: Double
	prototype: Projectile
	timer: Timer
	
	init: func (=interval)
	
	added: func {
		timer = Timer new(interval, || shoot())
		timer loop()
	}
	
	shoot: func {
	
	}
}