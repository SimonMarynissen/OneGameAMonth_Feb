import structs/ArrayList
import vamos/[State, Component, Graphic, Mask]

Entity: class {
	
	x := 0.0
	y := 0.0
	type := ""
	state: State
	graphic: Graphic
	
	mask: Mask {
		set (v) {
			mask = v
			mask entity = this
		}
		get { mask }
	}
	
	components := ArrayList<Component> new()
	
	init: func {
		
	}
	
	update: func (dt:Double)
	
	updateComps: func (dt:Double) {
		"updating %d components" printfln(components size)
		for (comp in components) {
			"updating component: %s" printfln(comp name)
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
	
	addComp: func~withName (name:String, comp:Component) {
		comp name = name
		addComp(comp)
	}
	
	removeComp: func (comp:Component) {
		components remove(comp)
		comp entity = null
		comp removed()
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
		
		(this x, this y, x, y) = (x, y, this x, this y)
		
		// TODO make this more efficient (using linked lists?)
		// iterating over every entity is bad
		for (e in state entities) {
		 	if (e type == type && e != this && e mask != null \
		 	&& (mask check(e mask) || e mask check(mask)) ) {
		 		return e
		 	}
		}
		
		(this x, this y, x, y) = (x, y, this x, this y)
		
		return null
	}
	
	collide: func~noPos (type:String) -> Entity {
		return collide(type, x, y)
	}
	
	collide: func~types(types:ArrayList<String>, _x, _y:Double) -> Entity {
		if (mask == null)
			return null
		
		(this x, this y, x, y) = (x, y, this x, this y)
		
		// TODO make this more efficient (using linked lists?)
		for (e in state entities) {
			if (types contains?(e type) && e != this && e mask != null \
			&& (mask check(e mask) || e mask check(mask)) ) {
				return e
			}
		}
		
		(this x, this y, x, y) = (x, y, this x, this y)
		
		return null
	}
	
	collide: func~typesNoPos (types:ArrayList<String>) -> Entity {
		return collide(types, x, y)
	}
	
}