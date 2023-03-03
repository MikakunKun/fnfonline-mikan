local space = false;
local seenCutscene = false;

function onStartCountdown()
	if not seenCutscene and not allowCountdown then
		makeLuaSprite('dark', 'funkmon/Dark BG', 0, 0);
		addLuaSprite('dark', true);
		makeLuaSprite('art', 'funkmon/Closed Heart art', 0, 1000);
		addLuaSprite('art', true);
		makeLuaSprite('text', 'funkmon/Closed Heart text warning', 0, 400);
		addLuaSprite('text', true);
		setObjectCamera('text', 'other');
		setObjectCamera('art', 'other');
		setObjectCamera('dark', 'other');
		doTweenY('textwarning', 'text', 0, .5, 'quartout');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end



function onTweenCompleted(tag)

	if tag == 'textwarning' then
		doTweenY('artwarning', 'art', 0, .5, 'quartout');
		space = true;
	end



	if tag == 'artbye' then
		removeLuaSprite('art', true);
		removeLuaSprite('text', true);
		removeLuaSprite('dark', true);
		startCountdown();
	end

end

function onUpdate()
	if space == true then
		if keyJustPressed('space') or keyJustPressed('accept') then
			playSound('confirmMenu', 0.5);
			doTweenY('textbye', 'text', 400, .5, 'quartin');
			doTweenY('artbye', 'art', -1000, .5, 'quartin');
			doTweenAlpha('darkbye', 'dark', 0, 0.5, 'linear');
			space = false;
		end
	end
end


