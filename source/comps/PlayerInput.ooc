use sdl2
import sdl2/Event

import vamos/[Component, Input, Entity]
import Actor

PlayerInput: class extends Component {
	
	actor: Actor
	
	init: func {
		
	}
	
	added: func {
		actor = entity as Actor
	}
	
	update: func (dt:Double) {
		if (Input keyPressed(SDLK_LEFT)) actor moveLeft()
		if (Input keyPressed(SDLK_RIGHT)) actor moveRight()
		if (Input keyPressed(SDLK_UP)) actor moveUp()
		if (Input keyPressed(SDLK_DOWN)) actor moveDown()
			
		if (Input keyReleased(SDLK_RIGHT)) {
			if (Input keyHeld(SDLK_LEFT)) actor moveLeft()
			else actor stopX()
		}
		if (Input keyReleased(SDLK_LEFT)) {
			if (Input keyHeld(SDLK_RIGHT)) actor moveRight()
			else actor stopX()
		}
			
		if (Input keyReleased(SDLK_UP)) {
			if (Input keyHeld(SDLK_DOWN)) actor moveDown()
			else actor stopY()
		}
		if (Input keyReleased(SDLK_DOWN)) {
			if (Input keyHeld(SDLK_UP)) actor moveUp()
			else actor stopY()
		}
	}
	
}