use sdl2
import sdl2/Core

import vamos/display/SurfaceLoader

Texture: class {
	
	data: SdlTexture
	width: Double
	height: Double
	
	init: func ~fromSurface (renderer:SdlRenderer, surface:SdlSurface*) {
		data = SDL createTextureFromSurface(renderer, surface)
		width = surface@ w
		height = surface@ h
	}
	
	init: func ~fromPath (renderer:SdlRenderer, path:String) {
		surface := SurfaceLoader load(path)
		if (surface == null) {
			"!! Error loading image '%s'" printfln(path)
			// init with a placeholder 
			surface = SDL createRGBSurface(0, 8, 8, 32, 0,0,0,0)
		}
		init~fromSurface(renderer, surface)
		SDL freeSurface(surface)
	}
	
	destroy: func {
		SDL destroyTexture(data)
		width = 0
		height = 0
	}
	
}