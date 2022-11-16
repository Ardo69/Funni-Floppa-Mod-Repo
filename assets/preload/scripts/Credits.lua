-- Credits Script made by --
---       Skry#4271      ---
---- Like if Like

enabled = true -- Set to true or false



--------1 Song Stuff -------------
coderUser = 'Plank and Ardo' -- if its only this team then put this
composerUser = 'Plank'
artistUser = 'Plank and Ardo'
charterUser = 'Plank' 
--------------------------------
--------Colors-----------------
mainColor =  '222222' -- Big Box Color
secondaryColor = '000000' -- Lines Color
SecondaryColor2 = 'FFFFFF' -- Text Color 
------------------------------------
-------Speed and time---------------
speedthing = 1 --Speed Of it
timething = 2.5 --Timer
--------------------------------------
----------ease-----------------------
ease = 'expoOut' -- best ease expoOut
----------------------------------------
------------Misc-------------------------
stephit = false -- if disabled then will function onSongStart
stephitnum = 0

thinlines = true
































function onCreate()
 if enabled == true then
      -- BIG BOX --
    makeLuaSprite('bigBox', 'BigBOX',  700, 1300)
    makeGraphic("bigBox", 500, 1300, mainColor)
    setObjectCamera('bigBox', 'other')
    setProperty('bigBox.alpha', 0.8)
    setProperty('bigBox.x',  380)
    setProperty('bigBox.y', -1300)
    addLuaSprite('bigBox', true)
    
      -- LINES FOR BIG BOX --
  if thinlines ~= true then
    ---LEFT---
    makeLuaSprite('lineLeft', 'lineLeft',  50, 1300)
    makeGraphic("lineLeft", 40, 1300, secondaryColor)
    setObjectCamera('lineLeft', 'other')
    setProperty('lineLeft.alpha', 0.85)
    setProperty('lineLeft.y', -1300)
    setProperty('lineLeft.x', 348)
    addLuaSprite('lineLeft', true)
       ---RIGHT--- 
    makeLuaSprite('lineRight', 'lineRight',  50, 1300)
    makeGraphic("lineRight", 40, 1300, secondaryColor)
    setObjectCamera('lineRight', 'other')
    setProperty('lineRight.alpha', 0.85)
    setProperty('lineRight.y', -1300)
    setProperty('lineRight.x', 875)
    addLuaSprite('lineRight', true)
  end
  if thinlines == true then
    ---LEFT---
    makeLuaSprite('lineLeft', 'lineLeft',  50, 1300)
    makeGraphic("lineLeft", 25, 1300, secondaryColor)
    setObjectCamera('lineLeft', 'other')
    setProperty('lineLeft.alpha', 0.85)
    setProperty('lineLeft.y', -1300)
    setProperty('lineLeft.x', 375)
    addLuaSprite('lineLeft', true)
       ---RIGHT--- 
    makeLuaSprite('lineRight', 'lineRight',  50, 1300)
    makeGraphic("lineRight", 25, 1300, secondaryColor)
    setObjectCamera('lineRight', 'other')
    setProperty('lineRight.alpha', 0.85)
    setProperty('lineRight.y', -1300)
    setProperty('lineRight.x', 875)
    addLuaSprite('lineRight', true)
  end
       ---LINES---
    makeLuaText("CREDITSthing", "CREDITS", 1000, 0, -1000)
    makeLuaText("CODERthing", "CODER", 1000, 0, -1000)
    makeLuaText("COMPOSERthing", "COMPOSER", 1000, 0, -1000)
    makeLuaText("ARTISTthing", "ARTIST", 1000, 0, -1000)
    makeLuaText("CHARTERthing", "CHARTER", 1000, 0, -1000)
    addLuaText('CREDITSthing')
    addLuaText('CODERthing')
    addLuaText('COMPOSERthing')
    addLuaText('ARTISTthing')
    addLuaText('CHARTERthing')
      --above notes--
    setObjectCamera('CREDITSthing', 'other')
    setObjectCamera('CODERthing', 'other')
    setObjectCamera('COMPOSERthing', 'other')
    setObjectCamera('ARTISTthing', 'other')
    setObjectCamera('CHARTERthing', 'other')
    setObjectCamera('CREDITS', 'other')
    setObjectCamera('CODER', 'other')
    setObjectCamera('COMPOSER', 'other')
    setObjectCamera('ARTIST', 'other')
    setObjectCamera('CHARTER', 'other')





        -- CODER --
    makeLuaText("CODER", coderUser, 1000, 0, -1000)
    setObjectCamera('CODER', 'other')
    addLuaText('CODER')

        -- COMPOSER --
    makeLuaText("COMPOSER", composerUser, 1000, 0, -1000)
    setObjectCamera('COMPOSER', 'other')
    addLuaText('COMPOSER')

        -- ARTIST --
    makeLuaText("ARTIST", artistUser, 1000, 0, -1000)
    setObjectCamera('ARTIST', 'other')
    addLuaText('ARTIST')

         -- CHARTER --
    makeLuaText("CHARTER", charterUser, 1000, 0, -1000)
    setObjectCamera('CHARTER', 'other')
    addLuaText('CHARTER')

         -- COLORS --
    setTextColor('CREDITSthing', SecondaryColor2)
    setTextColor('CODERthing', SecondaryColor2)
    setTextColor('COMPOSERthing', SecondaryColor2)
    setTextColor('ARTISTthing', SecondaryColor2)
    setTextColor('CHARTERthing', SecondaryColor2)
    setTextColor('CODER', SecondaryColor2)
    setTextColor('COMPOSER', SecondaryColor2)
    setTextColor('ARTIST', SecondaryColor2)
    setTextColor('CHARTER', SecondaryColor2)
    

         -- largen --
     
    setTextSize('CREDITSthing', 35)
    setTextSize('CODERthing', 30)
    setTextSize('COMPOSERthing', 30)
    setTextSize('ARTISTthing', 30)
    setTextSize('CHARTERthing', 30)
    setTextSize('CODER', 35)
    setTextSize('COMPOSER', 35)
    setTextSize('ARTIST', 35)
    setTextSize('CHARTER', 35)

            -- texttAlignment --
         setProperty('CREDITSthing.x', 135)
         setProperty('CODERthing.x', 135)
         setProperty('COMPOSERthing.x', 135)
         setProperty('ARTISTthing.x', 135)
         setProperty('CHARTERthing.x', 135)
         setProperty('CREDITS.x', 135)
         setProperty('CODER.x', 135)
         setProperty('COMPOSER.x', 135)
         setProperty('ARTIST.x', 135)
         setProperty('CHARTER.x', 135)
         ---icons---
       if icons == true then
         makeLuaSprite('cod1', codericon, 135, -130)
         makeLuaSprite('cha1', chartericon, 135, -130)
         makeLuaSprite('art1', artisticon, 135, -130)
         makeLuaSprite('com1', composericon, 135, -130)
       end


 
 end
