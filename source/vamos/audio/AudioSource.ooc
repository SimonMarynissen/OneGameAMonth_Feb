
/**
 * Base class for anything that can produce sound, that can be added to the mixer
 */
AudioSource: abstract class {
	
	// Mix sound into an audio stream.
	// Don't remove or instantiate anything in here
	//  doing so could mess up the GC/threads (sorry. D:)
	mixInto: abstract func (buffer:UInt8*, len:Int)
	
	// Do whatever you like in here!
	update: func (dt:Double)
	
	_removed := false
	
}