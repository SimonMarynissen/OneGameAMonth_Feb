import structs/ArrayList
import vamos/[Signal, Entity]

// Contains and updates entites

State: class {
	
	entities := ArrayList<Entity> new()
	
	onEntityAdded := Signal<Entity> new()
	onEntityRemoved := Signal<Entity> new()
	onEnter := Signal<State> new()
	onLeave := Signal<State> new()
	
	init: func {
		
	}
	
	update: func (dt:Double) {
		for (e in entities) {
			e updateComponents(dt)
			e update(dt)
		}
	}
	
	add: func (e:Entity) {
		entities remove(e)
		entities add(e)
		onEntityAdded dispatch(e)
	}
	
	remove: func (e:Entity) {
		entities remove(e)
		onEntityRemoved dispatch(e)
	}
}
