import text/json/Parser
import structs/[Bag, HashBag]


// Allow you to get various number types from a JSON-decoded HashBag, without errors.
// Extra methods have been added for consistency.

extend HashBag {
	
	getInt: func(key:String) -> Int {
		t := getClass(key)
		match t {
			case Int =>    return get(key, Int)
			case Double => return get(key, Double) as Int
			case Number => return get(key, Number) value toInt()
		}
		Exception new("Key '%s' (%s) can't be converted to Int" format(key, t name)) throw()
		-1
	}
	
	getDouble: func(key:String) -> Double {
		t := getClass(key)
		match t {
			case Double => return get(key, Double)
			case Int =>    return get(key, Int) as Double
			case Number => return get(key, Number) value toDouble()
		}
		Exception new("Key '%s' (%s) can't be converted to Double" format(key, t name)) throw()
		-1.0
	}
	
	getString: func(key:String) -> String {
		get(key, String)
	}
	
	getBool: func(key:String) -> Bool {
		get(key, Bool)
	}
	
	getBag: func(key:String) -> Bag {
		get(key, Bag)
	}
	
	getHashBag: func(key:String) -> HashBag {
		get(key, HashBag)
	}
	
}

extend Bag {
	
	getInt: func(index:Int) -> Int {
		t := getClass(index)
		match t {
			case Int =>    return get(index, Int)
			case Double => return get(index, Double) as Int
			case Number => return get(index, Number) value toInt()
		}
		Exception new("Key '%s' (%s) can't be converted to Int" format(index, t name)) throw()
		-1
	}
	
	getDouble: func(index:Int) -> Double {
		t := getClass(index)
		match t {
			case Double => return get(index, Double)
			case Int =>    return get(index, Int) as Double
			case Number => return get(index, Number) value toDouble()
		}
		Exception new("Key '%s' (%s) can't be converted to Double" format(index, t name)) throw()
		-1.0
	}
	
	getString: func(i:Int) -> String {
		get(i, String)
	}
	
	getBool: func(i:Int) -> Bool {
		get(i, Bool)
	}
	
	getBag: func(i:Int) -> Bag {
		get(i, Bag)
	}
	
	getHashBag: func(i:Int) -> HashBag {
		get(i, HashBag)
	}
	
}

