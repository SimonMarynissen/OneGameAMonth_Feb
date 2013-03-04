import vamos/Entity
import vamos/graphics/SpriteFont

Text: class extends Entity {
	
	text: String {
		get { graphic as SpriteFont text }
		set (v) { graphic as SpriteFont text = v}
	}
	
	init: func (=x, =y, message:String) {
		graphic = SpriteFont new(message)
	}
	
}