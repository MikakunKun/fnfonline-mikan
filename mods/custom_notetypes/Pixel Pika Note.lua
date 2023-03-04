function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pixel Pika Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'vsred/flechassssssss'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.4'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	if (noteType == 'Pixel Pika Note') then
		playSound('Thunder',1)
	end
end