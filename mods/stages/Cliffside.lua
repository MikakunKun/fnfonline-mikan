function onCreate()
	-- background shit
	makeLuaSprite('Trueback', 'funkmon/Map14', -500, -500);
	setScrollFactor('Trueback', 0.4, 0.4);

	makeLuaSprite('pixel1', 'funkmon/MapPixel1', -540, -180);
	setScrollFactor('pixel1', 0, 0);

	makeLuaSprite('Back', 'funkmon/Map13', -500, -500);
	setScrollFactor('Back', 0.7, 0.7);

	makeLuaSprite('Mid', 'funkmon/Map12', -500, -500);
	setScrollFactor('Mid', 1, 1);

	makeLuaSprite('Front', 'funkmon/Map11',-500, -500);
	setScrollFactor('Front', 1.2, 1.2);

	addLuaSprite('Trueback', false);
	addLuaSprite('Back', false);
	addLuaSprite('Mid', false);
	addLuaSprite('Front', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end