use sdl2
import sdl2/[Core, Audio]
import structs/ArrayList
import vamos/audio/SoundSource

/**
 * Contains sound sources, streams them to SDL on-demand.
 * Generally only one instance should exist per-game.
 */
Mixer: class {
	
	sources := ArrayList<SoundSource> new()
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
	
	add: func (source:SoundSource) {
		sources add(source)
	}
	remove: func (source:SoundSource) {
		sources remove(source)
	}
	
	play: func {
		SdlAudio setPaused(false)
	}
	
	pause: func {
		SdlAudio setPaused(true)
	}
}


_currentSources: static ArrayList<SoundSource>

_mix: static func (userdata:Pointer, stream:UInt8*, len:Int) {
	memset(stream, 0, len)
	for (source in _currentSources)
		source mixInto(stream, len)
}
