function onCreate()
	precacheImage('funkmon/Dark BG');
	precacheImage('funkmon/Closed Heart art');
	precacheImage('funkmon/Closed Heart text warning');
	-- background shit
	makeLuaSprite('Back', 'funkmon/Map33', -500, -500);
	setScrollFactor('Back', 0.8, 0.8);

	makeLuaSprite('Mid', 'funkmon/Map32', -500, -500);
	setScrollFactor('Mid', 1, 1);

	makeLuaSprite('Front', 'funkmon/Map31',-500, -500);
	setScrollFactor('Front', 0, 0);

	addLuaSprite('Back', false);
	addLuaSprite('Mid', false);
	addLuaSprite('Front', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end