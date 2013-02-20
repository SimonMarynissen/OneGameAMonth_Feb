import vamos/Engine
import Level
import states/[MenuState, PlayState]
import io/File
import text/json

main: func (argc:Int, arcv:CString*) {
	
	f := File new("assets/levels/lvl1.json")
	data := JSON parse(f read())
	
	engine := Engine new(400, 500, 60)
	engine caption = "One Game a Month"
	engine start(Level new(data))
}
