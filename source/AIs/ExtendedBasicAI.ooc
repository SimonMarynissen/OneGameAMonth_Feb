import BasicAI

ExtendedBasicAI: class {
	
	newAngle: Func(Enemy)
	enemy: Enemy
	
	init: func (=angle, =speed, =changeOfAngle)
	
	added: func {
		enemy = entity as Enemy
	}
	
	update: func (dt: Double) {
		angle = newAngle(enemy)
	}
}