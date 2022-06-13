-- Script by Shadow Mario
-- Customized for Simplicity by Kevin Kuntz
-- Modified By Laztrix (Originally for Knockout)
local bluesshit = {0, 1}
local blues = 0;
local bluesounds = 0
local ba = 'Shot02 instance'
local cupheadpeassss = false;
local cardthingy = 0;
local canattack = false;
local canstilladdmore = true;
local cardfully = 0;
local cardnotfully = 0;
local attacked = false;
local mecha = false
----
local idlebfthing = false
local idlecupthing = false
function onCreate()
	if difficulty == 0 then
		mecha = false
	else
		mecha = true
	end
   
	if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
		cardfully = 50
		cardnotfully = 0
	else
		cardfully = 600
		cardnotfully = 500
	end

	makeLuaSprite('card', 'cardfull',  1100 - 150, cardfully);
	setObjectCamera('card', 'hud')
	addLuaSprite('card', true)
	setProperty('card.scale.y', 0.01)
	setProperty('card.alpha', 0)

	makeAnimatedLuaSprite('cardnotflipped', 'Cardcrap',  1100 - 150, cardnotfully);
	addAnimationByPrefix('cardnotflipped', 'popoutnormal', 'Card Normal Pop out instance 1', 24, false);
	addAnimationByPrefix('cardnotflipped', 'popoutparry', 'PARRY Card Pop out  instance 1', 24, false);
	addAnimationByPrefix('cardnotflipped', 'byehaveagreattime', 'Card Used instance 1', 24, false);
	addLuaSprite('cardnotflipped', true)
	setObjectCamera('cardnotflipped', 'hud')
	setProperty('cardnotflipped.alpha', 0)
	
	makeAnimatedLuaSprite('dodgebutton', 'Notmobilegameanymore',  -30, 300);
	setProperty('dodgebutton.scale.x', 0.4)
	setProperty('dodgebutton.scale.y', 0.4)
	setObjectCamera('dodgebutton', 'hud')
	addAnimationByPrefix('dodgebutton', 'dodge', 'Dodge instance 1', 24, false);
	addAnimationByPrefix('dodgebutton', 'dodgeclick', 'Dodge click instance 1', 24, false);
	addLuaSprite('dodgebutton', true)

	makeAnimatedLuaSprite('attackbutton', 'Notmobilegameanymore',  -30, getProperty('dodgebutton.y') - 50);
	setProperty('attackbutton.scale.x', 0.4)
	setProperty('attackbutton.scale.y', 0.4)
	setObjectCamera('attackbutton', 'hud')
	addAnimationByPrefix('attackbutton', 'attack', 'Attack instance 1', 24, false);
	addAnimationByPrefix('attackbutton', 'attackclick', 'Attack Click instance 1', 24, false);
	objectPlayAnimation('attackbutton', 'attack')
	addLuaSprite('attackbutton', true)

	setProperty('attackbutton.alpha', 0.5)
	setProperty('dodgebutton.alpha', 0.5)
	
end
function boolol()
	makeAnimatedLuaSprite('cupscare','cup',-100,-220)
	scaleObject('cupscare',0.6,0.6)
        addAnimationByPrefix('cupscare','notfuck','CupScare instance',24,false)
        objectPlayAnimation('cupscare','notfuck',true)
	setObjectCamera('cupscare','other')
        addLuaSprite('cupscare')
end
function onCreatePost()
	if mecha then
	--setProperty('debugKeysChart', 'NINE');
	end
end

function plusshit()
	cardthingy = cardthingy + 0.5
	-- debugPrint('card number: ', cardthingy)
end

function carddoesthething()
	setProperty('card.alpha', 0)
    setProperty('cardnotflipped.alpha', 1)
	objectPlayAnimation('cardnotflipped', 'popoutnormal')
	setProperty('cardnotflipped.offset.y', -10)
    canattack = true;
	canstilladdmore = false
	setProperty('card.scale.y', 0.01)
	setProperty('card.y', cardfully)
