package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;

/**
 * ...
 * @author Andy
 */
class Player extends FlxSprite
{
	
	public static inline var RUN_SPEED:Int = 90;
	public static inline var GRAVITY:Int = 620;
	public static inline var JUMP_SPEED:Int = 250;
	public static inline var MAX_JUMPS:Int = 2;
	
	public var _jumpCount:Int = 0;
	public var _jumpTime:Int = -1;
	public var _jumpKeys:Array<String>;
	public var _leftKeys:Array<String>;
	public var _rightKeys:Array<String>;
	
	public var pw, ph : Int;
	
	public function new(x:Int,y:Int) 
	{
		super(x, y);
		loadGraphic("assets/images/player.png", true, pw, ph);
		
		//TODO add animations
		
		//movement and gravity and drag
		drag.set(RUN_SPEED * 8, RUN_SPEED * 8);
		maxVelocity.set(RUN_SPEED, RUN_SPEED);
		acceleration.y = GRAVITY;
		setSize(pw - 3, ph - 2);
		//offset.set(pw / 4, ph / 3);
		
		_leftKeys = ["A", "LEFT"];
		_rightKeys = ["D", "RIGHT"];
		_jumpKeys = ["Z", "SPACE", "UP"];
	}
	
	override public function update():Void {
		acceleration.x = 0;
		
		acceleration.y = GRAVITY;
		
		if (FlxG.keys.anyPressed(_leftKeys)) {
			flipX = true;
			acceleration.x = -drag.x;
		}
		else if (FlxG.keys.anyPressed(_rightKeys)) {
			flipX = false;
			acceleration.x = drag.x;
		}
		
		
		if (FlxG.keys.anyJustPressed(_jumpKeys)) 
		{
			
			if ((velocity.y == 0) || (_jumpCount < MAX_JUMPS))
			{
				FlxG.sound.play("assets/sounds/jump.wav", 1, false);
				_jumpCount++;
				_jumpTime = 0;
			}
			
		}
		
		if((FlxG.keys.anyPressed(_jumpKeys)) && (_jumpTime >= 0)) {
			if (_jumpTime > .25)
			{
				_jumpTime = -1;
			}
			else if (_jumpTime > 0) 
			{
				velocity.y = - .6 * maxVelocity.y;
			}
		}
		
		
		
		//animations
		if (velocity.x > 0 || velocity.x < 0) {
			animation.play("walking");
		}
		else if (velocity.x == 0) {
			animation.play("idle");
		}
		if (velocity.y < 0) {
			animation.play("jump");
		}
		else {
			animation.play("falling");
		}
		
		if (isTouching(FlxObject.FLOOR) && !FlxG.keys.anyPressed(_jumpKeys))
		{
			_jumpTime = -1;
			_timesJumped = 0;
			
		}
		
		super.update();
	}
	
}