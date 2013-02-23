import structs/ArrayList
import vamos/[Engine, Signal, Entity, Util]

// TODO: replace the current ArrayList system with linked lists

/**
 * Contains and updates entites
 */
State: class {
	
	created := false
	entities := ArrayList<Entity> new()
	onEntityAdded := Signal<Entity> new()
	onEntityRemoved := Signal<Entity> new()
	onEnter := Signal<State> new()
	onLeave := Signal<State> new()
	color:Color
	
	// Don't create entities or load assets here.
	init: func {
		
	}
	
	/// Called when a renderer is available, and entities/graphics can be initialised
	create: func {
		
	}
	
	update: func (dt:Double) {
		iter := entities iterator()
		
		while (iter hasNext?()) {
			e := iter next()
			if (e state != this) iter remove()
			else {
				e updateComps(dt)
				e update(dt)
			}
		}
	}
	
	add: func (e:Entity) {
		entities add(e)
		e state = this
		e added()
		onEntityAdded dispatch(e)
	}
	
	remove: func (e:Entity) {
		onEntityRemoved dispatch(e)
		e removed()
		e state = null
	}
	
	getFirst: func ~ofType(type:String) -> Entity {
		for (e in entities)
			if (e type == type)
				return e
		null
	}
	
	getFirst: func ~ofClass <T> (T:Class) -> T {
		for (e in entities)
			if (e instanceOf?(T))
				return e as T
		null
	}
}
