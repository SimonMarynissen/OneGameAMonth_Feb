use sdl2
import sdl2/Core

Image: class {
	
	texture: SdlTexture
	width: Double
	height: Double
	
	init: func ~fromSurface (renderer:SdlRenderer, surface:SdlSurface*) {
		texture = SDL createTextureFromSurface(renderer, surface)
	}
	
	init: func ~fromPath (renderer:SdlRenderer, path:String) {
		surface := SDLImage load(path)
		if (surface == null) {
			"!! Error loading image '%s'" printfln(path)
			// init with a placeholder 
			surface = SDL createRGBSurface(0, 8, 8, 32, 0,0,0,0)
		}
		init~fromSurface(renderer, surface)
		SDL freeSurface(surface)
	}
	
	destroy: func {
		SDL destroyTexture(texture)
		width = 0
		height = 0
	}
	
}