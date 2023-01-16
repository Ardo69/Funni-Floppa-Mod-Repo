package;

import flixel.util.FlxTimer;
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.system.FlxSound;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxBGSprite;

using StringTools;

class ShopState extends MusicBeatState
{

	//public var bigBalls:FlxText;
	var hand:FlxSprite;

	override public function create(){
		FlxG.sound.playMusic(Paths.music('shop'), 0); // bwomp
		FlxG.sound.music.fadeIn(0.5, 0, 0.65);
		Conductor.changeBPM(96);

		/*bigBalls = new FlxText(0, 0, FlxG.width, "I have 2 big balls and cancer xD", 55, true);
		bigBalls.setFormat(Paths.font("sanspro-bold.ttf"), 32, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.RED);
		bigBalls.y = FlxG.height * 0.89;
		add(bigBalls);*/

		hand = new FlxSprite(0, 0);
		hand.frames = Paths.getSparrowAtlas('hand');

		hand.antialiasing = ClientPrefs.globalAntialiasing;
		hand.animation.addByPrefix('pointOut', 'hand instance', 24, false);
		hand.animation.play('pointOut');
		hand.screenCenter();
		hand.updateHitbox();
		add(hand);
	}

	override function update(elapsed:Float)
	{
		// raf or plank don't delete this pls

		Conductor.songPosition = FlxG.sound.music.time;

		if (controls.ACCEPT){
			FlxG.switchState(new FreeplayState());
		}

		if (controls.NOTE_UP || controls.NOTE_LEFT || controls.NOTE_RIGHT || controls.NOTE_RIGHT){
		    hand.x += 100;
		}

		super.update(elapsed);
	}
}
