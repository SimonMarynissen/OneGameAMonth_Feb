import text/json/Parser
import structs/[Bag, HashBag]


// Allow you to get various number types from a JSON-decoded HashBag, without errors.
// Extra methods have been added for consistency.

extend HashBag {
	
	getInt: func(key:String) -> Int {
		_assertContains(key)
		t := getClass(key)
		match t {
			case Int =>    return get(key, Int)
			case Double => return get(key, Double) as Int
			case Number => return get(key, Number) value toInt()
		}
		raise("Key '%s' (%s) can't be converted to Int" format(key, t name))
		-1
	}
	
	getDouble: func(key:String) -> Double {
		_assertContains(key)
		t := getClass(key)
		match t {
			case Double => return get(key, Double)
			case Int =>    return get(key, Int) as Double
			case Number => return get(key, Number) value toDouble()
		}
		raise("Key '%s' (%s) can't be converted to Double" format(key, t name))
		-1.0
	}
	
	getString: func(key:String) -> String {
		_assertContains(key)
		get(key, String)
	}
	getBool: func(key:String) -> Bool {
		_assertContains(key)
		get(key, Bool)
	}
	getBag: func(key:String) -> Bag {
		_assertContains(key)
		get(key, Bag)
	}
	getHashBag: func(key:String) -> HashBag {
		_assertContains(key)
		get(key, HashBag)
	}
	
	// functions to retrieve values, returning a default if the value doesn't exist
	
	getInt: func ~withDefault (key:String, def:Int) -> Int {
		if (contains?(key)) return getInt(key)
		return def
	}
	getDouble: func ~withDefault (key:String, def:Double) -> Double {
		if (contains?(key)) return getDouble(key)
		return def
	}
	getString: func ~withDefault (key:String, def:String) -> String {
		if (contains?(key)) return getString(key)
		return def
	}
	getBool: func ~withDefault (key:String, def:Bool) -> Bool {
		if (contains?(key)) return getBool(key)
		return def
	}
	getBag: func ~withDefault (key:String, def:Bag) -> Bag {
		if (contains?(key)) return getBag(key)
		return def
	}
	getHashBag: func ~withDefault (key:String, def:HashBag) -> HashBag {
		if (contains?(key)) return getHashBag(key)
		return def
	}
	
	_assertContains: func(key:String) {
		if (!contains?(key))
			raise("No such key '%s' in the HashBag" format(key))
	}
	
}

extend Bag {
	
	getInt: func(n:Int) -> Int {
		_assertContains(n)
		t := getClass(n)
		match t {
			case Int =>    return get(n, Int)
			case Double => return get(n, Double) as Int
			case Number => return get(n, Number) value toInt()
		}
		raise("Element %d (%s) can't be converted to Int" format(n, t name))
		-1
	}
	
	getDouble: func(n:Int) -> Double {
		_assertContains(n)
		t := getClass(n)
		match t {
			case Double => return get(n, Double)
			case Int =>    return get(n, Int) as Double
			case Number => return get(n, Number) value toDouble()
		}
		raise("Element %d (%s) can't be converted to Double" format(n, t name))
		-1.0
	}
	
	getString: func(n:Int) -> String {
		_assertContains(n)
		get(n, String)
	}
	
	getBool: func(n:Int) -> Bool {
		_assertContains(n)
		get(n, Bool)
	}
	
	getBag: func(n:Int) -> Bag {
		_assertContains(n)
		get(n, Bag)
	}
	
	getHashBag: func(n:Int) -> HashBag {
		_assertContains(n)
		get(n, HashBag)
	}
	
	_assertContains: func(n:Int) {
		if (data get(n) == null)
			raise("No item at index '%d' in the Bag" format(n))
	}
	
}

