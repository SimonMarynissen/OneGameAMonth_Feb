import vamos/Entity
import vamos/graphics/GraphicList
import Particle
import math
import math/Random

Explosion: class extends Entity {
	
	graphics := GraphicList new()
	
	init: func(x, y: Double) {
		super(x, y)
	}
	
	added: func {
		for (i in 1..40) {
			angle: Double = Random randInt(0, 360)
			speed: Double = Random randInt(50, 200)
			graphics add(Particle new(x, y, angle, speed))
		}
		graphic = graphics
	}
}