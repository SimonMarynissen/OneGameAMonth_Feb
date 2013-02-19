import structs/[ArrayList, LinkedList]
import vamos/[State, Component, Graphic, Mask]

Entity: class {
	
	x, y:Double
	
	type := ""
	state: State
	graphic: Graphic
	components := ArrayList<Component> new()
	
	//type: String {
	//	get { type }
	//	set (t) {
	//		if (state == null)  {
	//			type = t
	//			return
	//		}
	//		if (type != null && type != "")
	//			state types[type] removeNode(_typeNode)
	//		
	//		type = t
	//		
	//		if (type != null && type != "")
	//			state types[t] add(this)
	//		state types a
	//	}
	//}
	
	mask: Mask {
		set (v) {
			mask = v
			mask entity = this
		}
		get { mask }
	}
	
	_node: Node<Entity>
	_typeNode: Node<Entity>
	
	init: func (=x, =y)
	
	update: func (dt:Double)
	
	updateComps: func (dt:Double) {
		for (comp in components) {
			if (comp active) {
				comp update(dt)
			}
		}
	}
	
	addComp: func (comp:Component) {
		components remove(comp)
		components add(comp)
		comp entity = this
		comp added()
	}
	
	addComp: func ~withName (name:String, comp:Component) {
		comp name = name
		addComp(comp)
	}
	
	removeComp: func (comp:Component) {
		components remove(comp)
		comp entity = null
		comp removed()
	}
	
	removeComp: func ~byName (name:String) {
		removeComp(getComp(name))
	}
	
	getComp: func ~byName (name:String) -> Component {
		for (comp in components) {
			if (comp name == name)
				return comp
		}
		return null
	}
	
	getComp: func ~byClass (class:Class) -> Component {
		for (comp in components) {
			if (comp class == class)
				return comp
		}
		return null
	}
	
	
	collide: func (type:String, x, y:Double) -> Entity {
		if (mask == null)
			return null
		
		(oldX, oldY) := (this x, this y)
		(this x, this y) = (x, y)
		
		// TODO make this more efficient (using linked lists?)
		// iterating over every entity is bad
		for (e in state entities) {
		 	if (e type == type && e != this && e mask != null \
		 	&& (mask check(e mask) || e mask check(mask)) ) {
		 		(this x, this y) = (oldX, oldY)
		 		return e
		 	}
		}
		
		(this x, this y) = (oldX, oldY)
		
		return null
	}
	
	collide: func ~noPos (type:String) -> Entity {
		return collide(type, x, y)
	}
	
	collide: func ~types (types:ArrayList<String>, x, y:Double) -> Entity {
		if (mask == null)
			return null
		
		(oldX, oldY) := (this x, this y)
		(this x, this y) = (x, y)
		
		// TODO make this more efficient (using linked lists?)
		for (e in state entities) {
			if (types contains?(e type) && e != this && e mask != null \
			&& (mask check(e mask) || e mask check(mask)) ) {
				(this x, this y) = (oldX, oldY)
				return e
			}
		}
		
		(this x, this y) = (oldX, oldY)
		
		return null
	}
	
	collide: func ~typesNoPos (types:ArrayList<String>) -> Entity {
		return collide(types, x, y)
	}
	
	removeSelf: func {
		type = "dead"
		state remove(this)
	}
	
	removed: func // called when removed from world
	added: func   // called when added to world
}