package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class OpeningState extends MusicBeatState
{
	public static var leftState:Bool = false;
	public static var discordShit:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Press Escape To Ignore This Message
			  \n
			   Press Enter to Join the Discord Server",
			  32);
		  warnText.setFormat("Source Sans Pro Regular", 32, FlxColor.BROWN, CENTER);
		  warnText.screenCenter(Y);
		  add(warnText);
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.BACK) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}

		if(!discordShit) {
			if (controls.ACCEPT) {
				discordShit = true;
			}

			if(discordShit)
				{
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTween.tween(warnText, {alpha: 0}, 1, {
						onComplete: function (twn:FlxTween) {
							FlxG.openURL('https://discord.gg/8jt9WBWAQ6', '_blank');
							MusicBeatState.switchState(new MainMenuState());
						}
					});
				}
		    }
		super.update(elapsed);
	}
}
