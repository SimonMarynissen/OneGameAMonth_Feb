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
	clamp: inline func(min, max: This) -> This { clamp(this, min, max) }
	sign: inline func -> This { sign(this) }
	toRadians: inline func -> This { rad(this) }
	toDegrees: inline func -> This { deg(this) }
}

// // Color in ARGB format
//Color: cover from UInt32 {
//	
//	//a: UInt8 {
//	//	get { this >> 24 }
//	//	//set(v) { this = this & 0x00ffffff | (v << 24)}
//	//}
//	//r: UInt8 {
//	//	get { (this >> 16) & 0xff }
//	//	//set(v) { this = this & 0xff00ffff | (v << 16)}
//	//}
//	//g: UInt8 {
//	//	get { (this >> 8) & 0xff }
//	//	//set(v) { this = this & 0xff00ffff | (v << 8)}
//	//}
//	//b: UInt8 {
//	//	get { this & 0xff }
//	//	//set(v) { this = this & 0xffffff00 | v }
//	//}
//	//
//	toString: func -> String {
//		"#%x" format(this)
//	}
//}

Color: cover {
	a:UInt8 = 255
	r,g,b:UInt8
	
	set: func@ ~separate (_a, _r, _g, _b:UInt8) {
		(a,r,g,b) = (_a,_r,_g,_b)
	}
	
	set: func@ ~combined (argb:UInt32) {
		a = argb >> 24
		r = (argb >> 16) & 0xff
		g = (argb >> 8) & 0xff
		b = argb & 0xff 
	}
	
	argb: func@ -> UInt32 {
		(a << 24) & (r << 16) & (g << 8) & b
	}
	
	toString: func@ -> String {
		"#%x" format(argb())
	}
}
