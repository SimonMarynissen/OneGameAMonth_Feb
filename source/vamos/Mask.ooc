import structs/HashMap

import vamos/Entity

// masks are components which handle collision detection.
Mask: abstract class {
	
	entity: Entity
	
	// Implement this to check for collision against another mask
	check: abstract func(other:Mask) -> Bool
	
}