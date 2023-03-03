function onCreate()
	-- background stuff

	makeLuaSprite('Snowysky', 'veefunkin/Snowysky', -850, -300);
        addLuaSprite('Snowysky', false)

	makeLuaSprite('Snowystuff', 'veefunkin/Snowystuff', -800, 100);
        addLuaSprite('Snowystuff', false)

	makeLuaSprite('Snowyfloor', 'veefunkin/Snowyfloor', -1300, 800);
        addLuaSprite('Snowyfloor', false)

	setLuaSpriteScrollFactor('Snowyfloor', 1, 1);
        setLuaSpriteScrollFactor('Snowystuff', 1.1, 1);
        setLuaSpriteScrollFactor('Snowysky', 1.25, 1);

end