function onCreate()
	-- background stuff

	makeLuaSprite('Floor', 'veefunkin/Snacks/Floor', -850, -300);
        addLuaSprite('Floor', false)

	makeLuaSprite('Wall', 'veefunkin/Snacks/Wall', -850, -300);
        addLuaSprite('Wall', false)

	makeLuaSprite('What', 'veefunkin/Snacks/What', -650, 650);
        addLuaSprite('What', true)

	setLuaSpriteScrollFactor('Floor', 1.1, 1);
        setLuaSpriteScrollFactor('Wall', 1.1, 1);
        setLuaSpriteScrollFactor('What', 1.25, 1);

end