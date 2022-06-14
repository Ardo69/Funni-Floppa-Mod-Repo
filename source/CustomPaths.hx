package;

import haxe.ValueException;
import openfl.display.BitmapData;
import sys.io.File;
import sys.FileSystem;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;

class CustomPaths
{
	inline public static var SOUND_EXT = #if (web || air) "mp3" #else "ogg" #end;

	inline public static var ASSET_PATH = "assets/";

	public static function getPath(library:String, path:String, file:String)
	{
		if (file.indexOf(".") == -1) { // no extensison
			var files = FileSystem.readDirectory(FileSystem.absolutePath(ASSET_PATH + library + "/" + path + "/"));
			var file = null;
			for (i in 0...files.length) {
				if (files[i].indexOf(file) != -1)
					file = files[i];
			}
			if (file == null)
				throw new ValueException("No file called \"" + file + "\" found in directory!");
			return FileSystem.absolutePath(ASSET_PATH + library + "/" + path + "/" + file);
		}
		return FileSystem.absolutePath(ASSET_PATH + library + "/" + path + "/" + file);
	}

    public static function getContent(library:String, path:String, file:String) {
		return File.getContent(getPath(library, path, file));
	}

    public static function getBytes(library:String, path:String, file:String) {
		return File.getBytes(getPath(library, path, file));
	}

    public static function getText(library:String, path:String, file:String) {
		return getContent(library, path, file);
	}

	public inline static function getImage(library:String, path:String, file:String) {
		return BitmapData.fromBytes(getBytes(library, path, file));
	}




}
