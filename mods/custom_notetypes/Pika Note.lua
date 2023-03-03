function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pika Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'red/PIKANOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.4'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.4'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end

	makeAnimatedLuaSprite('pikachu', 'red/pikachu', 1300, 200)
	setProperty('pikachu.x', 1300)
	setProperty('pikachu.y', 200)
	setProperty('pikachu.scale.x', getProperty('pikachu.scale.x') * 0.7)
	setProperty('pikachu.scale.y', getProperty('pikachu.scale.y') * 0.7)
	addAnimationByPrefix('pikachu', 'idle', 'PIKACHU IDLE', 24, false) 
	addAnimationByPrefix('pikachu', 'atack', 'pikaatack', 24, false)
	setProperty('pikachu.antialiasing', true)
	setProperty('pikachu.visible', true)
	addLuaSprite('pikachu', true)
end

function onEvent(eventName, value1, value2)
	if (eventName == 'Change Character') then
		if (value2 == 'pixel-bf-pokemon-master') then
			setProperty('pikachu.visible', false)
		end
		if (value2 == 'bf-pokemon-master') then
			setProperty('pikachu.visible', true)
		end
	end
end

function onBeatHit()
	if ((curBeat % 2) == 0) then
		-- if not (getProperty('pikachu.animation.curAnim.name') ~= 'idle' and not getProperty('pikachu.animation.curAnim.finished')) then
		if not (not getProperty('pikachu.animation.curAnim.finished')) then
			objectPlayAnimation('pikachu','idle');
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
	if (noteType == 'Pika Note') then
		objectPlayAnimation('pikachu','atack');
		playSound('Thunder',1)
	end
end