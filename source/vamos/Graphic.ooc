Graphic: abstract class extends Component {

	x, y: Double
	width, height: Double
	visible: Bool
	scrollX, scrollY: Double

	init: super func
	
	draw: func (renderer: SdlRenderer, cam: Camera) 
}