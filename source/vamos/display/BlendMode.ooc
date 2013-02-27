use sdl2

// These are the only ones supported by SDL currently.

BlendMode: enum {
	NONE  : extern (SDL_BLENDMODE_NONE)
	BLEND : extern (SDL_BLENDMODE_BLEND)
	ADD   : extern (SDL_BLENDMODE_ADD)
	MOD   : extern (SDL_BLENDMODE_MOD)
}