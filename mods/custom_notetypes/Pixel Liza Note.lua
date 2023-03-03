function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pixel Liza Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'red/fuegopixelnotes'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.4'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.4'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end

	makeAnimatedLuaSprite('pixelchadizard', 'red/pixelcharizard', 800, 0)
	setProperty('pixelchadizard.x', 800)
	setProperty('pixelchadizard.y', 0)
	setProperty('pixelchadizard.scale.x', getProperty('pixelchadizard.scale.x') * 0.7)
	setProperty('pixelchadizard.scale.y', getProperty('pixelchadizard.scale.y') * 0.7)
	addAnimationByPrefix('pixelchadizard', 'idle', 'chariidle instancia 1', 24, true)
	objectPlayAnimation('pixelchadizard','idle');
	setProperty('pixelchadizard.antialiasing', false)
	setProperty('pixelchadizard.visible', false)
	addLuaSprite('pixelchadizard', false)
end

function onEvent(eventName, value1, value2)
	if (eventName == 'Change Character') then
		if (value2 == 'pixel-bf-pokemon-master') then
			setProperty('pixelchadizard.visible', true)
		end
		if (value2 == 'bf-pokemon-master') then
			setProperty('pixelchadizard.visible', false)
		end
	end
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	flame(noteType)
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
	flame(noteType)
end

function flame(noteType)
	if (noteType == 'Pixel Liza Note') then
		playSound('Flame',1)
	end
end