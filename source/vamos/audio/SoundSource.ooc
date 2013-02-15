
/**
 * Base class for anything that can produce sound, that can be added to the mixer
 */
SoundSource: abstract class {
	
	mixInto: abstract func (buffer:UInt8*, len:Int)
	
}