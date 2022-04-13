function onCreate()
--RANGO 1 Partes que no consuman muchos recurso o lo esencial.
	makeLuaSprite('cielo', 'Cuphead/angry/CH-RN-00', 0, 0);
    setLuaSpriteScrollFactor('cielo', 0.5, 0.5);
	scaleObject('cielo', 2.0, 2.0);

	makeLuaSprite('bosque', 'Cuphead/angry/CH-RN-01', -90, 150);
    setLuaSpriteScrollFactor('bosque', 1.3, 1.3);
	setLuaSpriteScrollFactor('bosque', 0.99, 0.99);
	scaleObject('bosque', 2.0, 2.0);

	makeLuaSprite('piso', 'Cuphead/angry/CH-RN-02', 0, 0);
	scaleObject('piso', 2.0, 2.0);
	setLuaSpriteScrollFactor('piso', 0.99, 0.99);

	makeAnimatedLuaSprite('lluvia', 'Cuphead/angry/NewRAINLayer01', 0, 0);

    setLuaSpriteScrollFactor('lluvia', 0.9, 0.9);

	scaleObject('lluvia', 1.0, 1.0);

	makeAnimatedLuaSprite('lluvia2', 'Cuphead/angry/NewRAINLayer02', 0, 0);

    setLuaSpriteScrollFactor('lluvia2', 0.9, 0.9);

	scaleObject('lluvia2', 1.0, 1.0);

--RANGO3 Va a leer en orden y podras usar el setObjectOrder para ponerlo encima de girfriend.

    addLuaSprite('cielo', false);
    addLuaSprite('bosque', false);
    addLuaSprite('piso', false);
    addAnimationByPrefix('lluvia', 'idle', 'RainFirstlayer instance 1', '24', true);
    setObjectOrder('lluvia', '6');
    addAnimationByPrefix('lluvia2', 'idle', 'RainFirstlayer instance 1', '24', true);
    setObjectOrder('lluvia2', '7');


    -- hadouken

    makeAnimatedLuaSprite('Bullet', 'Cuphead/bull/Cuphead Hadoken', 350, 620)
    luaSpriteAddAnimationByPrefix('Bullet', 'Bullet', 'Hadolen instance 1', 24, true)
    luaSpriteAddAnimationByPrefix('Bullet', 'Burst', 'BurstFX instance 1', 24, false)
    addLuaSprite('Bullet', true)
    scaleObject('Bullet', 0.55, 0.55)
    setProperty('Bullet.alpha', 0)
end

function onCreatePost()
	if not downscroll then
        setProperty('healthBarBG.visible', false);
        makeLuaSprite('cupheadhealthbar', 'Cuphead/cuphealthbar', 0, 625);
        addLuaSprite('cupheadhealthbar', true);
        screenCenter('cupheadhealthbar', 'x');
        setObjectCamera('cupheadhealthbar', 'camHUD');
        setObjectOrder('cupheadhealthbar', getObjectOrder('healthBar') + 1);
        scaleObject('healthBar', 1, 2.5);
        setProperty('healthBar.y', getProperty('healthBar.y') - 1);
        setProperty('iconP1.y', 575)
    else
        setProperty('healthBarBG.visible', false);
        makeLuaSprite('cupheadhealthbar', 'Cuphead/cuphealthbar', 0, 65);
        addLuaSprite('cupheadhealthbar', true);
        screenCenter('cupheadhealthbar', 'x');
        setObjectCamera('cupheadhealthbar', 'camHUD');
        setObjectOrder('cupheadhealthbar', getObjectOrder('healthBar') + 1);
        scaleObject('healthBar', 1, 2.5);
        setProperty('healthBar.y', getProperty('healthBar.y') - 1);
        setProperty('iconP1.y', 10)
    end

    setProperty('scoreTxt.visible', true)
    setProperty('timeBar.color', getColorFromHex('ffffff'))
    setProperty('timeTxt.color', getColorFromHex('ffffff'))
    setProperty('scoreTxt.color', getColorFromHex('ffffff'))

    setTextFont('scoreTxt','Cuphead.ttf')
    setTextFont('timeTxt','Cuphead.ttf')
end

