package;

import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;

using StringTools;

class PolishCow extends MusicBeatState
{
    var texty:FlxText;
    var polishCow:FlxSprite;
    var polishCowy:FlxSprite;

    override function create() {

        FlxG.sound.playMusic(Paths.music('polishcow'), 0.65);

        texty = new FlxText(0, 0, FlxG.width, "Bruh Moment", 69, true);
        texty.screenCenter(Y);
        add(texty);

        polishCow = new FlxSprite(0, 100);
        polishCow.loadGraphic(Paths.image("polish1"));
        polishCow.scale.set(1.2, 1.2);
        polishCow.updateHitbox();
        polishCow.antialiasing = ClientPrefs.globalAntialiasing;
        add(polishCow);
    }
    override function update(elapsed:Float) {
        if (FlxG.keys.justPressed.SEVEN) {
			FlxG.switchState(new MainMenuState());
        }
    }
}