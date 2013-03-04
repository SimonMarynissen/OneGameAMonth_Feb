import math, math/Random
import vamos/[Entity, Util]
import vamos/graphics/[GraphicList, Image]
import vamos/comps/[Tween, Timer]

Explosion: class extends Entity {
	
	graphics := GraphicList new()
	
	init: func(x, y: Double) {
		super(x, y)
	}
	
	added: func {
		for (i in 1..20) {
			angle: Double = Random randInt(0, 360)
			speed: Double = Random randInt(80, 200)
			graphics add(ExplodeParticle new(0.5, angle, speed))
		}
		graphic = graphics
		addComp(Timer new~start(1, || state remove(this)))
	}
}

ExplodeParticle: class extends Image {
	
	velX, velY: Double
	duration, t: Double
	
	init: func (=duration, =angle, speed:Double) {
		super("particle.png")
		srcRect w = srcRect h
		srcRect x = Random randInt(0, 2) * srcRect w
		center()
		velX = speed * cos(angle)
		velY = speed * sin(angle)
	}
	
	update: func (dt:Double) {
		t = min(duration, t+dt)
		x += velX * dt
		y += velY * dt
		scale = Tween cosineOut(1.2, 0, t/duration)
	}
}