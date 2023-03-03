function onCreate()

    Dodged = false;
    canDodge = false;

    precacheImage('funkmon/warning');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
        characterPlayAnim('dad', 'attack', true);
        setProperty('dad.specialAnim', true);
        makeLuaSprite('warning', 'funkmon/warning', 527, 400);
        addLuaSprite('warning', true);
	setObjectCamera('warning', 'other');
        doTweenAlpha('warningAlpha', 'warning', 0, 0.3, 'linear');
	
        canDodge = true;
	runTimer('Died', 0.87);
	runTimer('flash', 0.4);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('space') then
   
	Dodged = true;
   	canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   removeLuaSprite('warning', true);
   characterPlayAnim('boyfriend', 'hurt', true);
   setProperty('boyfriend.specialAnim', true);
   health = getProperty('health')
   setProperty('health', health - 0.55);
   
   elseif tag == 'Died' and Dodged == true then
   removeLuaSprite('warning', true);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   Dodged = false

   elseif tag == 'flash' then
        removeLuaSprite('warning', true);
        makeLuaSprite('warning', 'warning', 527, 400);
        addLuaSprite('warning', true);
	setObjectCamera('warning', 'other');
        doTweenAlpha('warningAlpha', 'warning', 0, 0.3, 'linear');



   end
end