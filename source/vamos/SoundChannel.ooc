SoundChannel: class {

	sounds := ArrayList<Sound> new()
	playing := false
	looping := false
	volume: Double = 1.0
	pan: Double = 0.0
	
	init: func (sound: Sound) {
		sounds add(sound)
	}
	
	play: func (=volume, =pan) {
		if (playing) stop()
		playing = true
		for (sound in sounds) {
			newPan := Vamos clamp(pan + sound pan, -1, 1)
			newVolume := volume * sound volume
			sound play(newVolume, newPan)
		}
		looping = false
	}
	
	loop: func (=volume, =pan) {
		if (playing) {
			for (sound in sounds) sound stop()
		}
		play(volume, pan)
		for (sound in sounds) sound looping = true
		looping = true
	}
	
	stop: func () {
		if (!playing) return
		for (sound in sounds) sound stop()
		playing = false
	}
	
	resume: func () {
		if (playing) return
		for (sound in sounds) sound resume()
	}
	
	addSound: func (sound: Sound) {
		sounds add(sound)
		sound playing = playing
		sound looping = looping
		if (playing) {
			sound looping = true
			sound play()
		}
	}
	
	removeSound: func (sound: Sound) {
		sound stop()
		sounds remove(sound)
	}
}