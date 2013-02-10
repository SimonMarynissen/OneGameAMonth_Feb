import structs/ArrayList
import vamos/[Component, Graphic]

Entity: class {
	
	x := 0.0
	y := 0.0
	
	graphic: Graphic
	//mask: Mask
	
	components := ArrayList<Component> new()
	
	init: func {
		
	}
	
	update: func (dt:Double)
	
	updateComps: func (dt:Double) {
		for (comp in components) {
			if (comp active)
				comp update(dt)
		}
	}
	
	addComp: func (comp:Component) {
		components remove(comp)
		components add(comp)
		comp entity = this
		comp added()
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
	
}