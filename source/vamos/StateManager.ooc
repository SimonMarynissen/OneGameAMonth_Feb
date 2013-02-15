import vamos/State

StateManager: class {
	
	state: State {
		get {
			return state
		}
		set (newState) {
			if (state != null) {
				state onLeave dispatch(newState)
			}
			if (!newState created) {
				newState create()
			}
			newState onEnter dispatch(state)
			state = newState
		}
	}
	
	init: func (=state)
	
	update: func (dt:Double) {
		if (state) state update(dt)
	}
}