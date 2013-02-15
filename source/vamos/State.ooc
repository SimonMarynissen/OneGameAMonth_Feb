import structs/ArrayList
import vamos/[Engine, Signal, Entity]

// TODO: replace the current ArrayList system with linked lists

/**
 * Contains and updates entites
 */
State: class {
	
	created := false
	engine: Engine
	entities := ArrayList<Entity> new()
	onEntityAdded := Signal<Entity> new()
	onEntityRemoved := Signal<Entity> new()
	onEnter := Signal<State> new()
	onLeave := Signal<State> new()
	
	// Don't create entities or load assets here.
	init: func {
		
	}
	
	/// Called when a renderer is available, and entities/graphics can be initialised
	create: func {
		
	}
	
	update: func (dt:Double) {
		for (e in entities) {
			e updateComps(dt)
			e update(dt)
		}
	}
	
	add: func (e:Entity) {
		entities remove(e)
		entities add(e)
		e state = this
		e added()
		onEntityAdded dispatch(e)
	}
	
	remove: func (e:Entity) {
		onEntityRemoved dispatch(e)
		entities remove(e)
		e state = null
		e removed()
	}
}
