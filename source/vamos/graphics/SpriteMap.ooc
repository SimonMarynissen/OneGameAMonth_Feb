use sdl2
import sdl2/Core
import math

import vamos/[Graphic, Entity, AssetCache]
import vamos/display/[ImageData, StateRenderer]
import vamos/graphics/Image

SpriteMap : class extends Image {
	
	frameWidth, frameHeight : Int
	currentFrame = 0:Int
	_framesWide : Int
	
	init :func (path:String, =frameWidth, =frameHeight) {
		super(path)
		srcRect w = frameWidth
		srcRect h = frameHeight
		_framesWide = data width / frameWidth
	}
	
	setCurrentFrame :func (val:Int) {
		srcRect x = (val % _framesWide) * frameWidth
		srcRect y = floor(val / _framesWide) * frameHeight
		currentFrame = val
	}
	
	draw: func (renderer:StateRenderer, entity:Entity) {
		dstRect x = entity x + x - renderer camX * scrollX
		dstRect y = entity y + y - renderer camY * scrollY
		dstRect w = frameWidth * scale
		dstRect h = frameHeight * scale
		
		renderer drawData(data, srcRect&, dstRect&)
	}
}