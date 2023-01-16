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
		Conductor.songPosition = FlxG.sound.music.time;
		var enter = controls.ACCEPT;

		if (enter)
			FlxG.switchState(new FreeplayState());

		super.update(elapsed);
	}
}
