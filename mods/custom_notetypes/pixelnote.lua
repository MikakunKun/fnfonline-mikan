function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'pixelnote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'red/NOTE_assets'); --Change texture
		end
	end
end