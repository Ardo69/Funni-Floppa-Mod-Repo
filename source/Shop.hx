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
//input handler
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

class Shop extends FlxState {
    public function new()
        {
            super();
        }
       override public function create()
        {
            FlxG.sound.playMusic(Paths.music("bwomp"));
        }
        override function update(elapsed:Float) {
            //it can't static access to UI_RIGHT_P bruh
            var downP = Controls.UI_RIGHT_P;

            if (Controls.UI_RIGHT_P)
                FlxG.switchState(new FreeplayState());
        }
}