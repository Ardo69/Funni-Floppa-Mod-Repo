package;

#if desktop
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
import Achievements;

using StringTools;
using Lambda;

class AchievementsMenuState extends MusicBeatState
{
	#if ACHIEVEMENTS_ALLOWED
	var options:Map<String, Dynamic> = [];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	private var achievementArray:Array<AttachedAchievement> = [];
	private var achievementIndex:Array<String> = [];
	private var descText:FlxText;

	override function create() {
		#if desktop
		DiscordClient.changePresence("Achievements Menu", null);
		#end

		var menuDesat:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		menuDesat.setGraphicSize(Std.int(menuDesat.width * 1.1));
		menuDesat.updateHitbox();
		menuDesat.screenCenter();
		menuDesat.antialiasing = ClientPrefs.globalAntialiasing;
		add(menuDesat);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		Achievements.loadAchievements();
		options = Achievements.achievementMap.copy();

		var index = 0;
		/// just to remind:
		// Achievement save tag => [Real Name, Description, gamejolt ID, Hidden achievement]
		for (achievement in options.keys()) {
			var achievementData = options.get(achievement);
			// var index = Lambda.findIndex(options, achievement);  // ayo half life refrenceλ???
			// nevermind lamda dumb >:((((
			var achieveName:String = achievementData[0];
			var optionText:Alphabet = new Alphabet(0, (100 * index) + 210, Achievements.isAchievementUnlocked(achieveName) ? achievementData[0] : '?', false, false);
			optionText.isMenuItem = true;
			optionText.x += 280;
			optionText.xAdd = 200;
			optionText.targetY = index;
			grpOptions.add(optionText);

			var icon:AttachedAchievement = new AttachedAchievement(optionText.x - 105, optionText.y, achieveName);
			icon.sprTracker = optionText;
			achievementArray.push(icon);
			add(icon);

			index += 1;
		}
		index = 0;

		descText = new FlxText(150, 600, 980, "", 32);
		descText.setFormat(Paths.font("sanspro-regular.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);
		changeSelection();

		super.create();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
	}

	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = Achievements.totalAchievements - 1;
		if (curSelected >= Achievements.totalAchievements)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
			}
		}

		for (i in 0...achievementArray.length) {
			achievementArray[i].alpha = 0.6;
			if(i == curSelected) {
				achievementArray[i].alpha = 1;
			}
		}
		descText.text = options.array()[curSelected][1];
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
	}
	#end
}
