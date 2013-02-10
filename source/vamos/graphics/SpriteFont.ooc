use sdl2
import sdl2/Core

import math
import vamos/[Graphic, Entity, AssetCache]
import vamos/display/[ImageData, StateRenderer]

SpriteFont : class extends Graphic {
	
	text = "" :String
	
	_data : ImageData
	_charWidth = 10 : Int
	_charHeight = 10 : Int
	_charsWide : Int
	
	dstRect : SdlRect
	srcRect : SdlRect
	
	init :func (=text) {
		_data = AssetCache getImageData("vamos/font_temp.png")
		_charsWide = _data width / _charWidth
	}
	
	_setCharacterRect :func (c:Char) {
		
		val := c as Int
		//val -= 65
		//if (val & 32 == 32) val -= 6
		
		srcRect x = (val % _charsWide) * _charWidth
		srcRect y = floor(val / _charsWide) * _charHeight
		srcRect w = _charWidth
		srcRect h = _charHeight
	}
	
	draw: func (renderer:StateRenderer, entity:Entity) {
		
		count := 0
		
		for (c in text)
		{
			dstRect x = entity x + x + (count * _charHeight) - renderer camX * scrollX
			dstRect y = entity y + y - renderer camY * scrollY
			dstRect w = _charWidth
			dstRect h = _charHeight
			
			_setCharacterRect(c)
			
			renderer drawData(_data, srcRect&, dstRect&)
			
			count += 1  
		}
	}
}
