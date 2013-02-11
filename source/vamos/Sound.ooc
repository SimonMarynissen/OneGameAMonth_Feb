Sound: class {

	playing := false
	looping := false
	volume: Double = 1.0
	pan: Double = 0.0
	position: Double = 0.0
	onComplete := Signal new()
	
	
	init: func () {
		onComplete.add(complete)
	}
	
	init: func ~withVolumeAndPan (=volume, =pan) {
		init()
	}
	
	complete: func () {
		stop()
		if (looping) {
			play(true)
		}
	}
	
	play: func () {
		play(volume, pan)
	}
	
	play: func ~withLooping (=looping) {
		play(volume, pan)
	}
	
	play: func ~withVolumeAndPan (volume, pan: Double) {
		// play the sound with the arguments
		if (playing) stop()
		position = 0.0
	}
	
	play: func ~withVolumePanAndLooping (volume, pan: Double, =looping) {
		play(volume, pan)
	}
	
	stop: func () {
		if (!playing) return
		pause()
		position = 0.0
	}
	
	pause: func () {
		if (!playing) return
		playing = false
		// stop the sound and update the position
	}
	
	resume: func () {
		if (playing) return
		playing = true
		// resume at position
	}
}