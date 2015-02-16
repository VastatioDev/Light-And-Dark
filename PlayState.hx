package ;

import entities.Player;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
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
	
	override public function create():Void
	{
		_player = new Player(0, 0);
		_data = LevelManager.getLevelData(_level);
		_player.setPosition(_data.playerx, _data.playery);
		_tm = new FlxTilemap();
		_tm.loadMap(_data.mapPath, "assets/images/tilemap.png", 16, 16);
		add(_player);
		FlxG.collide(_player, _tm);
		super.create();
	}
	
	override public function update():Void 
	{
		
		super.update();
	}
	
	override public function destroy():Void
	{
		
		super.destroy();
	}
	
}