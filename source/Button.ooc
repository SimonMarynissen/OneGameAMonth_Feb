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
		_spriteMap setCurrentFrame(0)
		_spriteFont = SpriteFont new(text)
		_spriteFont scale = 2
		_spriteFont origin x = 4
		_spriteFont origin y = 4
		glist := GraphicList new()
		glist add(_spriteMap)
		glist add(_spriteFont)
		graphic = glist
	}
	
	update: func (dt: Double) {
		/*if (Input mousePressed) {
			_spriteMap setCurrentFrame(1)
			onPressed dispatch()
		}
		if (Input mouseReleased) {
			down = !down
			if (down) {
				_spriteMap setCurrentFrame(2)
			} else {
				_spriteMap setCurrentFrame(0)
				onReleased dispatch()
			}
		}*/
	}
}