import io/File
import text/json
import vamos/Engine
import Assets, Level
import states/[MenuState, PlayState]

main: func (argc:Int, arcv:CString*) {
	
	f := File new("assets/levels/lvl1.json")
	data := JSON parse(f read())
	
	engine := Engine new(400, 500, 60)
	engine caption = "One Game a Month"
	Assets init(engine assets)
	engine start(Level new(data))
}
