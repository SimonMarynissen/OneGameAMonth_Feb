use sdl2
import sdl2/Core
import vamos/[Input, State, StateManager]
import vamos/display/StateRenderer

import vamos/display/SurfaceLoader

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
		
		surface := SurfaceLoader load("assets/vamos/vamos_logo.png")
		texture := SDL createTextureFromSurface(renderer, surface)
		SDL freeSurface(surface)
		
		targetRect := (10, 10, 160, 100) as SdlRect
		
		while (running) {
			update()
			SDL renderClear(renderer)
			SDL renderCopy(renderer, texture, null, targetRect&)
			SDL renderPresent(renderer)
		}
		
		cleanup()
	}
	
	update: func () {
		
		lastTime := SDL getTicks()
		
		Input update()
		stateManager update(1.0/frameRate)
		//stateRenderer draw()
		
		timeElapsed := SDL getTicks()
		diff := lastTime - timeElapsed
		
		SDL delay(1000/frameRate - diff)
	}
	
	cleanup: func () {
		SDL destroyRenderer(renderer)
		SDL destroyWindow(window)
		SDL quit()
	}
}