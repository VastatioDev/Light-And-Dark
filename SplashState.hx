package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
/**
 * ...
 * @author Andy
 */
class SplashState extends FlxState
{
	
	private var _logoText : FlxText;
	private var _logoSpr : FlxSprite;
	private var _tween : FlxTween;
	
	override public function create():Void
	{
		_logoText = new FlxText(0, 0, 0);
		_logoText.text = "Litwick Games";
		add(_logoText);
		
		_logoSpr = new FlxSprite(0, 0, "");
		add(_logoSpr);
		
		_tween = new FlxTween();
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