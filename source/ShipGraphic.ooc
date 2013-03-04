import vamos/graphics/SpriteMap

ShipGraphic: class extends SpriteMap {
	
	NUM_TYPES := static 9
	
	init: func (type:Int) {
		super("ship_designs.png", 16, 16)
		frame = type
	}
	
}