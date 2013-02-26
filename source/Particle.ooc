import vamos/graphics/Image
import math

Particle: class extends Image {
	
	speed: Double
	angle: Double
	
	init: func (=x, =y, =angle, =speed) {
		super("particle.png")
	}
	
	update: func (dt: Double) {
		x += speed * cos(angle) * dt
		y += speed * sin(angle) * dt
	}
}