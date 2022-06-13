local canDodgeroundabout = false;
local canDodgeroundabout2 = false;
local Dodgedroundabout = false
local Dodgedroundabout2 = false

function rounda()
        makeAnimatedLuaSprite('roundabout', 'bull/NMcupheadAttacks', getProperty('dad.x'), getProperty('dad.y')+300);
        addAnimationByPrefix('roundabout', 'burstfx', 'DeathRoundabout instance', 25, true);
        objectPlayAnimation('roundabout', 'burstfx');
        addLuaSprite('roundabout', true); 
        doTweenX('weeeeeroundabout1', 'roundabout', 2000, 1.3, 'sineInOut')
        runTimer('dodgeroundabout', 0.8)
        canDodgeroundabout = true;
        Dodgedroundabout = false
end


function onEvent(n,v1,v2)
    if n == 'roundabout' then
        setProperty('dad.specialAnim', true);
        rounda()
    end
end


function onTimerCompleted(t, l, ll) 
    if t == 'dodgeroundabout' then
        if Dodgedroundabout then
        setProperty('boyfriend.specialAnim', true);
        characterPlayAnim('boyfriend', 'dodge', true);
        else
        setProperty('health', 0);
        end
    end
    if t == 'dodgeroundabout2' then
        if Dodgedroundabout2 then
        setProperty('boyfriend.specialAnim', true);
        characterPlayAnim('boyfriend', 'dodge', true);
        else
        setProperty('health', 0);
        end
    end
end

function onUpdate()
    if canDodgeroundabout == true and keyJustPressed('space') then
   
        Dodgedroundabout = true;
        
        canDodgeroundabout = false

        objectPlayAnimation('dodgebutton', 'dodgeclick')
        
    end

    if canDodgeroundabout2 == true and keyJustPressed('space') then
   
        Dodgedroundabout2 = true;
        
        canDodgeroundabout2 = false

        objectPlayAnimation('dodgebutton', 'dodgeclick')
        
    end
end

function onTweenCompleted(t) 
   if t == 'weeeeeroundabout1' then
    canDodgeroundabout2 = true;
    Dodgedroundabout2 = false
    doTweenX('weeeeeroundabout2', 'roundabout', 200, 2, 'sineInOut')
    runTimer('dodgeroundabout2', 0.5, 1)
   end
   if t == 'weeeeeroundabout2' then
      removeLuaSprite('roundabout', false)
   end
end