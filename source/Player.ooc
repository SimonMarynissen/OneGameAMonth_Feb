import vamos/Entity
import vamos/graphics/Image
import vamos/masks/Hitbox
import vamos/comps/Physics

import Actor, ShipGraphic
import comps/PlayerInput

Player: class extends Actor {
	
	init: func(=x, =y) {
		super()
		
		physics maxVelX = 360
		physics maxVelY = 280
		physics dragX = physics dragY = 2000
		accel = 5000
		
		addComp(PlayerInput new())
		
		hitbox set(12, 10) .center()
		type = "player"
		
		image := ShipGraphic new(9) .center()
		graphic = image
	}
	
	update: func(dt:Double) {
		super(dt)
	}
}