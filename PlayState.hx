package ;

import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import entities.Player;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import haxe.Timer;
import helpers.LevelData;
import helpers.LevelManager;

/**
 * ...
 * @author Andy
 */
class PlayState extends FlxState
{

	public var _player : Player;
	public var _data : LevelData;
	public var _level : Int = 1;
	public var _tm : FlxTilemap;
	public var _portal : FlxSprite;
	
	override public function create():Void
	{
		_player = new Player(0, 0);
		_data = LevelManager.getLevelData(_level);
		_player.setPosition(_data.playerx, _data.playery);
		_tm = new FlxTilemap();
		_tm.loadMap(_data.mapPath, "assets/images/tilemap.png", 16, 16);
		add(_player);
		FlxG.collide(_player, _tm/*, function() { trace("collision happening"); } */);
		
		//cutscene stuff
		_portal = new FlxSprite(0, 0);
		_portal.loadGraphic("assets/images/portal.png", true, 50, 50);
		_portal.animation.add("open", [0, 1, 2, 3, 4], 5, false);
		_portal.animation.add("swirl", [0, 1, 2, 3], 5, false);
		_portal.animation.add("close", [0, 1, 2, 3, 4], 5, false);
		add(_portal);
		
		_player.setPosition(_portal.x, _portal.y);
		
		
		
		
		Timer.delay(function() {
			_portal.animation.play("open");
		}, 2000);
		
		if (_portal.animation.getByName("open").finished) {
			_player.velocity.x = 100;
			_portal.animation.play("swirl");
			Timer.delay(function() {
				_portal.animation.play("close");
			}, 3000);
			if (_portal.animation.getByName("close").finished) {
				//Kill the portal once finished with it.
				_portal.kill();
			}
		}
		
		
		
		super.create();
	}
	
	override public function update():Void 
	{
		_player.update();
		_tm.update();
		super.update();
	}
	
	override public function destroy():Void
	{
		_player.destroy();
		_tm.destroy();
		super.destroy();
	}
	
}