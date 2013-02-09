import vamos/State

MenuState: class extends State {
	
	init: func {
		
	}
	
	update: func (dt:Double) {
		super()
		"updating! %f" printfln(dt)
	}
	
}