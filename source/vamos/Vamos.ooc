import math

clamp: func (value, min, max: Double) -> Double {
	newValue := value
	if (value < min) newValue = min
	else if (value > max) newValue = max
	return newValue
}

deg: func (rad: Double) -> Double {
	rad * 180 / PI
}

rad: func (deg: Double) -> Double {
	deg * PI / 180
}