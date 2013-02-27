import vamos/Entity
import vamos/graphics/Image
import vamos/masks/Hitbox
import vamos/comps/Physics

import Actor, ShipGraphic
import comps/[PlayerInput, PlayerGun]

Player: class extends Actor {
	
	input := PlayerInput new()
	gun := PlayerGun new()
	image := ShipGraphic new(9) .center()
	
	init: func(=x, =y) {
		super()
		
		physics maxVelX = 360
		physics maxVelY = 280
		physics dragX = physics dragY = 2000
		accel = 4000
		
		addComp(input)
		addComp(gun)
		
		hitbox set(12, 10) .center()
		type = "player"
		
		graphic = image
	}
	
	update: func(dt:Double) {
		super(dt)
	}
	
	beginFiring: func { gun beginFiring() }
	endFiring: func { gun endFiring() }
}