package helpers;

/**
 * ...
 * @author Andy
 */
class LevelManager
{
	
	public function new() {}
	
	public static inline function getLevelData(level:Int):LevelData {
		
		var data : LevelData;
		data.mapPath = "data/level" + level + ".oep";
		
		if (level == 1) {
			data.playerx = 100;
			data.playery = 100;
			data.portalx = 500;
			data.portaly = 500;
		}
		
		return data;
	}
	
}