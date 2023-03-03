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

			setProperty('pixelbg.visible', true)
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

			setProperty('pixelbg.visible', false)
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

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
	NoteHit(noteType)
end

function NoteHit(noteType)
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