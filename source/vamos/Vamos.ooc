clamp: func (value, min, max: Double) -> Double {
	newValue := value
	if (value < min) newValue = min
	else if (value > max) newValue = max
	return newValue
}