import math

deg: func (rad:Double) -> Double {
	rad * 180 / PI
}

rad: func (deg:Double) -> Double {
	deg * PI / 180
}

sign: func (n:Double) -> Double {
	(n > 0) ? 1 : ((n < 0) ? -1 : 0)
}

max: inline func (a, b: Double) -> Double {
	(a > b) ? a : b
}

min: inline func (a, b: Double) -> Double {
	(a < b) ? a : b
}

clamp: func (n, min, max: Double) -> Double {
	(n < min) ? min : ((n > max) ? max : n)
}

extend Double {
	clamp: func(min, max: Double) -> Double { clamp(this, min, max) }
}