local xx = 700; -- Code to change the position of the camera to the left or right for your opponent, Less = Left (They can be negative numbers), More = Right
local yy = 700; -- Code to change the position of the camera up or down for the enemy Less = Down (They can be negative numbers), More = Up
local xx2 = 1250; -- Same code as above, but for boyfriend left, right
local yy2 = 700; -- Same code as above, but for boyfriend up, down
local xx3 = 520; -- Same code as above, but for girlfriend left, right
local yy3 = 450; -- Same code as above, but for girlfriend, up, down
local ofs = 50; -- Code to adjust the intensity with which the camera moves, the more numbers, the more intense, and the fewer numbers, less intense
local followchars = true; -- This code is necessary for the script to work, don't even think about deleting it!
local del = 0;
local del2 = 0;


function onUpdate() -- The Main Code
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then -- Code for the camera to follow the poses of your opponent
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if gfSection == true then -- The camera follows GF when she sings, only when the "GF Section" option in the chart editor is activated. 
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then -- Credits to Serebeat and company for their Slaybells mod,
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)              -- That's where I got the gf code from.
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
				end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        else
                 -- Code for the camera to follow the poses of boyfriend
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- Self explanatory
    end
end

function onStepHit()
    if curStep == 1048 then
        doTweenZoom('oh boy', 'camGame', 1.25, 13.5, 'quadOut')
    end

    if curStep == 1176 then
        cameraShake('hud', 0.05, 0.05)
        doTweenZoom('oh boy lol', 'camGame', 2, 0.2, 'quadOut')
        triggerEvent('Camera Follow Pos', '1200', '700')
    end

    if curStep == 1208 then
        doTweenZoom('oh boy3', 'camGame', 1.6, 0.2, 'quadOut')
    end

    if curStep == 1168 then
        doTweenZoom('oh boy4', 'camGame', 1, 0.5, 'backOut')
    end

    if curStep == 1264 then
        doTweenZoom('oh they are mad', 'camGame', 1.6, 2, 'quadOut')
    end

    if curStep == 1328 then
        doTweenZoom('oh they are mad', 'camGame', 1.6, 2, 'backOut')
    end

    if curStep == 1375 then
        doTweenZoom('oh they are mad', 'camGame', 1.6, 0.2, 'bounceOut')
    end

    if curStep == 1378 then
        doTweenZoom('oh they are mad', 'camGame', 1, 0.2, 'bounceOut')
    end

    if curStep == 1384 then
        doTweenZoom('oh they are mad2', 'camGame', 1.6, 0.2, 'bounceOut')
    end

    if curStep == 1386 then
        doTweenZoom('oh they are mad2', 'camGame', 1, 0.2, 'bounceOut')
    end

    if curStep == 1392 then
        doTweenZoom('oh they are mad2', 'camGame', 1.5, 0.5, 'backOut')
    end

    

    if curStep == 1439 then
        doTweenZoom('oh they are mad', 'camGame', 1.6, 0.2, 'bounceOut')
    end

    if curStep == 1443 then
        doTweenZoom('oh they are mad', 'camGame', 1, 0.2, 'bounceOut')
    end

    if curStep == 1448 then
        doTweenZoom('oh they are mad2', 'camGame', 1.6, 0.2, 'bounceOut')
    end

    if curStep == 1451 then
        doTweenZoom('oh they are mad2', 'camGame', 1, 0.2, 'bounceOut')
    end

    if curStep == 1455 then
        doTweenZoom('oh they are mad2', 'camGame', 1.5, 0.5, 'backOut')
    end

    if curStep == 1472 then
        doTweenZoom('oh they are mad3', 'camGame', 1.5, 6.5, 'quadInOut')
    end

    if curStep == 1520 then
        doTweenZoom('oh they are mad3', 'camGame', 0.9, 1, 'cubicOut')
    end

    if curStep == 1551 then
        doTweenZoom('oh they are mad4', 'camGame', 1.25, 1, 'cubicOut')
    end

    if curStep == 1568 then
        doTweenZoom('oh they are mad 4', 'camGame', 1.25, 1, 'cubicOut')
    end

    if curStep == 1584 then
        doTweenZoom('oh they are mad 5', 'camGame', 1.5, 5, 'bounceOut')
    end

    if curStep == 1600 then
        doTweenZoom('oh they are mad 5', 'camGame', 1, 1, 'bounceOut')
    end
end
