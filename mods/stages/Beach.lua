function onCreate()
	-- background stuff

	makeLuaSprite('BeachSky', 'veefunkin/BeachSky', -1600, -200);
        addLuaSprite('BeachSky', false)

	makeLuaSprite('Land', 'veefunkin/Land', 500, 600);
        addLuaSprite('Land', false)

        makeAnimatedLuaSprite('BeachOcean', 'veefunkin/BeachOcean', -1500, 650)
	addAnimationByPrefix('BeachOcean','BeachOcean','BeachOcean', 24, true)
        addLuaSprite('BeachOcean',false);
	objectPlayAnimation('BeachOcean', 'BeachOcean', true);


        makeAnimatedLuaSprite('Sylveon Beach', 'veefunkin/Sylveon Beach', 1700, 600)
	addAnimationByPrefix('Sylveon Beach','Sylveon Beach','Sylveon Beach', 24, true)
        addLuaSprite('Sylveon Beach',false);

	makeLuaSprite('BeachForeground', 'veefunkin/BeachForeground', -1000, 600);
        addLuaSprite('BeachForeground', false)

        setLuaSpriteScrollFactor('Sylveon Beach', 1.1, 1);
        setLuaSpriteScrollFactor('BeachSky', 1.25, 1);
        setLuaSpriteScrollFactor('Land', 1.1, 1);
	setLuaSpriteScrollFactor('BeachForeground', 1, 1);
        setLuaSpriteScrollFactor('BeachOcean', 1.1, 1);

end
function onBeatHit()
	objectPlayAnimation('Sylveon Beach', 'Sylveon Beach', true);

end