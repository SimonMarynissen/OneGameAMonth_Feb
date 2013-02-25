import structs/HashBag
import vamos/State
import Player, Enemy, Fleet

PlayState: class extends State {
	
	player: Player
	enemy: Enemy
	enemies: Fleet
	
	create: func {
		player = Player new(200, 100)
		add(player)
		
		
		// this is the kind of data that will be created by JSON:
		
		typeConf := HashBag new().
			add("speed", 100 as Double).
			add("angle", 270 as Double)
		
		fleetConf := HashBag new().
			add("x", 200 as Double).
			add("y", -30 as Double).
			add("type", "red").
			add("amount", 20).
			add("delay", 3.0 as Double).
			add("interval", 0.3 as Double).
			add("conf", typeConf)
			
		enemies = Fleet new(fleetConf)
		add(enemies)
		
		color set(0xffaaaabb)
	}
	
	update: func (dt: Double) {
		super(dt)
	}
}