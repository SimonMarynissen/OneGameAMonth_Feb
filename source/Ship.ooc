import vamos/graphics/SpriteMap

Ship : class extends SpriteMap {
	
	init: func (type:Int) {
		super("ship_designs.png", 16, 16)
		scale = 2
		setCurrentFrame(type)
	}
	
}