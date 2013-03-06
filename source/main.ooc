use vamos
import io/File
import text/json
import vamos/Engine
import Assets, Level
import states/SplashState

main: func (argc:Int, arcv:CString*) {
	
	f := File new("assets/levels/lvl1.json")
	data := JSON parse(f read())
	
	level := Level new(data)
	
	splash := SplashState new()
	splash onPlay add(|shipType|
		level shipType = shipType
		engine state = level
	)
	
	engine := Engine new(400, 500, 60)
	engine caption = "One Game a Month"
	Assets init(engine assets)
	engine start(splash)
	//engine start(level)
}
