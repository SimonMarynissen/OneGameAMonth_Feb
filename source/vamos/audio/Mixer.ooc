use sdl2
import sdl2/[Core, Audio]
import structs/ArrayList
import vamos/audio/AudioSource

/**
 * Contains sound sources, streams them to SDL on-demand.
 * Generally one instance exists per game, managed by the engine.
 */
Mixer: class {
	
	sources := ArrayList<AudioSource> new()
	spec: SdlAudioSpec
	
	init: func {
		spec freq = 44100
		spec format = AUDIO_S16
		spec channels = 2
		spec samples = 512
		spec callback = _mix
	}
	
	/// Make SDL use this mixer's spec. Begin playing audio.
	open: func {
		_currentSources = sources
		SdlAudio open(spec&, null)
		play()
	}
	
	close: func {
		if (_currentSources == sources)
			_currentSources = null
		SdlAudio close()
	}
	
	add: func (source:AudioSource) {
		sources add(source)
	}
	remove: func (source:AudioSource) {
		sources remove(source)
	}
	
	play: func {
		SdlAudio setPaused(false)
	}
	
	pause: func {
		SdlAudio setPaused(true)
	}
}


_currentSources: static ArrayList<AudioSource>

_mix: static func (userdata:Pointer, stream:UInt8*, len:Int) {
	memset(stream, 0, len)
	for (source in _currentSources)
		source mixInto(stream, len)
}
