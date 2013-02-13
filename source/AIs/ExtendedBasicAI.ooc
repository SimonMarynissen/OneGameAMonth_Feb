import BasicAI

ExtendedBasicAI: class {
	
	changeOfAngle: Func(Double, Double, Double, Int)
	
	init: func (=angle, =speed, =changeOfAngle)
	
	update: func (dt: Double) {
		angle = changeOfAngle(dt, x, y, angle)
	}
}