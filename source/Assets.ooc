import vamos/[Engine, AssetCache]
import vamos/display/[Bitmap, Texture, Color]

Assets: class {
	
	init: static func (assets:AssetCache) {
		
		popcorn := assets getBitmap("enemy_popcorn.png")
		popcornMask := popcorn clone()
		
		popcornMask filter(|x,y,color|
			color a ? (255,255,255,255) as Color : (0,0,0,0) as Color
		)
		
		assets register("popcorn_mask", Texture new(popcornMask))
		
	}
	
}
