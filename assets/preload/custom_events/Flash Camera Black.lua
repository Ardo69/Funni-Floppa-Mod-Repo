function onEvent(n,v1,v2)
	   makeLuaSprite('flash', '', 0, 0);
	   setObjectCamera('flash', 'hud');
       makeGraphic('flash',5120,2800,'000000')
	   addLuaSprite('flash', true);
	   setLuaSpriteScrollFactor('flash',0,0)
	   setProperty('flash.scale.x',2)
	   setProperty('flash.scale.y',2)
	   setProperty('flash.alpha',0)
	   setProperty('flash.alpha',1)
	   doTweenAlpha('flTw','flash',0,v1,'linear')
end