end
     
     
function onSongStart()
  if enabled == true then
    if stephit == false then
    runTimer('ByeBye', timething)

    doTweenY("A", "bigBox", 0, speedthing, ease)
    doTweenY('B', 'CREDITSthing', 0, speedthing, ease)
	  doTweenY('C', 'CODERthing', 185, speedthing, ease)
    doTweenY('D', 'CODER', 150, speedthing, ease)
  	doTweenY('E', 'COMPOSERthing', 315, speedthing, ease)
    doTweenY('F', 'COMPOSER', 280, speedthing, ease)
	  doTweenY('G', 'ARTISTthing', 445, speedthing, ease)
	  doTweenY('H', 'ARTIST', 410, speedthing, ease)
	  doTweenY('I', 'CHARTERthing', 595, speedthing, ease)
    doTweenY('J', 'CHARTER', 560, speedthing, ease)
    doTweenY('K', 'lineLeft', 0, speedthing, ease)
    doTweenY('L', 'lineRight', 0, speedthing, ease)
    end
  end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ByeBye' then
        doTweenY("M", "bigBox", -1300, speedthing, ease)
        doTweenY('N', 'CREDITSthing', -1300, speedthing, ease)
        doTweenY('O', 'CODERthing', -1300, speedthing, ease)
        doTweenY('P', 'CODER', -1300, speedthing, ease)
        doTweenY('Q', 'COMPOSERthing', -1300, speedthing, ease)
        doTweenY('R', 'COMPOSER', -1300, speedthing, ease)
        doTweenY('S', 'ARTISTthing', -1300, speedthing, ease)
        doTweenY('T', 'ARTIST', -1300, speedthing, ease)
        doTweenY('U', 'CHARTERthing', -1300, speedthing, ease)
        doTweenY('V', 'CHARTER', -1300, speedthing, ease)
        doTweenY('W', 'lineLeft', -1300, speedthing, ease)
        doTweenY('X', 'lineRight', -1300, speedthing, ease)
    end
end


if stephit == true then
  function onStepHit()
    if curStep == stephitnum then
      runTimer('ByeBye', timething)

      doTweenY("A", "bigBox", 0, speedthing, ease)
      doTweenY('B', 'CREDITSthing', 0, speedthing, ease)
      doTweenY('C', 'CODERthing', 185, speedthing, ease)
      doTweenY('D', 'CODER', 150, speedthing, ease)
      doTweenY('E', 'COMPOSERthing', 315, speedthing, ease)
      doTweenY('F', 'COMPOSER', 280, speedthing, ease)
      doTweenY('G', 'ARTISTthing', 445, speedthing, ease)
      doTweenY('H', 'ARTIST', 410, speedthing, ease)
      doTweenY('I', 'CHARTERthing', 595, speedthing, ease)
      doTweenY('J', 'CHARTER', 560, speedthing, ease)
      doTweenY('K', 'lineLeft', 0, speedthing, ease)
      doTweenY('L', 'lineRight', 0, speedthing, ease)
  
    end
  end
end
function onTweenCompleted(tag)
  if tag == 'X' then
    removeLuaSprite('bigBox', true)
    removeLuaSprite('lineLeft', true)
    removeLuaSprite('lineRight', true)
    removeLuaText('CREDITSthing', true)
    removeLuaText('CODERthing', true)
    removeLuaText('CODER', true)
    removeLuaText('COMPOSERthing', true)
    removeLuaText('COMPOSER', true)
    removeLuaText('ARTISTthing', true)
    removeLuaText('ARTIST', true)
    removeLuaText('CHARTERthing', true)
    removeLuaText('CHARTER', true)

  end
end