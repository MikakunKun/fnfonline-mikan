function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Liza Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'red/LIZANOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.4'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.4'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		end
	end

	makeAnimatedLuaSprite('chadizard', 'red/charizard', 650, -250)
	setProperty('chadizard.x', 650)
	setProperty('chadizard.y', -250)
	setProperty('chadizard.scale.x', getProperty('chadizard.scale.x') * 0.7)
	setProperty('chadizard.scale.y', getProperty('chadizard.scale.y') * 0.7)
	addAnimationByPrefix('chadizard', 'idle', 'chari idle', 24, false) 
	addAnimationByPrefix('chadizard', 'atack', 'charizard atack', 24, false)
	setProperty('chadizard.antialiasing', true)
	setProperty('chadizard.visible', true)
	addLuaSprite('chadizard', false)
end

function onEvent(eventName, value1, value2)
	if (eventName == 'Change Character') then
		if (value2 == 'pixel-bf-pokemon-master') then
			setProperty('chadizard.visible', false)
		end
		if (value2 == 'bf-pokemon-master') then
			setProperty('chadizard.visible', true)
		end
	end
end

function onBeatHit()
	if ((curBeat % 2) == 0) then
		-- if not (getProperty('chadizard.animation.curAnim.name') ~= 'idle' and not getProperty('chadizard.animation.curAnim.finished')) then
		if not (not getProperty('chadizard.animation.curAnim.finished')) then
			objectPlayAnimation('chadizard','idle');
		end
	end
end

function onUpdatePost(elapsed)
	if getProperty('chadizard.animation.curAnim.name') == 'idle' then
		setProperty('chadizard.offset.x',0)
		setProperty('chadizard.offset.y',0)
		
	
	elseif getProperty('chadizard.animation.curAnim.name') == 'atack' then
		setProperty('chadizard.offset.x',300)
		setProperty('chadizard.offset.y',30)
	end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	flame(noteType)
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
	flame(noteType)
end

function flame(noteType)
	if (noteType == 'Liza Note') then
		objectPlayAnimation('chadizard','atack');
		playSound('Flame',1)
	end
end