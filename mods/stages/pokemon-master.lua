local pixel = false
local keybindshow = false
local death = false
function onCreate()
	makeLuaSprite('PokemonhealthBar', 'vsred/healthBar', -25, 510);
	if (downscroll) then
		setProperty('PokemonhealthBar.x', -25)
		setProperty('PokemonhealthBar.y', 510)
	else
		setProperty('PokemonhealthBar.x', 250)
		setProperty('PokemonhealthBar.y', 470)
	end
	setObjectCamera('PokemonhealthBar', 'camhud')
	setProperty('PokemonhealthBar.scale.x', 0.4)
	setProperty('PokemonhealthBar.scale.y', 0.4)
	addLuaSprite('PokemonhealthBar', true)

	-- Normal curStage
	makeLuaSprite('redbg', 'vsred/fondo_pokemon_1', 0, 0);
	setProperty('redbg.x', 0)
	setProperty('redbg.y', 0)
	setProperty('redbg.antialiasing', true)
	setProperty('redbg.active', false)
	setProperty('redbg.scale.x', 1.2)
	setProperty('redbg.scale.y', 1.2)
	addLuaSprite('redbg', false)
	
	makeAnimatedLuaSprite('chadizard', 'vsred/charizard', 650, -250)
	setProperty('chadizard.x', 650)
	setProperty('chadizard.y', -250)
	setProperty('chadizard.scale.x', getProperty('chadizard.scale.x') * 0.7)
	setProperty('chadizard.scale.y', getProperty('chadizard.scale.y') * 0.7)
	addAnimationByPrefix('chadizard', 'idle', 'chari idle', 24, false) 
	addAnimationByPrefix('chadizard', 'atack', 'charizard atack', 24, false)
	setProperty('chadizard.antialiasing', true)
	setProperty('chadizard.visible', true)
	addLuaSprite('chadizard', false)

	makeAnimatedLuaSprite('pikachu', 'vsred/pikachu', 1300, 200)
	setProperty('pikachu.x', 1300)
	setProperty('pikachu.y', 200)
	setProperty('pikachu.scale.x', getProperty('pikachu.scale.x') * 0.7)
	setProperty('pikachu.scale.y', getProperty('pikachu.scale.y') * 0.7)
	addAnimationByPrefix('pikachu', 'idle', 'PIKACHU IDLE', 24, false) 
	addAnimationByPrefix('pikachu', 'atack', 'pikaatack', 24, false)
	setProperty('pikachu.antialiasing', true)
	setProperty('pikachu.visible', true)
	addLuaSprite('pikachu', true)
	
	-- Pixel Stage
	makeLuaSprite('pixelbg', 'vsred/fondo_pokemon_2', 0, 0);
	setProperty('pixelbg.x', 0)
	setProperty('pixelbg.y', 0)
	setProperty('pixelbg.antialiasing', true)
	setProperty('pixelbg.active', false)
	setProperty('pixelbg.scale.x', 1.2)
	setProperty('pixelbg.scale.y', 1.2)
	setProperty('pixelbg.visible', false)
	addLuaSprite('pixelbg', false)

	makeAnimatedLuaSprite('pixelchadizard', 'vsred/pixelcharizard', 800, 0)
	setProperty('pixelchadizard.x', 800)
	setProperty('pixelchadizard.y', 0)
	setProperty('pixelchadizard.scale.x', getProperty('pixelchadizard.scale.x') * 0.7)
	setProperty('pixelchadizard.scale.y', getProperty('pixelchadizard.scale.y') * 0.7)
	addAnimationByPrefix('pixelchadizard', 'idle', 'chariidle instancia 1', 24, true)
	objectPlayAnimation('pixelchadizard','idle');
	setProperty('pixelchadizard.antialiasing', false)
	setProperty('pixelchadizard.visible', false)
	addLuaSprite('pixelchadizard', false)

	makeAnimatedLuaSprite('pixelpikachu', 'vsred/pixelpikachu', 1300, 300)
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
function onStartCountdown()
	if (getPropertyFromClass('ClientPrefs', 'showKeybindsOnStart') == true) then
		keybindshow = true
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', false)
	else
		keybindshow = false
	end
end

function onPause()
	if keybindshow then
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', true)
		keybindshow = false
	end
end

function onEndSong()
	if keybindshow then
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', true)
		keybindshow = false
	end
end

function onCountdownStarted()
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
end

