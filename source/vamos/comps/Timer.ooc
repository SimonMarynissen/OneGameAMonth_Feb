import vamos/[Component, Entity]

Timer: class extends Component {
	
	interval := 10.0
	callback: Func
	_counter := 0.0
	_running := false
	_looping := false
	
	init: func {
		name = "timer"
	}
	init: func ~withInterval (=interval) {
		init()
	}
	init: func ~withCallback (=callback) {
		init()
	}
	init: func ~withIntervalAndCallback (=interval, =callback)
		init()
	}
	
	update: func (dt: Double) {
		if (_running) {
			_counter += dt
			if (_counter > interval) {
				callback()
				if (_looping) {
					_counter -= interval
				} else {
					_running = false
				}
			}
		}
	}
	
	start: func {
		_running = true
		_looping = false
	}
	
	start: func ~withInterval (interval: Double) {
		this interval = interval
		start()
	}
	
	loop: func {
		_running = true
		_looping = true
	}
	
	loop: func ~withInterval (interval: Double) {
		this interval = interval
		loop()
	}
	
	pause: func {
		_running = false
	}
	
	resume: func {
		_running = true
	}
	
	stop: func {
		_counter = 0
		_running = false
		_looping = false
	}
}