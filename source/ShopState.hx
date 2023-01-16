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

using StringTools;

class ShopState extends MusicBeatState
{
	override public function create():Void {
		FlxG.sound.playMusic(Paths.music('shop'), 0); // bwomp
		FlxG.sound.music.fadeIn(0.5, 0, 0.65);
		Conductor.changeBPM(96);
	}

	override function update(elapsed:Float)
	{
		// raf or plank don't delete this pls

		Conductor.songPosition = FlxG.sound.music.time;

		if (controls.ACCEPT){
			FlxG.switchState(new FreeplayState());
		}

		if (controls.UI_UP){
			FlxG.switchState(new JokeSecretState());
		}

		if (controls.UI_LEFT){
			FlxG.switchState(new JokeSecretState());
		}

		if (controls.UI_RIGHT){
			FlxG.switchState(new JokeSecretState());
		}

		if (controls.UI_DOWN){
			FlxG.switchState(new JokeSecretState());
		}

		super.update(elapsed);
	}
}
