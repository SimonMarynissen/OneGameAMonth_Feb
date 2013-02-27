use sdl2
import sdl2/Core
import vamos/Util
import ./[SurfaceLoader, BlendMode]

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
	
	color: Color {
		get
		set (v) {
			color = v
			SDL setTextureColorMod(data, v r, v g, v b)
			SDL setTextureAlphaMod(data, v a)
		}
	}
	color = (255,255,255,255) as Color
	
	blend: BlendMode {
		get
		set (v) {
			blend = v
			SDL setTextureBlendMode(data, v as Int)
		}
	}
	blend = BlendMode BLEND
	
	//alpha: UInt8 {
	//	get { SDL getTextureAlphaMod(data) }
	//	set (v) { SDL setTextureAlphaMod(data, v) }
	//}
	//
	//color: C
	
	destroy: func {
		SDL destroyTexture(data)
		width = 0
		height = 0
	}
	
}