use sdl2
import sdl2/Core
import vamos/[Input, AssetCache, State, StateManager]
import vamos/display/StateRenderer
import vamos/audio/Mixer

engine:Engine

/**
 * Manages the various subsystems, runs the main loop
 */
Engine: class {
	
	running := false
	width, height: Int
	caption := "Untitled Vamos Game"
	frameRate:Double = 60
	dt:Double // Seconds elapsed since last frame
	
	window: SdlWindow
	renderer: SdlRenderer
	assets: AssetCache
	mixer: Mixer
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
		
		engine = this
		
		assets = AssetCache new(this)
		mixer = Mixer new() .open()
		stateManager = StateManager new(startState)
		stateRenderer = StateRenderer new(renderer, startState)
		
		running = true
		Input onQuit add(|| running = false)
		
		while (running) {
			update()
		}
		
		cleanup()
	}
	
	update: func {
		startTime := time()
		
		Input update()
		stateManager update(dt)
		stateRenderer draw()
		mixer update(dt)
		
		sleep(1.0/frameRate - dt)
		dt = time() - startTime
	}
	
	/// number of seconds since the program began
	time: func -> Double {
		SDL getTicks() as Double / 1000.0
	}
	
	sleep: func (seconds:Double) {
		if (seconds < 0) seconds = 0
		SDL delay(seconds*1000)
	}
	
	setIcon: func (icon:SdlSurface*) {
		SDL setWindowIcon(window, icon)
	}
	
	cleanup: func {
		mixer close()
		assets free()
		engine = null
		SDL destroyRenderer(renderer)
		SDL destroyWindow(window)
		SDL quit()
	}
}
