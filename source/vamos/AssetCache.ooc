use sdl2
import sdl2/Core
import structs/HashMap
import vamos/Engine
import vamos/display/Texture

AssetCache: class {
	
	engine: Engine
	textureCache := HashMap<String, Texture> new()
	
	init: func (=engine)
	
	free: func {
		for (image in textureCache)
			image destroy()
		textureCache clear()
	}
	
	getTexture: func (path:String) -> Texture {
		
		if (engine renderer == null)
			raise("Can't obtain texture when StateRenderer is not initialised!")
			
		path = "assets/" + path
		image:Texture = textureCache[path]
		
		if (image == null) {
			image = Texture new(engine renderer, path)
			textureCache[path] = image
		}
		return image
	}
	
}