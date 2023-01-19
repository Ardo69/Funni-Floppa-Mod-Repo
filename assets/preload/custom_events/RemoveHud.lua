function onEvent(name, value1, value2)
	if not lowQuality then
		setProperty('scoreTxt.visible', false);
		setProperty('healthBar.visible', false);
		setProperty('healthBarBG.visible', false);
		setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
		setProperty('timeBar.visible', false);
		setProperty('timeBarBG.visible', false);
		setProperty('timeTxt.visible', false);
	end
end