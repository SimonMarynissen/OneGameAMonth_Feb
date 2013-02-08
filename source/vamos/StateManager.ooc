import engine/State

StateManager: class {
	
	state: State {
		get {
			return state
		}
		set (newState) {
			if (state != null) {
				state onLeave dispatch(newState)
			}
			if (newState != null) {
				newState onEnter dispatch(state)
			}
			state = newState
		}
	}
	
	init: func (=state) {}
	init: func ~withoutState
	
	update: func (dt:Double) {
		state update(dt)
	}
}