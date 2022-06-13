function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Parry note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_parry'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes')
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end
	