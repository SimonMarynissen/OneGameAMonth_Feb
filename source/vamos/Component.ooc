import vamos/Entity

// Used for shared behaviour in entities

Component: abstract class {
	
	name: String
	entity: Entity
	
	active := true
	
	init: func (=name)
	
	reset: func
	added: func
	removed: func
	
	update: func (dt:Double)
	
}