// Oh no too scery
import flixel.util.FlxColor;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.*;
import flixel.util.FlxTimer;
import flash.system.System;

class JumpscareState extends FlxState
{
    var character:Character;

    public function new()
    {
        super();
    }
    override public function create()
    {
        super.create();

        var bg = new FlxSprite(0,0);
        bg.makeGraphic(FlxG.width, FlxG.height);
        add(bg);

        character = new Character(0,0,"flipflop", false);
        character.scale.set(0, 0);
        add(character);

        FlxTween.tween(character, {"scale.x": 2.5, "scale.y": 2.5}, 10, {ease: FlxEase.circInOut});

        new FlxTimer().start(10, jumpscare);
    }

    override function update(elapsed:Float) {
        super.update(elapsed);
        character.updateHitbox();
        character.screenCenter();
    }
    public function jumpscare(bruh:FlxTimer = null)
    {
        var bgFront = new FlxSprite(0,0);
        bgFront.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        add(bgFront);
        new FlxTimer().start(0.6, closeGame);
    }
    public function closeGame(time:FlxTimer = null)
    {
        FlxG.openURL("https://www.youtube.com/watch?v=u6tvzG_88sU", "_blank");
        System.exit(0);
    }
}