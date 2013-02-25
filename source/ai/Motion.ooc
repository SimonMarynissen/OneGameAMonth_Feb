import math
import structs/HashBag, BagUtil
import vamos/[Component, Util, Entity]
import vamos/comps/Physics
import Actor

Motion: class extends Component {
	
	actor: Actor
	physics: Physics
	speed, angle, accel, turn: Double
	
	init: func
	init: func ~config(data:HashBag) {
		configure(data)
	}
	
	added: func {
		actor = entity as Actor
		physics = actor physics
	}
	
	update: func (dt:Double) {
		angle += turn * dt
		speed += accel * dt
		r := angle toRadians()
		physics nudgeX += dt * speed * r cos()
		physics nudgeY -= dt * speed * r sin()
		actor angle = angle
	}
	
	configure: func (data:HashBag) {
		if (data contains?("speed")) speed = data getDouble("speed")
		if (data contains?("angle")) angle = data getDouble("angle")
		if (data contains?("turn")) turn = data getDouble("turn")
		if (data contains?("accel")) accel = data getDouble("accel")
	}
}
