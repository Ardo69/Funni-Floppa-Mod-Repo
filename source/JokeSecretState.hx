package;

import flixel.system.FlxBGSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import MusicBeatState;
import flixel.text.FlxText;

using StringTools;

class JokeSecretState extends MusicBeatState
{
    // raf or plank don't delete this pls
    public var bigBalls:FlxText;

    override public function create()
    {
    bigBalls = new FlxText(0, 0, FlxG.width, "I have 2 big balls and cancer xD", 55, true);
    bigBalls.setFormat(Paths.font("sanspro-bold.ttf"), 32, FlxColor.WHITE, CENTER, OUTLINE, FlxColor.RED);
    bigBalls.y = FlxG.height * 0.89;
    add(bigBalls);
    }

    override function update(elapsed:Float)
    {
        if (controls.BACK) {
            FlxG.switchState(new ShopState());
        }
    }
}