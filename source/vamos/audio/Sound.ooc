import vamos/Vamos
import vamos/Signal
import vamos/audio/AudioSource
import vamos/SoundLoader

/**
 * A sample that can be loaded from a .wav or .ogg file
 * If your file is large, consider using a streaming 'Music' object instead.
 */
Sound: class extends AudioSource {
	
	data: UInt8*
	size: UInt32
	position: UInt32
	
	playing := false
	looping := false
	volume: Double = 1.0
	pan: Double = 0.0
	onComplete := VoidSignal new()
	
	init: func (path:String) {
		SoundLoader load("path")
	}
	
	complete: func {
		stop()
		if (looping) {
			play(true)
		}
	}
	
	play: func {
		play(volume, pan)
	}
	
	play: func ~withVolumeAndPan (volume, pan: Double) {
		// play the sound with the arguments
		if (playing) stop()
		position = 0.0
	}
	
	stop: func {
		if (!playing) return
		pause()
		position = 0.0
	}
	
	pause: func {
		if (!playing) return
		playing = false
	}
	
	resume: func {
		if (playing) return
		playing = true
	}
}