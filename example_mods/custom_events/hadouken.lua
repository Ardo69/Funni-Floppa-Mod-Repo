function HadoukeWosh()
    makeAnimatedLuaSprite('Hadoken', 'bull/NMcupheadAttacks', getProperty('dad.x')-200, getProperty('dad.y')+300);
    addAnimationByPrefix('Hadoken', 'burstfx', 'DeathBlast instance', 25, true);
    addAnimationByPrefix('Hadoken', 'burstfxreal', 'DeathBlast instance', 25, false);
    objectPlayAnimation('Hadoken', 'burstfx');
    addLuaSprite('Hadoken', true); 
    doTweenX('wee1', 'Hadoken', 2500, 1.3, 'sineInOut')
end
local mecha = false
function onCreate()
    if difficulty == 0 then
		mecha = false
    else
		mecha = true
	end
    precacheImage('bull/NMcupheadAttacks')
    precacheImage('bull/NMcupheadBull')
    precacheImage('cup')
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
end
function onCreatePost()  
  if songName == 'ReDevils Gambit' then
    mecha = true
  end
end
function onEvent(name, value1, value2)
    if name == "hadouken" then
        if mecha then
    runTimer('bal',0.2)
	canDodge = true;
	runTimer('Died', 0.66);
	
	end
end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   Dodged = true;
   end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'bal' then
        HadoukeWosh()
    end
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   characterPlayAnim('boyfriend', 'dodge', true);
   Dodged = false
   end
end

function onTweenCompleted(tag)
    if tag == 'wee1' then
        removeLuaSprite('Hadoken');
    end
end