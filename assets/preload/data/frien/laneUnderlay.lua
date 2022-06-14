

function onCreate()      
      
        makeAnimatedLuaSprite('laneUnderlay', 'laneUnderlays', 410, -1);
	    addAnimationByPrefix('laneUnderlay', 'idle', 'Idle', 24, false);
        setObjectCamera('laneUnderlay', 'hud')
        setScrollFactor('laneUnderlay', 0)
        addLuaSprite('laneUnderlay', false)
        scaleObject('laneUnderlay', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay2', 'laneUnderlays', 410, -1);
	    addAnimationByPrefix('laneUnderlay2', 'idle', 'Idle', 24, false);
        setObjectCamera('laneUnderlay2', 'hud')
        setScrollFactor('laneUnderlay2', 0)
        addLuaSprite('laneUnderlay2', false)
        scaleObject('laneUnderlay2', 0.23, 1);


        makeAnimatedLuaSprite('laneUnderlay3', 'laneUnderlays', 410, -1);
	    addAnimationByPrefix('laneUnderlay3', 'idle', 'Idle', 24, false);
        setObjectCamera('laneUnderlay3', 'hud')
        setScrollFactor('laneUnderlay3', 0)
        addLuaSprite('laneUnderlay3', false)
        scaleObject('laneUnderlay3', 0.23, 1);

        makeAnimatedLuaSprite('laneUnderlay4', 'laneUnderlays', 410, -1);
	    addAnimationByPrefix('laneUnderlay4', 'idle', 'Idle', 24, false);
        setObjectCamera('laneUnderlay4', 'hud')
        setScrollFactor('laneUnderlay4', 0)
        addLuaSprite('laneUnderlay4', false)
        scaleObject('laneUnderlay4', 0.23, 1);
        
    end

function onUpdate()
    if middlescroll == false then


        makeAnimatedLuaSprite('laneUnderlay5', 'laneUnderlays-ash', 90, -1);
	    addAnimationByPrefix('laneUnderlay5', 'idle', 'Idle', 24, false);
        setObjectCamera('laneUnderlay5', 'hud')
        setScrollFactor('laneUnderlay5', 0)
        addLuaSprite('laneUnderlay5', false)
        scaleObject('laneUnderlay5', 0.23, 1);

        makeLuaSprite('laneUnderlay6', 'laneUnderlay', 202, -1)
        setObjectCamera('laneUnderlay6', 'hud')
        setScrollFactor('laneUnderlay6', 0)
        addLuaSprite('laneUnderlay6', false)
        scaleObject('laneUnderlay6', 0.23, 1);

        makeLuaSprite('laneUnderlay7', 'laneUnderlay', 315, -1)
        setObjectCamera('laneUnderlay7', 'hud')
        setScrollFactor('laneUnderlay7', 0)
        addLuaSprite('laneUnderlay7', false)
        scaleObject('laneUnderlay7', 0.23, 1);

        makeLuaSprite('laneUnderlay8', 'laneUnderlay', 428, -1)
        setObjectCamera('laneUnderlay8', 'hud')
        setScrollFactor('laneUnderlay8', 0)
        addLuaSprite('laneUnderlay8', false)
        scaleObject('laneUnderlay8', 0.23, 1);
    
        
        setProperty('laneUnderlay.x',getPropertyFromGroup('playerStrums', 0, 'x')-1)
        setProperty('laneUnderlay2.x', getPropertyFromGroup('playerStrums', 1, 'x')-1)
        setProperty('laneUnderlay3.x', getPropertyFromGroup('playerStrums', 2, 'x')-1)
        setProperty('laneUnderlay4.x', getPropertyFromGroup('playerStrums', 3, 'x')-1)

        setProperty('laneUnderlay5.x',getPropertyFromGroup('opponentStrums', 0, 'x')-1)
        setProperty('laneUnderlay6.x', getPropertyFromGroup('opponentStrums', 1, 'x')-1)
        setProperty('laneUnderlay7.x', getPropertyFromGroup('opponentStrums', 2, 'x')-1)
        setProperty('laneUnderlay8.x', getPropertyFromGroup('opponentStrums', 3, 'x')-1)


       


    end
    
    if middlescroll == true then

    
        
        setProperty('laneUnderlay.x',getPropertyFromGroup('playerStrums', 0, 'x')-1)
        setProperty('laneUnderlay2.x', getPropertyFromGroup('playerStrums', 1, 'x')-1)
        setProperty('laneUnderlay3.x', getPropertyFromGroup('playerStrums', 2, 'x')-1)
        setProperty('laneUnderlay4.x', getPropertyFromGroup('playerStrums', 3, 'x')-1)


       


    end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
    if direction == 0 then
        objectPlayAnimation('laneUnderlay', 'singLEFT', true)

    end
    if direction == 1 then
        objectPlayAnimation('laneUnderlay2', 'singDOWN', true)

    end

    if direction == 2 then
        objectPlayAnimation('laneUnderlay3', 'singUP', true)

    end

    if direction == 3 then
        objectPlayAnimation('laneUnderlay4', 'singRIGHT', true)

    end
end


--[[function opponentNoteHit(id, direction, noteType, isSustainNote)
    if direction == 0 then
        objectPlayAnimation('laneUnderlay5', 'singLEFT', false)

    end
end
function onTimerCompleted(tag)
    if tag == "left" then
        objectPlayAnimation('laneUnderlay5', 'singLEFT', true)
    end
end]]--
