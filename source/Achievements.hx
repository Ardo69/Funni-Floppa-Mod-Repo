import GameJolt.GameJoltAPI;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.text.FlxText;

using StringTools;

class Achievements
{
	public static var achievementMap:Map<String, Dynamic> = [
		// Achievement save tag => [Real Name, Description, gamejolt ID, Hidden achievement]
		"raisedAFloppa" => [
			"Beat the main week of the mod.",
			'Raised a floppa',
			167434,
			false
		],
		"terribleBambiMod" => [
			"Pass frien, how suprising.",
			'Random terrible Bambi song',
			165209,
			false
		],
		"spammingSkills" => [
			"Beat Floppasition and Flopparchy without using practice mode, or botplay.",
			'Phenominal spamming skills',
			165207,
			false
		],
		"nightmareOver" => ["Pass Players fate", 'Nightmare over', 164208, false]
	];

	public static var totalAchievements:Int = Lambda.count(achievementMap); // SUPID HAXNAE OIHISHIERHÓŚĄŁĄIKODSUDZHĄŚŚĆKIJXLKPU(kKHOUIH$JREFIOD) >:(((

	public static var achievementUnlockedMap:Map<String, Bool> = new Map<String, Bool>();

	public static var henchmenDeath:Int = 0;

	public static function unlockAchievement(name:String):Void
	{
		var achivementData:Dynamic = achievementMap.get(name);
		if (achivementData == null) {
			FlxG.log.warn('Unknown achievement ${name}!');
			return;
		}
		FlxG.log.add('Completed achievement "' + name + '"');
		GameJoltAPI.getTrophy(achivementData[2]);
		achievementUnlockedMap.set(name, true);
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	}

	public static function isAchievementUnlocked(name:String)
	{
		if (achievementUnlockedMap.exists(name) && achievementUnlockedMap.get(name))
		{
			return true;
		}
		return false;
	}

	// shtoopid function asfsadfasdasf :(
	// public static function getAchievementIndex(name:String)
	// {
	// 	for (i in 0...achievementMap.length)
	// 	{
	// 		if (achievementMap. [i][2] == name)
	// 		{
	// 			return i;
	// 		}
	// 	}
	// 	return -1;
	// }

	public static function loadAchievements():Void
	{
		if (FlxG.save.data != null)
		{
			if (FlxG.save.data.achievementUnlockedMap != null)
			{
				achievementUnlockedMap = FlxG.save.data.achievementUnlockedMap;
			}
		}
	}
}

class AttachedAchievement extends FlxSprite
{
	public var sprTracker:FlxSprite;

	private var tag:String;

	public function new(x:Float = 0, y:Float = 0, name:String)
	{
		super(x, y);

		changeAchievement(name);
		antialiasing = ClientPrefs.globalAntialiasing;
	}

	public function changeAchievement(tag:String)
	{
		this.tag = tag;
		reloadAchievementImage();
	}

	public function reloadAchievementImage()
	{
		if (Achievements.isAchievementUnlocked(tag))
		{
			loadGraphic(Paths.image('achievements/' + tag));
		}
		else
		{
			loadGraphic(Paths.image('achievements/lockedachievement'));
		}
		scale.set(0.7, 0.7);
		updateHitbox();
	}

	override function update(elapsed:Float)
	{
		if (sprTracker != null)
			setPosition(sprTracker.x - 130, sprTracker.y + 25);

		super.update(elapsed);
	}
}

class AchievementObject extends FlxSpriteGroup
{
	public var onFinish:Void->Void = null;

	var alphaTween:FlxTween;

	public function new(name:String, ?camera:FlxCamera = null)
	{
		super(x, y);
		ClientPrefs.saveSettings();

		var achievementBG:FlxSprite = new FlxSprite(60, 50).makeGraphic(420, 120, FlxColor.BLACK);
		achievementBG.scrollFactor.set();

		var achievementIcon:FlxSprite = new FlxSprite(achievementBG.x + 10, achievementBG.y + 10).loadGraphic(Paths.image('achievements/' + name));
		achievementIcon.scrollFactor.set();
		achievementIcon.setGraphicSize(Std.int(achievementIcon.width * (2 / 3)));
		achievementIcon.updateHitbox();
		achievementIcon.antialiasing = ClientPrefs.globalAntialiasing;

		var achievementName:FlxText = new FlxText(achievementIcon.x + achievementIcon.width + 20, achievementIcon.y + 16, 280,
			Achievements.achievementMap.get(name)[0], 16);
		achievementName.setFormat(Paths.font("sanspro-bold.ttf"), 16, FlxColor.WHITE, LEFT);
		achievementName.scrollFactor.set();

		var achievementText:FlxText = new FlxText(achievementName.x, achievementName.y + 32, 280, Achievements.achievementMap.get(name)[1], 16);
		achievementText.setFormat(Paths.font("sanspro-bold.ttf"), 16, FlxColor.WHITE, LEFT);
		achievementText.scrollFactor.set();

		add(achievementBG);
		add(achievementName);
		add(achievementText);
		add(achievementIcon);

		var cam:Array<FlxCamera> = FlxCamera.defaultCameras;
		if (camera != null)
		{
			cam = [camera];
		}
		alpha = 0;
		achievementBG.cameras = cam;
		achievementName.cameras = cam;
		achievementText.cameras = cam;
		achievementIcon.cameras = cam;
		alphaTween = FlxTween.tween(this, {alpha: 1}, 0.5, {
			onComplete: function(twn:FlxTween)
			{
				alphaTween = FlxTween.tween(this, {alpha: 0}, 0.5, {
					startDelay: 2.5,
					onComplete: function(twn:FlxTween)
					{
						alphaTween = null;
						remove(this);
						if (onFinish != null)
							onFinish();
					}
				});
			}
		});
	}

	override function destroy()
	{
		if (alphaTween != null)
		{
			alphaTween.cancel();
		}
		super.destroy();
	}
}
