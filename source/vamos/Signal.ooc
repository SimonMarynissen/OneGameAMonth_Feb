import structs/ArrayList

/*
	Inspired by AS3-Signals, by Rob Penner
	Dynamically-typed variable length argument are not supported, but you can sepcify any type to hold event information.
	If you don't need event information to be dispatched, you can use VoidSignal.
*/

Signal: class <T> {
	_listeners := ArrayList<Func(T)> new()
	
	add: func (f:Func(T)) -> Int {
		_listeners add(f)
		return _listeners size-1
	}
	
	remove: func (f:Func(T)) {
		_listeners remove(f)
	}
	
	remove: func~byIndex (i:Int) {
		_listeners removeAt(i)
	}
	
	dispatch: func (event:T) {
		for (f in _listeners) f(event)
	}
}

VoidSignal: class {
	_listeners := ArrayList<Func> new()
	
	add: func (f:Func) -> Int {
		_listeners add(f)
		return _listeners size-1
	}
	
	remove: func (f:Func) {
		_listeners remove(f)
	}
	
	remove: func~byIndex (i:Int) {
		_listeners removeAt(i)
	}
	
	dispatch: func {
		for (f in _listeners) f()
	}
}