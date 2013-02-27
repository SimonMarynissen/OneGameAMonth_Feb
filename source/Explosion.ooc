import math, math/Random
import vamos/[Entity, Util]
import vamos/graphics/[GraphicList, Image]
import vamos/comps/Tween

Explosion: class extends Entity {
	
	graphics := GraphicList new()
	
	init: func(x, y: Double) {
		super(x, y)
	}
	
	added: func {
		for (i in 1..40) {
			angle: Double = Random randInt(0, 360)
			speed: Double = Random randInt(80, 200)
			graphics add(ExplodeParticle new(0.5, angle, speed))
		}
		graphic = graphics
	}
}

ExplodeParticle: class extends Image {
	
	speed: Double
	duration, t: Double
	
	init: func (=duration, =angle, =speed) {
		super("particle.png")
		srcRect w = srcRect h
		srcRect x = Random randInt(0, 2) * srcRect w
		center()
	}
	
	update: func (dt:Double) {
		t = min(duration, t+dt)
		x += speed * cos(angle) * dt
		y += speed * sin(angle) * dt
		scale = Tween cosineOut(1, 0, t/duration)
	}
}