import structs/ArrayList
import engine/Component

Entity: class {
	
	x, y:Double
	components := ArrayList<Component> new()
	
	init: func {
		
	}
	
	update: func (dt:Double)
	
	updateComponents: func (dt:Double) {
		for (comp in components)
			comp update(dt)
	}
	
	addComponent: func (comp:Component) {
		components remove(comp)
		components add(comp)
		comp entity = this
		comp added()
	}
	
	removeComponent: func (comp:Component) {
		components remove(comp)
		comp entity = null
		comp removed()
	}
	
	getComponent: func ~byName (name:String) -> Component {
		for (comp in components) {
			if (comp name == name)
				return comp
		}
		return null
	}
	
	getComponent: func ~byClass (class:Class) -> Component {
		for (comp in components) {
			if (comp class == class)
				return comp
		}
		return null
	}
	
}