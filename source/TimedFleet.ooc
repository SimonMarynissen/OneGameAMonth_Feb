import Fleet
import vamos/comps/Timer

TimedFleet: class extends Fleet {

	beginTime: Double = 10.0
	_starter: Timer

	init: func (=x, =y, =protoType)
	
	added: func {
		_starter = Timer new(beginTime, || begin())
		addComp("starter", _starter)
		_starter start()
	}
	
	begin: func {
		_starter stop()
		removeComp("starter")
		_timer = Timer new(interval, || spawn())
		addComp("timer", _timer)
		_timer loop()
	}
}