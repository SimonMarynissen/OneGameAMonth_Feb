use sdl2
import sdl2/Core
import vamos/[State, StateManager, Input]

Engine: class {
	
	running := false
	
	width, height: Int
	caption := "Untitled Vamos Game"
	
	frameRate:Double = 60
	
	window: SdlWindow
	renderer: SdlRenderer
	
	stateManager := StateManager new()

	init: func (=width, =height, =frameRate) {
		
	}
	
	start: func (state: State) {
		
		SDL init(SDL_INIT_EVERYTHING)
		
		window = SDL createWindow(
			caption,
			SDL_WINDOWPOS_UNDEFINED,
			SDL_WINDOWPOS_UNDEFINED,
			width, height, SDL_WINDOW_SHOWN)
		
		renderer = SDL createRenderer(window, -1, SDL_RENDERER_ACCELERATED)
		
		stateManager state = state
		
		running := true
		Input onQuit add(|| running = false)
		
		while (running) {
			update()
		}
		
		cleanup()
	}
	
	update: func () {
		Input update()
		stateManager update(1.0/frameRate)
		//stateRenderer draw()
		SDL delay(1000/frameRate)
	}
	
	cleanup: func () {
		SDL destroyRenderer(renderer)
		SDL destroyWindow(window)
		SDL quit()
	}
}