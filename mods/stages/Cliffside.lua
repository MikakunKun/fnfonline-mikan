function onCreate()
	precacheImage('funkmon/warning');
	precacheImage('funkmon/Dark BG');
	precacheImage('funkmon/Eevee art');
	precacheImage('funkmon/funkmon/white screen');

	precacheImage('funkmon/Level up text warning');
	precacheImage('funkmon/Encounter text warning');
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

function sus()
	if curStep >= yourStep - 28 and curStep <= myStep - 28 then
        for i = 0, getProperty('notes.length')-1 do
		    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Swift Note' then
			    setPropertyFromGroup('unspawnNotes', i, 'texture', 'funkmon/Swift_Note_Pixel_assets');
		    	    setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'funkmon/Swift_Splash_Pixel_assets');
			else
		        setPropertyFromGroup('unspawnNotes', i, 'texture', 'funkmon/PIXELNOTE_assets');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'funkmon/PIXELnoteSplashes');
			end
        end
	end

	if curStep >= myStep - 16 and curStep <= myStep - 38 then
        for i = 0, getProperty('notes.length')-1 do
		    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Swift Note' then
			    setPropertyFromGroup('unspawnNotes', i, 'texture', 'funkmon/Swift_Note_assets');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'funkmon/Swift_Splash_assets');
			else
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes');
			end
        end
	end	
end