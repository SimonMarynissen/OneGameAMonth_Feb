import vamos/Engine
import states/[MenuState, PlayState]

main: func (argc:Int, arcv:CString*) {
	
	engine := Engine new(600, 400, 60)
	engine caption = "One Game a Month"
	// engine start(MenuState new())
	engine start(PlayState new())
}
