package;

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

	override public function create()
	{
		FlxG.sound.playMusic(Paths.music("bwomp")); // bwomp


	}

	override function update(elapsed:Float)
	{
		var back = controls.BACK;

		if (back)
			FlxG.switchState(new FreeplayState());
	}
}
