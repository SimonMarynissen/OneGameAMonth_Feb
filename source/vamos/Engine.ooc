use sdl2
import sdl2/Core
import vamos/[Input, State, StateManager]
import vamos/display/StateRenderer

Engine: class {
	
	running := false
	
	width, height: Int
	caption := "Untitled Vamos Game"
	
	frameRate := 60.0
	
	window: SdlWindow
	renderer: SdlRenderer
	
	stateManager: StateManager
	stateRenderer: StateRenderer
	
	state: State {
		get { stateManager state }
		set (s) {
			stateManager state = s
			stateRenderer state = s
		}
	}
	
	init: func (=width, =height, =frameRate)
	
	
	start: func (startState:State) {
		
		SDL init(SDL_INIT_EVERYTHING)
		
		window = SDL createWindow(
			caption,
			SDL_WINDOWPOS_UNDEFINED,
			SDL_WINDOWPOS_UNDEFINED,
			width, height, SDL_WINDOW_SHOWN)
		
		renderer = SDL createRenderer(window, -1, SDL_RENDERER_ACCELERATED)
		
		stateManager = StateManager new(startState)
		stateRenderer = StateRenderer new(renderer, startState)
		
		running = true
		Input onQuit add(|| running = false)
		
		while (running) {
			update()
		}
		
		cleanup()
	}
	
	update: func () {
		Input update()
		stateManager update(1.0/frameRate)
		stateRenderer draw()
		SDL delay(1000/frameRate)
	}
	
	cleanup: func () {
		SDL destroyRenderer(renderer)
		SDL destroyWindow(window)
		SDL quit()
	}
}