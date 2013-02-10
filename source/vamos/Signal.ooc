import structs/ArrayList

/*
	Inspired by AS3-Signals, by Rob Penner
	Dynamically-typed variable length argument are not supported, but you can sepcify any type to hold event information.
	If you don't need event information to be dispatched, you can use VoidSignal.
*/

Signal: class <T> {
	_listeners := ArrayList<ArgListener<T>> new()
	
	add: func (f:Func(T)) -> ArgListener {
		l := ArgListener<T> new(f)
		_listeners add(l)
		return l
	}
	
	remove: func (l:ArgListener) {
		_listeners remove(l)
	}
	
	dispatch: func (param:T) {
		for (l in _listeners) l call(param)
	}
}

ArgListener: class <T> {
	f: Func(T)
	init: func(=f)
	call: func(param:T) { f(param) }
}


VoidSignal: class {
	_listeners := ArrayList<VoidListener> new()
	
	add: func (f:Func) -> VoidListener {
		l := VoidListener new(f)
		_listeners add(l)
		return l
	}
	
	remove: func (l:VoidListener) {
		_listeners remove(l)
	}
	
	dispatch: func {
		for (l in _listeners) l call()
	}
}

VoidListener: class {
	f: Func
	init: func(=f)
	call: func { f() }
}
