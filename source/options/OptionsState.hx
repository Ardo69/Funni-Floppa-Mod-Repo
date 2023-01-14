package options;

import flixel.addons.display.FlxBackdrop;
#if cpp
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;
using StringTools;

class OptionsState extends MusicBeatState
{
	var options:Array<String> = [
		'Note Colors',
		'Controls',
		// 'Adjust Delay and Combo',
		'Graphics',
		'Visuals and UI',
		'Gameplay',
	];
	private var grpOptions:FlxTypedGroup<Alphabet>;

	private static var curSelected:Int = 0;
	public static var menuDesat:FlxSprite;

	function openSelectedSubstate(label:String)
	{
		switch (label)
		{
			case 'Note Colors':
				openSubState(new options.NotesSubState());
			case 'Controls':
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI':
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjust Delay and Combo':
				LoadingState.loadAndSwitchState(new options.NoteOffsetState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

	override function create()
	{		
		#if cpp
		DiscordClient.changePresence("Options Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFea71fd;
		bg.updateHitbox();

		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		var barTop = new FlxSprite();
		barTop.makeGraphic(FlxG.width + 512, 455, 0xFFA2946F);
		barTop.y = -400;
		barTop.antialiasing = ClientPrefs.globalAntialiasing;
		// barTop.angle = 15;
		add(barTop);

		var barBottom = new FlxSprite();
		barBottom.makeGraphic(FlxG.width + 512, 455, 0xFFA2946F);
		barBottom.y = 650;
		barBottom.antialiasing = ClientPrefs.globalAntialiasing;
		// barBottom.x = -100;
		// barBottom.angle = 15;
		add(barBottom);

		var flopBottom = new FlxBackdrop(Paths.image("flop"), X, 5, 0);
		// flopBottom.y = barBottom.y + flopBottom.height + 5;
		flopBottom.screenCenter();
		flopBottom.scale.set(0.6, 0.6);
		flopBottom.updateHitbox();
		// flopBottom.angle = 15;
		flopBottom.velocity.set(100, 0);
		flopBottom.antialiasing = ClientPrefs.globalAntialiasing;
		flopBottom.y = 600;
		add(flopBottom);

		var flopTop = new FlxBackdrop(Paths.image("flop"), X, 5, 0);
		// flopTop.y = barBottom.y + flopTop.height + 5;
		flopTop.screenCenter();
		flopTop.scale.set(0.6, 0.6);
		flopTop.updateHitbox();
		// flopTop.angle = 15;
		flopTop.velocity.set(-100, 0);
		flopTop.y = 55;
		flopTop.antialiasing = ClientPrefs.globalAntialiasing;
		add(flopTop);
		
		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true, false);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}

		selectorLeft = new Alphabet(0, 0, '>', true, false);
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true, false);
		add(selectorRight);

		changeSelection();
		ClientPrefs.saveSettings();

		super.create();
	}

	override function closeSubState()
	{
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.UI_UP_P)
		{
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (controls.ACCEPT)
		{
			openSelectedSubstate(options[curSelected]);
		}
	}

	function changeSelection(change:Int = 0)
	{
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0)
			{
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}
}
