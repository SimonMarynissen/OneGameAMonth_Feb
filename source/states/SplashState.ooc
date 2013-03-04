import sdl2/Event
import vamos/[Engine, State, Entity, Input, Util, Signal]
import vamos/comps/[Tween, Timer]
import vamos/display/Color
import ShipGraphic
import Text

SplashState: class extends State {
	
	time: Entity
	message: Text
	randShip: RandomShip
	canSkip := false
	onPlay := Signal<Int> new() // dispatch the frame of the ship
	
	create: func {
		time = Entity new()
		message = Text new(174, 230, "")
		randShip = RandomShip new(192, 380)
		
		time addComp(Tween new~start(2, |n|
			c := Tween cosineOut(0.2, 1, min(n, 1))
			color set(1,c,c,c)
		))
		
		time addComp(Timer new~start(2.5, ||
			message text = "vamos"
		))
		
		time addComp(Timer new~start(4, ||
			add(randShip)
		))
		
		time addComp(Timer new~start(8, ||
			message text = " [Z]"
			canSkip = true
		))
		
		add(time)
		add(message)
	}
	
	update: func (dt:Double) {
		super(dt)
		if (canSkip && Input keyPressed(SDLK_z)) {
			onPlay dispatch(randShip sheet frame)
		}
	}
	
}

import math/Random

RandomShip: class extends Entity {
	
	sheet := ShipGraphic new(0)
	
	init: func(.x, .y) {
		super(x, y)
		sheet center()
		graphic = sheet
		endFrame := 100 + Random randRange(0, ShipGraphic NUM_TYPES)
		
		addComp(Tween new~start(4, |n|
			// cycle:
			sheet frame = Tween cosineOut(0, endFrame, n) as Int % ShipGraphic NUM_TYPES
		) then (||
			addComp(Tween new~start(1, |n|
				// flicker:
				sheet alpha = ((n*15) as Int % 2) * 255
			))
		))
	}
	
}