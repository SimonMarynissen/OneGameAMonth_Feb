import structs/ArrayList

/*
	Inspired by AS3-Signals, by Rob Penner
	Dynamically-typed variable length argument are not supported, but you can sepcify any type to hold event information.
	If you don't need event information to be dispatched, you can use VoidSignal.
*/

Signal: class <T> {
	_listeners := ArrayList<ArgListener<T>> new()
	
	add: func (f:Func(T)) -> Int {
		_listeners add(ArgListener<T> new(f))
		return _listeners size-1
	}
	
	remove: func (i:Int) {
		_listeners removeAt(i)
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
	
	add: func (f:Func) -> Int {
		_listeners add(VoidListener new(f))
		return _listeners size-1
	}
	
	remove: func (i:Int) {
		_listeners removeAt(i)
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
