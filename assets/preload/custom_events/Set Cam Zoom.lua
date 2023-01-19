function onEvent(name,value1,value2)
if value2 == '' then
    setProperty("defaultCamZoom",value1)
	else
    doTweenZoom('camGameZoom','camGame',tonumber(value1),tonumber(value2),'sineInOut')
	end
end

function onTweenCompleted(name)
    if name == 'camGameZoom' then
    setProperty("defaultCamZoom",getProperty('camGame.zoom'))
    end
end