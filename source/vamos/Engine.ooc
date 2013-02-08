Engine: class {

	width: Int
	height: Int
	frameRate: Int
	manager: StateManager

	init: func (=width, =height, =frameRate) {
		manager = StateManager new()
	}
	
	start: func (state: State) {
		manager set state(state)
	}
}