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
import WeekData;
import Paths;
// input handler
import flixel.input.FlxInput;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;
import flixel.input.actions.FlxActionInputDigital;
import flixel.input.actions.FlxActionManager;
import flixel.input.actions.FlxActionSet;
import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.keyboard.FlxKey;
import Controls;

using StringTools;

class ShopState extends MusicBeatState
{
	override public function create():Void
		{
			new FlxTimer().start(1, function(tmr:FlxTimer)
				{
					openState();
				});
		}

	function openState()
	{
		if (FlxG.sound.music == null) // don't restart the music if it's already playing
		{
		FlxG.sound.playMusic(Paths.music('shop'), 0.65); // bwomp
		}
	}

	override function update(elapsed:Float)
	{
		var enter = controls.ACCEPT;

		if (enter)
			FlxG.switchState(new FreeplayState());
	}
}
