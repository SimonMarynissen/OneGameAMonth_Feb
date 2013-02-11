import math
import structs/ArrayList
import vamos/[Component, Entity]

Physics: class extends Component {
	
	collideTypes:ArrayList<String>
	
	velX := 0.0
	velY := 0.0
	accX := 0.0
	accY := 0.0
	maxVelX := 99999.0
	maxVelY := 99999.0
	dragX := 0.0
	dragY := 0.0
	nudgeX := 0.0
	nudgeY := 0.0
	bounce := 0.0
	sweep := false
	
	init: func (=collideTypes) {
		name = "physics"
	}
	init: func~rawArray(types:String[]) {
		init(types as ArrayList<String>)
	}

	update: func (dt:Double) {
		if (accX == 0) {
			if (velX < 0) velX = min(velX + dragX*dt, 0)
			else if (velX > 0) velX = max(velX - dragX*dt, 0)
		} else {
			velX = velX + accX*dt
		}
		
		if (velX < -maxVelX) velX = -maxVelX
		else if (velX > maxVelX) velX = maxVelX
		
		if (accY == 0) {
			if (velY < 0) velY = min(velY + dragY*dt, 0)
			else if (velY > 0) velY = max(velY - dragY*dt, 0)
		} else {
			velY = velY + accY*dt
		}
		
		if (velY < -maxVelY) velY = -maxVelY
		else if (velY > maxVelY) velY = maxVelY
		
		moveBy(velX*dt, velY*dt)
	}
	
	_fractionX := 0.0  // account for < 1px movement over many frames
	_fractionY := 0.0
	
	// Thanks Chevy!
	moveBy: func(x, y:Double) {
		_fractionX += x
		_fractionY += y
		x = x round()
		y = y round()
		_fractionX -= x
		_fractionY -= y
		"amount x: %f,  y: %f" printfln(x, y)
		
		if (x != 0) {
			if (sweep || entity collide(collideTypes, entity x + x, entity y)) {
				sign := x > 0 ? 1 : -1
				while (x != 0) {
					if (entity collide(collideTypes, entity x + sign, entity y)) {
						collideX()
						break
					}
					entity x += sign
					x -= sign
				}
			} else {
				entity x += x
			}
		}
		
		if (y != 0) {
			if (sweep || entity collide(collideTypes, entity x, entity y + y)) {
				sign := y > 0 ? 1 : -1
				while (y != 0) {
					if (entity collide(collideTypes, entity x, entity y + sign)) {
						collideY()
						break
					}
					entity y += sign
					y -= sign
				}
			} else {
				entity y += y
			}
		}
	}

	collideX: func {
		velX = -sign(velX) * bounce
	}

	collideY: func {
		velY = -sign(velY) * bounce
	}
	
}

max: inline static func (a,b:Double) -> Double {
	(a > b) ? a : b
}
min: inline static func (a,b:Double) -> Double {
	(a < b) ? a : b
}
sign: inline static func(n:Double) -> Double {
	(n > 0) ? 1 : ((n < 0) ? -1 : 0)
}