function onCreatePost()
	addHaxeLibrary('FlxRect', 'flixel.math');
	addHaxeLibrary('Note');

	setHealth(2)
	setCharacterX('boyfriend', 70)
	setCharacterY('boyfriend', 570)

	setCharacterX('dad', 1130)
	setCharacterY('dad', -150)

	setProperty('boyfriend.scale.x', 1.3)
	setProperty('boyfriend.scale.y', 1.3)

	setProperty('dad.scale.x', 0.8)
	setProperty('dad.scale.y', 0.8)
end

function onEvent(eventName, value1, value2)
	if (eventName == 'Change Character') then
		if (value2 == 'pixel-bf-pokemon-master') then
			for i=0,mania do
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'vsred/NOTE_assets'); --Change texture
				runHaxeCode([[
					game.strumLineNotes.members[]]..i..[[].reloadNote();
				]])
			end
			pixel = true
			setProperty('defaultCamZoom', 0.9);
			setCharacterX('boyfriend', 170)
			setCharacterY('boyfriend', 500)

			setProperty('boyfriend.scale.x', 1)
			setProperty('boyfriend.scale.y', 1)

			setProperty('redbg.visible', false)
			setProperty('chadizard.visible', false)
			setProperty('pikachu.visible', false)

			setProperty('pixelbg.visible', true)
			setProperty('pixelchadizard.visible', true)
			setProperty('pixelpikachu.visible', true)
		end
		if (value2 == 'bf-pokemon-master') then
			for i=0,mania do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets'); --Change texture
				setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets'); --Change texture
				runHaxeCode([[
					game.opponentStrums.members[]]..i..[[].reloadNote();
					game.playerStrums.members[]]..i..[[].reloadNote();
				]])
			end
			pixel = false
			setProperty('defaultCamZoom', 0.7);
			setProperty('boyfriend.scale.x', 1.3)
			setProperty('boyfriend.scale.y', 1.3)
			setCharacterX('boyfriend', 70)
			setCharacterY('boyfriend', 570)

			setProperty('redbg.visible', true)
			setProperty('chadizard.visible', true)
			setProperty('pikachu.visible', true)

			setProperty('pixelbg.visible', false)
			setProperty('pixelchadizard.visible', false)
			setProperty('pixelpikachu.visible', false)
		end
		if (value2 == 'pixel-red-pokemon-master') then
			setCharacterX('dad', 1130)
			setCharacterY('dad', -50)

			setProperty('dad.scale.x', 0.8)
			setProperty('dad.scale.y', 0.8)
		end
		if (value2 == 'red-pokemon-master') then
			setCharacterX('dad', 1130)
			setCharacterY('dad', -150)

			setProperty('dad.scale.x', 0.8)
			setProperty('dad.scale.y', 0.8)
		end
	end
end

function onUpdate(elapsed)
	if not death then
		if mustHitSection == false then
			if (not pixel) then
				setProperty('camFollow.y', getMidpointY('dad') + 230)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			else
				setProperty('camFollow.y', getMidpointY('dad') + 120)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			end
		end
		if mustHitSection == true then
			if (not pixel) then
				setProperty('camFollow.y', getMidpointY('dad') + 230)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			else
				setProperty('camFollow.y', getMidpointY('dad') + 120)
				setProperty('camFollow.x', getMidpointX('dad') - 500)
			end
		end
	end
	setProperty('healthBarBG.visible', false)

	setHealthBarColors('FF0000', '66FF33')
	setProperty('healthBar.scale.x', 0.4)
	setProperty('healthBar.scale.y', 0.4)

	setProperty('healthBar.x', getProperty('PokemonhealthBar.x') + 223)
	setProperty('healthBar.y', getProperty('PokemonhealthBar.y') + 86)
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
	NoteHit(noteType)
end

function NoteHit(noteType)
	if (noteType == 'Pika Note') then
		objectPlayAnimation('pikachu','atack');
	end
	if (noteType == 'Liza Note') then
		objectPlayAnimation('chadizard','atack');
	end
	setHealth(getHealth()-0.023)
end

function onGameOver()
	death = true
	if keybindshow then
		setPropertyFromClass('ClientPrefs', 'showKeybindsOnStart', true)
		keybindshow = false
	end
	setProperty('camFollow.y', getMidpointY('boyfriend') - 100)
	setProperty('camFollow.x', getMidpointX('boyfriend') - 100)
end