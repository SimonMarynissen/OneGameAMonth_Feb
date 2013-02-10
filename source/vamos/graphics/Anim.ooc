import vamos/Graphic

Anim: class extends Graphic {
       
	frames :Int[]
	speed :Int
	looped :Bool
       
	_playing :Bool
	_currentIndex :Int
	_tick :Int
       
	init: func (=frames, =speed, =looped) {
		_tick = 0
		_currentIndex = 0
	}
       
	currentFrame: func () -> Int {
		return frames[_currentIndex]
	}
       
	play: func(reset :Bool) {
		_playing = true
		if (reset)
			_currentIndex = 0
		_tick = 0
	}
       
	pause: func {
		_playing = false
	}
       
	update: func {
		if (!_playing) return
	       
		_tick += 1
		if (_tick == speed) {
		       
			if (_currentIndex + 1 == frames length) {
				if (looped) {
					_currentIndex = 0
				}
			} else {
				_currentIndex += 1
			}
			_tick = 0
		}
	}
}