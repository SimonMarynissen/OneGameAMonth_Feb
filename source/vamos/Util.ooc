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


Color: cover {
	a:UInt8 = 255
	r,g,b:UInt8
	
	/// Sets each channel separately
	set: func@ ~separate (_a, _r, _g, _b:UInt8) {
		(a,r,g,b) = (_a,_r,_g,_b)
	}
	
	/// Sets each channel based on values from 0 to 1
	set: func@ ~fractions (_a, _r, _g, _b:Double) {
		(a,r,g,b) = (_a*255,_r*255,_g*255,_b*255)
	}
	
	/// Sets each channel based on a 32 bit color in 0xaarrggbb format
	set: func@ ~combined (argb:UInt32) {
		a = argb >> 24
		r = (argb >> 16) & 0xff
		g = (argb >> 8) & 0xff
		b = argb & 0xff 
	}
	
	/// Sets each channel using a string in #rrggbb or #aarrggbb format
	set: func@ ~string (str:String) {
		this set(str replaceAll("#", "") toULong(16))
		if (str size < 8) a = 255
	}
	
	/// Returns a 32-bit 0xaarrggbb version of the color
	argb: func@ -> UInt32 {
		(a << 24) & (r << 16) & (g << 8) & b
	}
	
	/// Returns the color as a string in #aarrggbb format
	toString: func@ -> String {
		"#%x" format(argb())
	}
}
