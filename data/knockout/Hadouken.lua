function onCreate()
    makeAnimatedLuaSprite('Hadouken', 'Cuphead/bull/Cuphead Hadoken', 350, 620)
    luaSpriteAddAnimationByPrefix('Hadouken', 'Bullet', 'Hadolen instance 1', 24, true)
    luaSpriteAddAnimationByPrefix('Hadouken', 'Burst', 'BurstFX instance 1', 24, false)
    scaleObject('Hadouken', 0.55, 0.55)
    setScrollFactor('Hadouken', 1, 1);
    setObjectOrder('Hadouken','11')
    setProperty('Hadouken.alpha', 0)
    addLuaSprite('Hadouken', true)

    makeAnimatedLuaSprite('CupheadShoot', 'characters/Cuphead Pissed', 320, 490)
    luaSpriteAddAnimationByPrefix('CupheadShoot', 'Shoot', 'Hadoken!! instance', 24, false)
    luaSpriteAddAnimationByPrefix('CupheadShoot', 'Realization', 'Phase 2 starts', 24, false)

    makeAnimatedLuaSprite('Knockout', 'Cuphead/knock', 300, 220)
    luaSpriteAddAnimationByPrefix('Knockout', 'Knockout', 'A KNOCKOUT!', 24, false)
    setObjectCamera('Knockout', 'other');
    scaleObject('Knockout', 0.65, 0.65);
    setProperty('Knockout.visible', false)
    addLuaSprite('Knockout', true)

    makeAnimatedLuaSprite('DodgeButton', 'Buttons', 65, 355)
    luaSpriteAddAnimationByPrefix('DodgeButton', 'DodgeIdle', 'Dodge instance', 24, false)
    luaSpriteAddAnimationByPrefix('DodgeButton', 'DodgeClick', 'Dodge click instance', 24, false)
    setObjectCamera('DodgeButton', 'other');
    scaleObject('DodgeButton', 0.5, 0.5);
    setProperty('DodgeButton.alpha', 0.5)
    addLuaSprite('DodgeButton', true)

    scaleObject('CupheadShoot', 1, 1)
    setProperty('CupheadShoot.visible', false)
    addLuaSprite('CupheadShoot', true)

    makeAnimatedLuaSprite('Mugman', 'Cuphead/Mugman Fucking dies', 1300, 725)
    luaSpriteAddAnimationByPrefix('Mugman', 'deat', 'Mugman instance', 24, false)
    luaSpriteAddAnimationByPrefix('Mugman', 'deat2', 'MUGMANDEAD YES instance', 24, false)
    setScrollFactor('Mugman', 1, 1);
    scaleObject('Mugman', 0.55, 0.55)
    setObjectOrder('Mugman','10')

    addLuaSprite('Mugman', true)
    setProperty('Mugman.visible', false)

end

bfdodge = false;
bfcandodge = false
hadouken = false;

function onStepHit()
    if curStep == 142 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', true)
        bfcandodge = true
        runTimer('HadoukenHit', 0.65)
        runTimer('HadoukenStart', 0.24)
    end

    if curStep == 397 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', true)
        bfcandodge = true
        runTimer('HadoukenHit', 0.65)
        runTimer('HadoukenStart', 0.24)
    end

    if curStep == 500 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', true)
        bfcandodge = true
        runTimer('HadoukenHit', 0.65)
        runTimer('HadoukenStart', 0.24)
    end

    if curStep == 646 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', true)
        bfcandodge = true
        runTimer('HadoukenHit', 0.65)
        runTimer('HadoukenStart', 0.24)
    end

    if curStep == 771 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', false)
        bfcandodge = true
        runTimer('HadoukenHit', 0.65)
        runTimer('HadoukenStart', 0.24)
    end

    -- MUGMAN DIES PART
    if curStep == 1157 then
        setProperty('Mugman.visible', true)
        objectPlayAnimation('Mugman', 'deat', true)
    end

    if curStep == 1176 then
        objectPlayAnimation('Hadouken', 'Burst', false)
        setProperty('Hadouken.y', 500)
        setProperty('Knockout.visible', true)
    end
    if curStep == 1177 then 
        objectPlayAnimation('Knockout', 'Knockout')
        objectPlayAnimation('Mugman', 'deat2', true) 
        playSound('Cuphead/mugmandeath', 1)  
        playSound('Cuphead/knockout', 1)    
    end

    if curStep == 1190 then
        setProperty('Hadouken.y', 620)
        objectPlayAnimation('Hadouken', 'Bullet', false)
    end

    if curStep == 1168 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Realization', false)
        setProperty('CupheadShoot.y', 680)
        setProperty('CupheadShoot.x', 550)
        bfcandodge = true
        runTimer('HadoukenPhase2', 0.65)
        runTimer('HadoukenStart', 0.24)
    end

    if curStep == 1193 then
        setProperty('dad.visible', true)
        setProperty('CupheadShoot.visible', false)
        doTweenAlpha('KnockoutFade', 'Knockout', '0', '2.5', 'backOut')
    end
    -- MUGMAN DIES PART

    if curStep == 1597 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', false)
        setProperty('CupheadShoot.y', 490)
        setProperty('CupheadShoot.x', 320)
        bfcandodge = true
        runTimer('HadoukenPhase2', 0.65)
        runTimer('HadoukenStart', 0.24)
    end

    if hadouken == true then
        doTweenAlpha('HadoukenAlpha', 'Hadouken', 1, 0.2, 'linear');
        doTweenX('HadoukenTween', 'Hadouken', 2400, 2, 'linear')
    end
end

function onTimerCompleted(timerEnd)
    if timerEnd == 'HadoukenHit' then
        if bfdodge == true then
            bfcandodge = false
            hadouken = false
            runTimer('HadoukenReset', 1)
            setProperty('dad.visible', true)
            setProperty('CupheadShoot.visible', false)
            objectPlayAnimation('DodgeButton', 'DodgeIdle', true)
        else
            setProperty('health', getProperty('health') - 2)
        end
    end

    if timerEnd == 'HadoukenPhase2' then
        if bfdodge == true then
            bfcandodge = false
            hadouken = false
            objectPlayAnimation('DodgeButton', 'DodgeIdle', true)
            runTimer('HadoukenReset', 1)
        else
            setProperty('health', getProperty('health') - 2)
        end
    end
    if timerEnd == 'HadoukenReset' then
        doTweenAlpha('HadoukenAlpha2', 'Hadouken', 0, 0.2, 'linear');
        doTweenX('HadoukenTween2', 'Hadouken', 355, 1, 'linear')
    end

    if timerEnd == 'HadoukenStart' then
        hadouken = true
    end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        if bfcandodge == true then
            bfdodge = true
            characterPlayAnim('boyfriend', 'dodge', true);
            luaSpritePlayAnimation('DodgeButton', 'DodgeClick', false)
            setProperty('boyfriend.specialAnim', true);
            playSound('Cuphead/dodge', 1)
        end
    end
end
