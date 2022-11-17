                                    -- SCRIPT BY RORUTOP --
local Assets = { -- feel free to customize
    character = {
        name = 'BOYFRIEND_DEAD',
        idle = 'BF dies',
        loop = 'BF Dead Loop',
        confirm = 'BF Dead confirm'
    },
    sounds = {
        loss = 'fnf_loss_sfx',
        music = 'gameOver',
        confirm = 'gameOverEnd'
    }
}
local gameoverBPM = 100

function unsetShader()
    runHaxeCode([[trace(ShaderFilter);
    game.camGame.setFilters([]);]])

    runHaxeCode([[trace(ShaderFilter);
    game.camHUD.setFilters([]);]])

    runHaxeCode([[trace(ShaderFilter);
    game.camOther.setFilters([]);]])
end

function lerp(a,b,t) return a * (1-t) + b * t end

function onCreatePost()
    setPropertyFromClass('flixel.FlxG','save.data.isFuckingDead', false) -- ignore this just for stopping the custom pause menu i made
end

function createBox(name,x,y,width,height,color,alpha,cam)
    makeLuaSprite(name,'',x,y)
    makeGraphic(name,width,height,color)
    setProperty(name..'.alpha', alpha)
    addLuaSprite(name,true)
    setObjectCamera(name,cam)
    --debugPrint(name..' has been created')
end

local debounce = {}
local freezedPos = 0
local vol = 0.8
local zoomt = 0

function onGameOver()
    if not debounce.alreadyded then
        openCustomSubstate('death', false)
        setProperty('paused',true)
        freezedPos = getPropertyFromClass('Conductor', 'songPosition')
        setPropertyFromClass('flixel.FlxG','save.data.isFuckingDead', true)
        -- getPropertyFromClass('flixel.FlxG','save.data.isFuckingDead')
        debounce.alreadyded = true
    end
    return Function_Stop
end

function onPause()
  if debounce.alreadyded then
    return Function_Stop
  end
end

local onLoop = false
local isConFirm = false
local isExit = false
function onUpdatePost()
    if debounce.alreadyded then
        if onLoop or isConFirm or isExit then
            runHaxeCode([[ game.vocals.pause(); ]])
            setPropertyFromClass('flixel.FlxG','camera.zoom', zoomt)
        end
        setPropertyFromClass('Conductor', 'songPosition', freezedPos)
    end
end

local timer = {startdelay = {t = 0,max = 1},beat = {t = 0,m = 0,loop = 0},confirm = {time = 0,max = 2.7,fadingdelay = 0,fadingdelaymax = 0.7}}

function onCustomSubstateCreate(tag)
	if tag == 'death' then
        setPropertyFromClass('flixel.FlxG','save.data.setFollowBool', false) -- ignore this just using this for disabling my cam follow per note hit script
        zoomt = getPropertyFromClass('flixel.FlxG','camera.zoom')

        setProperty('boyfriend.visible',false)

        createBox('gameoverblackbox',defaultBoyfriendX - 1500,defaultBoyfriendY - 1000,3000,3000,'000000',0,'camGame')
        doTweenAlpha('dasdsdadgameoverblackboxfaede','gameoverblackbox',1,2)

        makeAnimatedLuaSprite('dead', 'characters/'..Assets.character.name, defaultBoyfriendX - 20, defaultBoyfriendY + 350);
        addAnimationByPrefix('dead', 'idle', Assets.character.idle, 24, false);
        addAnimationByPrefix('dead', 'loop', Assets.character.loop, 24, false);
        addAnimationByPrefix('dead', 'confirm', Assets.character.confirm, 24, false);
        addOffset('dead','loop',0,-6)
        addOffset('dead','confirm',0,58)
        playAnim('dead','idle',true)
        addLuaSprite('dead',true)

        createBox('gameoverfadingblackbox',defaultBoyfriendX - 1500,defaultBoyfriendY - 1000,3000,3000,'000000',0,'camGame')

        playSound(Assets.sounds.loss,1,'losssfx')
        soundCallBack('losssfx',function()
            if not onLoop then
                onLoop = true
                playAnim('dead','loop',true)
                playSound(Assets.sounds.music,1,'gameoverSound')
                soundCallBack('gameoverSound',function()
                    playAnim('dead','loop',true)
                    playSound(Assets.sounds.music,1,'gameoverSound')
                    timer.beat.m = 0
                end)
            end
        end)

        unsetShader()
    end
end

function onCustomSubstateUpdate(tag,elapsed)
	if tag == 'death' then
        if keyboardJustPressed('ENTER') or keyboardJustPressed('ESCAPE') then
            if not onLoop then
                stopSound('losssfx')
                onLoop = true
                playAnim('dead','loop',true)
                playSound(Assets.sounds.music,1,'gameoverSound')
                soundCallBack('gameoverSound',function()
                    playAnim('dead','loop',true)
                    playSound(Assets.sounds.music,1,'gameoverSound')
                    timer.beat.m = 0
                end)
                onLoop = true
            elseif not debounce.confirm and keyboardJustPressed('ENTER') then
                stopSound('gameoverSound')
                playSound(Assets.sounds.confirm,1,'gameoverEndSound')
                playAnim('dead','confirm',true)
                isConFirm = true
                debounce.confirm = true
            elseif not debounce.confirm and keyboardJustPressed('ESCAPE') then
                isExit = true
                exitSong()
                setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
                stopSound('gameoverSound')
                debounce.confirm = true
            end
        end
        if onLoop and not (isConFirm or isExit) then
            runHaxeCode([[ gameOverSoundTime = game.modchartSounds.get('gameoverSound').time; game.setOnLuas('gameOverSoundTime',gameOverSoundTime); ]])
            local bps = 60/gameoverBPM
            timer.beat.t = (gameOverSoundTime / 1000) - timer.beat.m
            if timer.beat.t >= bps then
                --debugPrint('bop '..gameOverSoundTime / 1000)
                playAnim('dead','loop',true)
                timer.beat.m = (gameOverSoundTime / 1000)
            end
        elseif not onLoop then
            setProperty('cameraSpeed', 0.5)
            timer.startdelay.t = timer.startdelay.t + elapsed
            if timer.startdelay.t >= timer.startdelay.max then
                setProperty('camFollow.x',getGraphicMidpointX('boyfriend'))
                setProperty('camFollow.y',getGraphicMidpointY('boyfriend'))
            end
        elseif isConFirm then
            timer.confirm.time = timer.confirm.time + elapsed
            if timer.confirm.time >= timer.confirm.max then restartSong() end
            if timer.confirm.time >= timer.confirm.fadingdelaymax and not debounce.fading then
                doTweenAlpha('fadedsdsdssdd','gameoverfadingblackbox',1,2)
                debounce.fading = true
            end
        end

        zoomt = lerp(zoomt,1,elapsed * 2)
        setPropertyFromClass('flixel.FlxG','camera.zoom', zoomt)

        vol = lerp(vol,0,elapsed * 4)
        if not isExit then setPropertyFromClass('flixel.FlxG', 'sound.music.volume', vol); setProperty('camOther.alpha', vol) else setProperty('camOther.alpha', 1) end
        setProperty('vocals.volume', vol)
        setProperty('camHUD.alpha', vol)
    
        setProperty('persistentUpdate',true)
        setPropertyFromClass('Conductor', 'songPosition', freezedPos)
    end
end

local soundtbl = {}
function soundCallBack(name,func)
    table.insert(soundtbl,{name,func})
end

function onSoundFinished(tag)
    for i,v in ipairs(soundtbl) do
        if tag == v[1] then
            v[2]()
        end
    end
end