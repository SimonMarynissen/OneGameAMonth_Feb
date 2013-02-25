import vamos/[Entity, Input, Signal]
import vamos/graphics/[SpriteMap, SpriteFont, GraphicList]

Button: class extends Entity {
	
	onPressed := VoidSignal new()
	onReleased := VoidSignal new()
	down := false
	_spriteMap: SpriteMap
	_spriteFont: SpriteFont
	
	init: func (=x, =y, text: String) {
		_spriteMap = SpriteMap new("button.png", 32, 32)
		_spriteMap frame = 0
		_spriteFont = SpriteFont new(text)
		_spriteFont scale = 2
		glist := GraphicList new()
		glist add(_spriteMap)
		glist add(_spriteFont)
		graphic = glist
	}
	
	update: func (dt: Double) {
		if (Input mousePressed) {
			_spriteMap frame = 1
			onPressed dispatch()
		}
		if (Input mouseReleased) {
			down = !down
			if (down) {
				_spriteMap frame = 2
			} else {
				_spriteMap frame = 0
				onReleased dispatch()
			}
		}
	}
}