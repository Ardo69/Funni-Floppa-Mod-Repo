package;

import openfl.Lib;
import openfl.events.MouseEvent;
import openfl.display.SimpleButton;
import openfl.text.TextFormat;
import openfl.text.TextField;
import flixel.util.FlxGradient;
import flixel.FlxG;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;


class Topbar extends Sprite {
    public static var topBarHeight:Int = 80;
    public static var dropShadowHeight:Int = 28;
    public static var textSize:Int = 16;

    var bg:Bitmap;
    var dropShadow:Bitmap;
    var text:TextField;

    var closeButton:SimpleButton;
    var minimizeButton:SimpleButton;

    public function new(topbarText:String, dropshadowEnabled:Bool) {
        super();

        bg = new Bitmap(
            new BitmapData(1280, topBarHeight, false, 0xFF393B3D),
        AUTO, false); // for some reason roblox dosen't antialias this???

        dropShadow = new Bitmap(
            FlxGradient.createGradientBitmapData(1280, dropShadowHeight, [0xFF1A1C1D, 0x001A1C1D], 1, 90, true)
        );

        dropShadow.y += topBarHeight;
        
        var format = new TextFormat("Gotham SSm Medium", textSize, 0xFFFFFFFF);
        format.align = CENTER;

        text = new TextField();
        text.text = topbarText;
        text.defaultTextFormat = format;
        text.y = Std.int(topBarHeight / 2 - textSize / 2);
        text.x = Std.int(1280 / 2 - text.width / 2);
        // text.field = Std.int(bg.width);

        var closeIconData = Paths.image("roblox/icons/icon_close").bitmap;
        var closeIcon = new Bitmap(closeIconData);
        var minimizeIconData = Paths.image("roblox/icons/icon_minimize").bitmap;
        var minimizeIcon = new Bitmap(minimizeIconData);
        
        var closeIconHitbox = new Bitmap(new BitmapData(64, 64));
        var minimizeIconHitbox = new Bitmap(new BitmapData(64, 64));

        closeIconHitbox.x = 1280 - closeIconHitbox.width - 15;
        closeIconHitbox.y = Std.int(topBarHeight / 2 - closeIconHitbox.height / 2);
        closeIcon.x = 1280 - closeIconHitbox.width - 15;
        closeIcon.y = Std.int(topBarHeight / 2 - closeIconHitbox.height / 2);

        minimizeIconHitbox.x = minimizeIconHitbox.width - closeIconHitbox.width - 15;
        minimizeIconHitbox.y = Std.int(topBarHeight / 2 - minimizeIconHitbox.height / 2);
        minimizeIcon.x = minimizeIconHitbox.width - closeIconHitbox.width - 15;
        minimizeIcon.y = Std.int(topBarHeight / 2 - minimizeIconHitbox.height / 2);

        closeButton = new SimpleButton(closeIcon, closeIcon, closeIcon, closeIconHitbox);
        closeButton.addEventListener(MouseEvent.MOUSE_UP, closeGame);
        minimizeButton = new SimpleButton(minimizeIcon, minimizeIcon, minimizeIcon, minimizeIconHitbox);
        minimizeButton.addEventListener(MouseEvent.MOUSE_UP, minimizeWindow);

        addChild(dropShadow);
        addChild(bg);
        addChild(closeButton);
        addChild(minimizeButton);
        addChild(text);
    }

    function makeButton(icon:Bitmap) {
        var hitbox = new Bitmap(new BitmapData(64, 64));

        
    }

    function closeGame(event) {
        Sys.exit(0);
    }

    function minimizeWindow(event) {
        FlxG.fullscreen = false;
    }
}