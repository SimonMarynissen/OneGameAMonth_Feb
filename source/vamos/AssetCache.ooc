use sdl2
import sdl2/Core
import structs/HashMap
import vamos/display/ImageData

AssetCache: class {
	
	renderer: static SdlRenderer
	imageCache := static HashMap<String, ImageData> new()
	
	init: static func (r:SdlRenderer) {
		renderer = r
	}
	
	free: static func {
		for (image in imageCache)
			image destroy()
		imageCache clear()
	}
	
	getImageData: static func (path:String) -> ImageData {
		path = "assets/" + path
		image:ImageData = imageCache[path]
		if (image == null) {
			image = ImageData new(renderer, path)
			imageCache[path] = image
		}
		return image
	}
	
}