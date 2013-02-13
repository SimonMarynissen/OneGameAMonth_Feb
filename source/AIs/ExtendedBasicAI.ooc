import BasicAI

ExtendedBasicAI: class {
	
	newAngle: Func(Enemy)
	enemy: Enemy
	
	init: func (=angle, =speed, =newAngle)
	
	added: func {
		enemy = entity as Enemy
	}
	
	update: func (dt: Double) {
		enemy angle = newAngle(enemy)
	}
}