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

        FlxG.sound.playMusic(Paths.music('polishcow'), 0.65); // bwomp

        texty = new FlxText(0, 0, FlxG.width, "Bruh Moment", 69, true);
        texty.screenCenter(Y);
        add(texty);

        polishCowy.kill();

        polishCow = new FlxSprite(0, 100);
        polishCow.loadGraphic(Paths.image("polish1"));
        polishCow.updateHitbox();
        polishCow.antialiasing = ClientPrefs.globalAntialiasing;
        add(polishCow);

        new FlxTimer().start(1, cowy);
    }

    public function cowy(bruh:FlxTimer = null) {
        polishCow.kill();

        polishCowy = new FlxSprite(0, 100);
        polishCowy.loadGraphic(Paths.image("polish2"));
        polishCowy.updateHitbox();
        polishCowy.antialiasing = ClientPrefs.globalAntialiasing;
        add(polishCow);

        new FlxTimer().start(1, cowyy);
    }
    public function cowyy(bruh:FlxTimer = null) {

        polishCowy.kill();

        polishCow = new FlxSprite(0, 100);
        polishCow.loadGraphic(Paths.image("polish1"));
        polishCow.updateHitbox();
        polishCow.antialiasing = ClientPrefs.globalAntialiasing;
        add(polishCow);

        new FlxTimer().start(1, cowy);
    }

    override function update(elapsed:Float)
        {
            if (controls.BACK) {
                FlxG.switchState(new MainMenuState());
            }

            Conductor.songPosition = FlxG.sound.music.time;
            super.update(elapsed);
        }
}