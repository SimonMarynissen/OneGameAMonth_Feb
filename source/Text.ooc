import vamos/Entity
import vamos/graphics/SpriteFont

Text: class extends Entity {
	
	init: func (=x, =y) {
		graphic = SpriteFont new("Hello!")
	}
	
}