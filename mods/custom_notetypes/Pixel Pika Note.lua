function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pixel Pika Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'red/flechassssssss'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.4'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end

	makeAnimatedLuaSprite('pixelpikachu', 'red/pixelpikachu', 1300, 300)
	setProperty('pixelpikachu.x', 1300)
	setProperty('pixelpikachu.y', 300)
	setProperty('pixelpikachu.scale.x', getProperty('pixelpikachu.scale.x') * 0.7)
	setProperty('pixelpikachu.scale.y', getProperty('pixelpikachu.scale.y') * 0.7)
	addAnimationByPrefix('pixelpikachu', 'idle', "pikachu idle instancia 1", 24, true) 
	objectPlayAnimation('pixelpikachu','idle');
	setProperty('pixelpikachu.antialiasing', false)
	setProperty('pixelpikachu.visible', false)
	addLuaSprite('pixelpikachu', true)
end

function onEvent(eventName, value1, value2)
	if (eventName == 'Change Character') then
		if (value2 == 'pixel-bf-pokemon-master') then
			setProperty('pixelpikachu.visible', true)
		end
		if (value2 == 'bf-pokemon-master') then
			setProperty('pixelpikachu.visible', false)
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
	if (noteType == 'Pixel Pika Note') then
		playSound('Thunder',1)
	end
end