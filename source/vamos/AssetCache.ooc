use sdl2
import sdl2/Core
import structs/HashMap
import vamos/Engine
import vamos/display/Texture

AssetCache: class {
	
	engine: Engine
	imageCache := HashMap<String, Texture> new()
	
	init: func (=engine)
	
	free: func {
		for (image in imageCache)
			image destroy()
		imageCache clear()
	}
	
	getTexture: func (path:String) -> Texture {
		
		if (engine renderer == null)
			Exception new("Can't obtain texture when StateRenderer is not initialised!") throw()
			
		path = "assets/" + path
		image:Texture = imageCache[path]
		if (image == null) {
			image = Texture new(engine renderer, path)
			imageCache[path] = image
		}
		return image
	}
	
}