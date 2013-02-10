import vamos/Entity
import vamos/masks/Hitbox
import vamos/graphics/FilledRect

SolidBlock: class extends Entity {
	
	init: func (=x, =y, w, h: Int) {
		
		box := Hitbox new(w, h)
		mask = box
		
		graphic = FilledRect new(w, h, 255,255,255,255)
		
	}
	
}