package;

import openfl.geom.Rectangle;
import flixel.math.FlxRect;
import openfl.display.BitmapData;


class ImageUtils {
    public static function GetImageRect(image:BitmapData):Rectangle {
        return image.getColorBoundsRect(0x00000000, 0x00000000, true);
    }
}