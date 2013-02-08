import engine/Entity

// Used for shared behaviour in entities

Component: abstract class {
	
	name: String
	entity: Entity
	active: Bool
	
	init: func (=name)
	
	reset: func
	added: func
	removed: func
	
	update: func (dt:Double)
	
}