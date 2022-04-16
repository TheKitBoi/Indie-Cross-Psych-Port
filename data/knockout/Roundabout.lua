function onCreate()
    makeAnimatedLuaSprite('Roundabout', 'Cuphead/bull/Roundabout', 350, 620)
    luaSpriteAddAnimationByPrefix('Roundabout', 'Bullet', 'Roundabout instance 1', 24, true)
    setProperty('Roundabout.alpha', 0)
    addLuaSprite('Roundabout', true)
end

bfdodge = false;
bfcandodge = false
Roundabout = false;

function onBeatHit()
	if curBeat % 2 == 1 then
		doTweenY('RoundaboutUp', 'Roundabout', 600, 0.3, 'linear')
    else
        doTweenY('RoundaboutDown', 'Roundabout', 700, 0.3, 'linear')
	end
end

function onStepHit()
    if curStep == 602 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', true)
        bfcandodge = true
        runTimer('RoundaboutHit', 1)
        runTimer('RoundaboutStart', 0.24)
    end

    if curStep == 911 then
        setProperty('dad.visible', false)
        setProperty('CupheadShoot.visible', true)
        luaSpritePlayAnimation('CupheadShoot', 'Shoot', true)
        bfcandodge = true
        runTimer('RoundaboutHit', 1)
        runTimer('RoundaboutStart', 0.24)
    end
    
    if Roundabout == true then
        doTweenAlpha('RoundaboutAlpha', 'Roundabout', 0.825, 0.2, 'linear');
        setObjectOrder('Roundabout', '3');
        doTweenX('RoundaboutTween', 'Roundabout', 1700, 1, 'linear')
    end
end

function onTimerCompleted(timerEnd)
    if timerEnd == 'RoundaboutHit' then
        if bfdodge == true then
            bfcandodge = false
            Roundabout = false
            runTimer('RoundaboutReset', 1)
            setProperty('dad.visible', true)
            setProperty('CupheadShoot.visible', false)
        else
            setProperty('health', getProperty('health') - 2)
        end
    end

    if timerEnd == 'RoundaboutHitLoop' then
        if bfdodge == true then
            bfcandodge = false
            Roundabout = false
            setProperty('dad.visible', true)
            setProperty('CupheadShoot.visible', false)
        else
            setProperty('health', getProperty('health') - 2)
        end
    end

    if timerEnd == 'RoundaboutReset' then
        bfdodge = false
        bfcandodge = true
        doTweenX('RoundaboutTween2', 'Roundabout', -1055, 2, 'linear')
        setObjectOrder('Roundabout', '20');
        runTimer('RoundaboutHitLoop', 0.4)
        runTimer('RoundaboutStop', 2.1)
    end

    if timerEnd == 'RoundaboutStart' then
        bfdodge = false
        Roundabout = true
    end
    if timerEnd == 'RoundaboutStop' then
        bfdodge = false
        bfcandodge = false
        doTweenAlpha('RoundaboutAlpha2', 'Roundabout', 0, 0.2, 'linear');
        doTweenX('RoundaboutTween2', 'Roundabout', 355, 1, 'linear')
    end
end

function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        if bfcandodge == true then
            bfdodge = true
            characterPlayAnim('boyfriend', 'dodge', true);
            setProperty('boyfriend.specialAnim', true);
            playSound('Cuphead/dodge', 1)
        end
    end
end