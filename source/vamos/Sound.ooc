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
	
	complete: func () {
		stop()
		if (looping) {
			play(volume, pan)
		}
	}
	
	play: func () {
		play(volume, pan)
		// play the sound with volume and pan attributes
	}
	
	play: func ~withVolumeAndPan (volume, pan: Double) {
		// play the sound with the arguments
		if (playing) stop()
		position = 0.0
		
	}
	
	stop: func () {
		playing = false
		// stop the sound and update the position
	}
}