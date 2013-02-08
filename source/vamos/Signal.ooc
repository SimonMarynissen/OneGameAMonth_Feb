/**
	A signal class, inspired by FlashPunk's signals.
*/
Signal: class {
	
	_dispatching: Bool
	_listenerHead: SignalListener
	_listenerTail: SignalListener
	_removed: Array
	
	init: func {
		_dispatching = false
		_listenerHead = null
		_listenerTail = null
		_removed = null
	}
	
	add: func (listener: func) {
		if (find(listener) == null) {
			sl: SignalListener = SignalListener new()
			sl added = true
			sl listener = listener
			sl prev = _listenerTail
			sl next = null
			if (_listenerHead == null) {
				_listenerHead = sl
				_listenerTail = sl
			} else {
				_listenerTail next = sl
				_listenerTail = sl
			}
		}
	}
	
	find: func (listener: func) -> SignalListener {
		sl: SignalListener = _listenerHead
		while (sl != null) {
			if (sl.listener == listener) {
				break
			}
			sl = sl next;
		}
		return sl
	}
	
	remove: func (listener: func) {
		sl: SignalListener = find(listener)
		if (sl != null) _remove(sl)
	}
	
	removeAll: func {
		sl: SignalListener = _listenerHead
		while (sl != null) {
			sln: SignalListener = sl next
			_remove(sl)
			sl = sln
		}
		_listenerHead = null
		_listenerTail = null
	}
	
	dispatch: func (...args) {
		try {
			_dispatching = true
			sl: SignalListener = _listenerHead
			numArgs: Int = args length
			if (numArgs == 0) {
				while (sl != null) {
					if (sl added) sl listener()
					sl = sl next
				}
			} else if (numArgs == 1) {
				arg: Object = args[0]
				while (sl != null) {
					if (sl added) sl listener(args[0])
					sl = sl next
				}
			} else if (numArgs == 2) {
				arg1: Object = args[0]
				arg2: Object = args[1]
				while (sl != null) {
					if (sl added) sl listener(arg1, arg2)
					sl = sl next
				}
			} else {
				while (sl != null) {
					if (sl added) sl listener apply(null, args)
					sl = sl next
				}
			}
		} finally {
			_dispatching = false
			if (_removed && _removed length > 0) {
				il: UInt = _removed length
				for (i in 0..(il - 1)) {
					_remove(_removed[i])
				}
				_removed length = 0
			}
		}
	}
	
	_remove: func (sl: SignalListener) {
		if (sl != null) {
			if (_dispatching && sl added) {
				if (_removed == null) _removed = [sl]
				else _removed[_removed length] = sl
				sl added = false
			} else {
				if (sl == _listenerHead) _listenerHead = sl next
				if (sl == _listenerTail) _listenerTail = sl prev
				if (sl prev) sl prev next = sl next
				if (sl next) sl next prev = sl prev
				sl next = sl prev = null
				sl listener = null
				sl added = false
			}
		}
	}
	
	addOnce: func (f: func) {
		add(
			func (...args) {
				f apply(null, args)
				remove(f)
			}
		) 
	}
}

SignalListener: class {
	added: Bool
	listener: func
	next: SignalListener
	prev: SignalListener
	init: func {
		added = true
		listener = null
		next = null
		prev = null
	}
}