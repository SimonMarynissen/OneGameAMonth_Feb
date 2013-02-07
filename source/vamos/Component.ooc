import engine/Entity

// Used for shared behaviour in entities

Component: class {
	
	name: String
	entity: Entity
	
	init: func (=name)
	
	added: func
	removed: func
	
	update: func (dt:Double)
	
}