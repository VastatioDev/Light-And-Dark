package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
/**
 * ...
 * @author Andy
 */
class MenuState extends FlxState
{

	private var _titleTxt : FlxText;
	
	#if mobile
	private var _startTap : FlxText;
	#end
	
	#if desktop
	private var _startPress : FlxText;
	#end
	
	override public function create():Void
	{
		_titleTxt = new FlxText(0, 0, 0);
		_titleTxt.setFormat("", 32);
		_titleTxt.text = "";
		add(_titleTxt);
		
		#if mobile
		_startTap = new FlxText(0, 0, 0);
		_startTap.setFormat("", 24);
		_startTap.text = "";
		add(_startTap);
		#end
		
		#if desktop
		_startTap = new FlxText(0, 0, 0);
		_startTap.setFormat("", 24);
		_startTap.text = "";
		add(_startTap);
		#end
		
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