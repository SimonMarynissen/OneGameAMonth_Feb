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
	_listeners := ArrayList<VoidListener> new()
	
	add: func (f:Func) -> Int {
		_listeners add()
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

VoidListener: class {
	dispatch: abstract func
}

PlainListener: class extends VoidListener {
	f:Func
	init: func(=f)
	
	dispatch: func() {
		f()
	}
}

ScopedListener: class <S> extends VoidListener {
	f:Func(S)
	scope:S
	init: func(=f)
	
	dispatch: func() {
		f(scope)
	}
}


ArgListener: class <T> {
	dispatch: abstract func(val:T)
}

PlainArgListener: class <T> extends ArgListener<T> {
	f:Func(T)
	init: func(=f)
	
	dispatch: func(val:T) {
		f(val)
	}
}

ScopedArgListener: class <S,T> extends ArgListener<T> {
	f:Func(S,T)
	scope:S
	init: func(=f, =scope)
	
	dispatch: func(val:T) {
		f(scope, val)
	}
}