end

function carddoesthethingparry()
	setProperty('card.alpha', 0)
    setProperty('cardnotflipped.alpha', 1)
	objectPlayAnimation('cardnotflipped', 'popoutparry')
	setProperty('cardnotflipped.offset.y', -10)
    canattack = true;
	canstilladdmore = false
	setProperty('card.scale.y', 0.01)
	setProperty('card.y', cardfully)
end

function cardgoback()
	setProperty('cardnotflipped.alpha', 0)
	canstilladdmore = true
end

function opponentNoteHit(id, d, noteType, isSustainNote)
	if not lowQuality then
	cameraShake('game', 0.007, 0.1)
    cameraShake('hud', 0.007, 0.1)
	end
end


function goodNoteHit(id, d, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
if mecha then
	if canstilladdmore then
	if not isSustainNote then
	setProperty('card.scale.y', getProperty('card.scale.y') + 0.01)
	setProperty('card.y', getProperty('card.y') - 0.5)
	setProperty('card.alpha', 1)
	-- debugPrint(getProperty('card.scale.y'))
	end
	end
end
	if noteType == 'Parry note' then
		playSound('parry', 1)
		if canstilladdmore then
		carddoesthethingparry();
		end
	end

end
animPewList = {'Shot01 instance','Shot02 instance','Shot03 instance','Shot04 instance','Shot05 instance'}
function spawntheblues()
    blues = blues + 1
	bluesounds = bluesounds + 1

	if bluesounds > 5 then
		bluesounds = 0
    end
    characterPlayAnim('dad','shoot',true)
	makeAnimatedLuaSprite('bluesshit' .. blues, 'bull/NMcupheadBull',900, 550);
	setProperty('bluesshit' .. blues .. 'scale.x', 0.3)
	setProperty('bluesshit' .. blues .. 'scale.y', 0.3)
	for i = 1,5 do
    addAnimationByPrefix('bluesshit'.. blues, animPewList[i], animPewList[i], 25, false);
	end
	addLuaSprite('bluesshit' .. blues, true);
	objectPlayAnimation('bluesshit'..blues,animPewList[getRandomInt(1,5)])
	playSound('attacks/pea' .. bluesounds , 0.6,'lmao')
	-- playAnimation('cuphead', 5 , false)
end
fr = 0
function onUpdate(elapsed)
	fr = fr + elapsed
	if not lowQuality then
    setProperty('nightmarecupbg1.alpha',0 + math.cos(fr*0.4) * 1)
	end
	if idlebfthing == true then
		setProperty('boyfriend.visible',false)
		setProperty('bfthing.alpha',1)
	elseif idlebfthing == false then
		setProperty('boyfriend.visible',true)
		setProperty('bfthing.alpha',0)
	end
	if idlecupthing == true then
		setProperty('dad.visible',false)
		setProperty('cupthing.alpha',1)
	elseif idlecupthing == false then
		setProperty('dad.visible',true)
		setProperty('cupthing.alpha',0)
	end
end

function onUpdatePost()
	if mecha == true then
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
			setProperty('dad.visible',false)
		--boolol()
	end
end
	if getProperty('cupscare.animation.curAnim.name') == 'notfuck' then
		if getProperty('cupscare.animation.curAnim.finished') then
		   setProperty('health',-3)
		end
	end

	if getProperty('attackbutton.animation.curAnim.name') == 'attackclick' then
        if getProperty('attackbutton.animation.curAnim.finished') then
        objectPlayAnimation('attackbutton', 'attack')
        end
    end

	if getProperty('dodgebutton.animation.curAnim.name') == 'dodgeclick' then
        if getProperty('dodgebutton.animation.curAnim.finished') then
        objectPlayAnimation('dodgebutton', 'dodge')
        end
    end

	if getProperty('bfthing.animation.curAnim.name') == 'attack' then
		setProperty('bfthing.offset.x',1091)
		setProperty('bfthing.offset.y',-16)
		setProperty('cupthing.offset.x',46)
		setProperty('cupthing.offset.y',-279)

        if getProperty('bfthing.animation.curAnim.curFrame') == 4 then
			objectPlayAnimation('cupthing', 'dodge')
			idlecupthing = true
        end
    end

	if getProperty('cardnotflipped.animation.curAnim.name') == 'byehaveagreattime' then
        if getProperty('cardnotflipped.animation.curAnim.finished') then
        cardgoback()
        end
    end

	for i = 0,blues do
		if getProperty('bluesshit' .. i .. '.animation.curAnim.finished') then
			removeLuaSprite('bluesshit' .. i);
		end
	end

	if getProperty('card.scale.y') > 0.9 then
	   if canstilladdmore then
       carddoesthething()
	   end
	end


	-- i fucking hate math istg this is so shit
	if mecha then
			if canattack == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') then  
		attacked = true;
		objectPlayAnimation('cardnotflipped', 'byehaveagreattime') 
		setProperty('cardnotflipped.offset.x', -5)
		setProperty('cardnotflipped.offset.y', -30)
		idlebfthing = true
		cupheadpeassss = false;
		runTimer('hurtsound', 0.3, 1)
		runTimer('idlebfactive', 0.8, 1)
		runTimer('idlecupactive', 0.8, 1)
		setProperty('health', getProperty('health') + 0.5)
		objectPlayAnimation('bfthing', 'attack')
        canattack = false
		objectPlayAnimation('attackbutton', 'attackclick')
    end
end
end


function onBeatHit()
	setProperty('iconP1.scale.x',1)
	setProperty('iconP2.scale.x',1)
	setProperty('iconP1.scale.y',1)
	setProperty('iconP2.scale.y',1)
end


function onTimerCompleted(t, l, ll)
	if t == 'balls' then
		characterPlayAnim('dad', 'shootballs', true);
	end
	if t == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
	if t == 'startC' then -- Timer completed, play dialogue
		startCountdown();
				doTweenZoom('wwhw','camGame',0.65,0.5,'quadOut')
	end
	if t == 'idlebfactive' then
		idlebfthing = false
	end
	if t == 'idlecupactive' then
		idlecupthing = false
	end
	if t == 'hurtsound' then
		playSound('hurt', 1)
	end
	if t == 'shootsound' then
		playSound('shoot', 1)
		
	end
	if t == 'dodge' then
		objectPlayAnimation('dodgebutton','dodge',true)
		playSound('pre_shoot', 1)
		objectPlayAnimation('bf', 'dodge', false)
		setProperty('bf.offset.x', -10);
		setProperty('bf.offset.y', -16);
		animationbf = false;
	end
end


function onEvent(n,v1,v2)
	if mecha then
		    if n == 'hadouken' then
		runTimer('balls',0.2)
        animation = false
		objectPlayAnimation('dodgebutton','dodgeclick',true)
		runTimer('dodge', 0.8, 1)
		playSound('pre_shoot', 1)
		runTimer('shootsound', 0.4, 1)
    end
	if n == 'cuphead pea' then
	   attacked = false;
	   cupheadpeassss = true;
	end
	if n == 'shoot the mf' then
		if cupheadpeassss then
		spawntheblues()
		if not attacked then
		setProperty('health', getProperty('health') - 0.12)
		end
		end
	end
	if n == 'roundabout' then
		characterPlayAnim('dad', 'click', true);
		runTimer('dodge', 1.2, 1)
		runTimer('shootsound', 0.3, 1)
	end
end
end

function onTweenCompleted(t) 
	if t == 'www' then
		doTweenZoom('www2','camGame',1,1.2,'quadOut')
end
	if t == 'weeeeeroundabout1' then
		animationbf = false
       runTimer('dodge', 0.5, 1)
	end
	if t == 'zoommy' then
        setProperty('defaultCamZoom', tonumber(splittc[2]))
	end
 end

