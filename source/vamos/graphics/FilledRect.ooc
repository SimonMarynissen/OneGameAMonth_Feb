import sdl2/Core
import vamos/[Graphic, Entity]
import vamos/display/StateRenderer

FilledRect: class extends Graphic {
	
	rect: SdlRect
	r,g,b,a : UInt8
	
	width: UInt16 {
		set (v) { rect w = v }
		get { rect w }
	}
	height: UInt16 {
		set (v) { rect h = v }
		get { rect h }
	}
	
	init: func (=width, =height, =r,=g,=b,=a)
	
	draw: func (renderer:StateRenderer, entity:Entity, x, y : Double) {
		rect x = x
		rect y = y
		renderer fillRect(rect&, r,g,b,a)
	}
}