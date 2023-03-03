function onCreate()
	-- background shit
	makeLuaSprite('Trueback', 'funkmon/Map14', -500, -500);
	setScrollFactor('Trueback', 0.3, 0.3);

	makeLuaSprite('Back', 'funkmon/Map13', -500, -500);
	setScrollFactor('Back', 0.6, 0.6);

	makeLuaSprite('Semiback', 'funkmon/Map42', -500, -500);
	setScrollFactor('Mid', 0.9, 0.9);

	makeLuaSprite('Mid', 'funkmon/Map41', -500, -500);
	setScrollFactor('Mid', 1, 1);

	makeLuaSprite('Front', 'funkmon/Map40',-500, -500);
	setScrollFactor('Front', 1.1, 1.1);

	addLuaSprite('Trueback', false);
	addLuaSprite('Back', false);
	addLuaSprite('Semiback', false);
	addLuaSprite('Mid', false);
	addLuaSprite('Front', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end