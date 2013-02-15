use sdl2
import sdl2/Core
import vamos/[Input, AssetCache, State, StateManager]
import vamos/display/StateRenderer
import vamos/audio/Mixer

Engine: class {
	
	running := false
	width, height: Int
	caption := "Untitled Vamos Game"
	frameRate := 60.0
	
	window: SdlWindow
	renderer: SdlRenderer
	mixer: Mixer
	stateManager: StateManager
	stateRenderer: StateRenderer
	state: State {
		get { stateManager state }
		set (s) {
			if (s) s engine = this
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
		
		AssetCache init(renderer)
		Input init()
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
	
	_dt := 0.0 // Seconds elapsed since last frame
	
	update: func {
		startTime := time()
		
		Input update()
		stateManager update(_dt)
		stateRenderer draw()
		
		sleep(1.0/frameRate - _dt)
		_dt = time() - startTime
	}
	
	/// number of seconds since the program began
	time: func -> Double {
		SDL getTicks() as Double / 1000.0
	}
	
	sleep: func (seconds:Double) {
		if (seconds < 0.0) seconds = 0.0
		SDL delay(seconds*1000)
	}
	
	setIcon: func (icon:SdlSurface*) {
		SDL setWindowIcon(window, icon)
	}
	
	cleanup: func {
		AssetCache free()
		mixer close()
		SDL destroyRenderer(renderer)
		SDL destroyWindow(window)
		SDL quit()
	}
}