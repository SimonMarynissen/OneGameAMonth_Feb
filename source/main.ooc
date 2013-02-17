import vamos/Engine
import states/[MenuState, PlayState]

main: func (argc:Int, arcv:CString*) {
	
	engine := Engine new(400, 500, 60)
	engine caption = "One Game a Month"
	engine start(PlayState new())
}
