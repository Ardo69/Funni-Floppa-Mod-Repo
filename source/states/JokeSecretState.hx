package states;

import states.MusicBeatState;
import flixel.text.FlxText;

using StringTools;

class CustomVariables extends MusicBeatState
{
    var bigBalls:FlxText;

    override public function create()
    {
    bigBalls = new FlxText(0, 0, FlxG.width, "I have 2 big balls and cancer xD", 55, true);
    bigBalls.setFormat(Paths.font("sanspro-bold.ttf"), 32, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.RED);
    bigBalls.screenCenter();
    bigBalls.y = FlxG.height * 0.89;
    bigBalls.cameras = [camHUD];
    add(bigBalls);
    }
}