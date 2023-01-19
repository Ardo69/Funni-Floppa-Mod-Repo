function onEvent(name, value1, value2)
    if not lowQuality then
    setProperty('scoreTxt.visible', true);
    setProperty('healthBar.visible', true);
    setProperty('healthBarBG.visible', true);
    setProperty('iconP1.visible', true);
    setProperty('iconP2.visible', true);
    setProperty('timeBar.visible', true);
    setProperty('timeBarBG.visible', true);
    setProperty('timeTxt.visible', true);
    end
end