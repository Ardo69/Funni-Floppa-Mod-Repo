package states;

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

class ShopState extends states.MusicBeatState
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
		var backspace = controls.BACK;
		var funnystate = FlxG.keys.justPressed.LSHIFT;
        var funnystate2 = FlxG.keys.justPressed.RSHIFT;

		if (enter)
			FlxG.switchState(new states.PlayState());

		if (backspace)
			FlxG.switchState(new states.PlayState());

		if (funnystate)
			FlxG.switchState(new states.JokeSecretState());

		if (funnystate2)
			FlxG.switchState(new states.JokeSecretState());

		super.update(elapsed);
	}
}
