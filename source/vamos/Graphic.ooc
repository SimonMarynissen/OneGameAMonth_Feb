import vamos/Entity
import vamos/display/StateRenderer

Graphic: abstract class {
	
	visible := true
	x := 0.0
	y := 0.0
	scrollX := 1.0
	scrollY := 1.0
	
	draw: abstract func (renderer: StateRenderer, entity:Entity) 
}