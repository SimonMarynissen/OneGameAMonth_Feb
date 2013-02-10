import vamos/[Entity, Mask]

Hitbox: class extends Mask {
	
	x, y, width, height : Double
	
	init: func(=x, =y, =width, =height)
	
	init: func~sizeOnly (=width, =height)
	
	check: func (other:Mask) -> Bool {
		return match (other class) {
			case Hitbox => checkHitbox(other as Hitbox)
			case => false
		}
	}
	
	checkHitbox: func(other:Hitbox) -> Bool {
		left := entity x + x
		top := entity y + y
		otherLeft := other entity x + other x
		otherTop := other entity y + other y
		
		return (left + width) > (otherLeft)       \
		    && (top + height) > (otherTop)        \
		    && (left) < (otherLeft + other width) \
		    && (top) < (otherTop + other height)
	}
	
}
