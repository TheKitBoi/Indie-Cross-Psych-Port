function onCreate()
    makeAnimatedLuaSprite('AttackButton', 'Buttons', 67, 265)
    luaSpriteAddAnimationByPrefix('AttackButton', 'AttackClick', 'Attack Click instance', 24, false)
    luaSpriteAddAnimationByPrefix('AttackButton', 'AttackCooldown', 'AttackNA instance', 24, false)
    setObjectCamera('AttackButton', 'other');
    scaleObject('AttackButton', 0.5, 0.5);
    setProperty('AttackButton.alpha', 0.5)
    addLuaSprite('AttackButton', true)

    makeAnimatedLuaSprite('AttackCard', 'Cuphead/Cardcrap', 1000, 550)

 --   luaSpriteAddAnimationByPrefix('AttackCard', 'CardFilled', 'Card Filled instance', 24, false)
  --  luaSpriteAddAnimationByPrefix('AttackCard', 'CardNormalPop', 'Card Normal Pop out instance', 24, false)
    luaSpriteAddAnimationByPrefix('AttackCard', 'CardUsed', 'Card Used instance', 24, false)
    luaSpriteAddAnimationByPrefix('AttackCard', 'CardPopParry', 'PARRY Card Pop out', 24, false)

    setObjectCamera('AttackCard', 'other');
    scaleObject('AttackCard', 1, 1);
    addLuaSprite('AttackCard', true)
    setProperty('AttackCard.visible', false)

    makeAnimatedLuaSprite('bfAttack', 'Cuphead/BoyFriend_Rain', 550, 715)
    luaSpriteAddAnimationByPrefix('bfAttack', 'Attack', '0BF attack instance', 24, false)
    scaleObject('bfAttack', 0.55, 0.55)
    setScrollFactor('bfAttack', 1, 1);
    setObjectOrder('bfAttack','11')
    addLuaSprite('bfAttack', true)
    setProperty('bfAttack.visible', false)

    makeAnimatedLuaSprite('CupheadHit', 'characters/Cuphead Pissed', 465, 664)
    luaSpriteAddAnimationByPrefix('CupheadHit', 'Hit', 'Ouch instance', 24, false)
    addLuaSprite('CupheadHit', true)
    setProperty('CupheadHit.visible', false)

    -- peashooter and chaser
    makeAnimatedLuaSprite('PeashooterFlash', 'Cuphead/bull/Cupheadshoot', 800, 715)
    luaSpriteAddAnimationByPrefix('PeashooterFlash', 'Flash', 'BulletFlashFX instance', 24, true)
    scaleObject('PeashooterFlash', 0.55, 0.55)
    setScrollFactor('PeashooterFlash', 1, 1);
    addLuaSprite('PeashooterFlash', true)
    setProperty('PeashooterFlash.visible', false)

    makeAnimatedLuaSprite('Peashooter', 'Cuphead/bull/Cupheadshoot', 800, 510)
    luaSpriteAddAnimationByPrefix('Peashooter', 'Flash', 'BulletFX_H-Tween_03 instance', 72, true)
    scaleObject('Peashooter', 0.8, 0.8)
    setScrollFactor('Peashooter', 1, 1);
    addLuaSprite('Peashooter', true)
    setProperty('Peashooter.visible', false)

    makeAnimatedLuaSprite('Chaser', 'Cuphead/bull/GreenShit', 700, 700)
    luaSpriteAddAnimationByPrefix('Chaser', 'Shoot', 'GreenShit01 instance', 100, false)
    scaleObject('Chaser', 0.75, 0.75)
    setScrollFactor('Chaser', 1, 1);
    addLuaSprite('Chaser', true)
    --setProperty('Chaser.visible', false)

    precacheImage('AttackButton')
    precacheImage('AttackCard')
    precacheImage('bfAttack')
    precacheImage('CupheadHit')
    precacheImage('PeashooterFlash')
    precacheImage('Peashooter')
end

chaserAttack = false
chaserAttackDrain = false
function opponentNoteHit() 

   health = getProperty('health')

   if chaserAttack == true then
        objectPlayAnimation('Chaser', 'Shoot', true)
        setProperty('Chaser.visible', true)
        chaserAttackDrain = true
   end

   if chaserAttackDrain == true then
        setProperty('health', health- 0.02);
   else

   end

end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Parry Note' then
            hasHitParryNote = true
            playSound('sounds/parry', 1)
            setProperty('AttackCard.visible', true)
            objectPlayAnimation('AttackCard', 'CardPopParry', true)
	end
end

function onBeatHit()
	if curBeat % 2 == 1 then
		doTweenY('ChaserUp', 'Chaser', 650, 0.3, 'linear')
    else
        doTweenY('ChaserDown', 'Chaser', 700, 0.3, 'linear')
	end
end

canAttack = false

function onUpdate()
    if canAttack == true then
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') then
            canAttack = false
            luaSpritePlayAnimation('AttackButton', 'AttackClick', false)
            objectPlayAnimation('AttackCard', 'CardUsed', true)
            runTimer('StartCooldown', 0.1)
            hasHitParryNote = false
            CupheadAttackingB = false

            setProperty('boyfriend.visible', false)
            setProperty('bfAttack.visible', true)
            objectPlayAnimation('bfAttack', 'Attack', true)

            runTimer('cupHitStart', 0.5)
            runTimer('bfAnimStop', 1.5)

            if chaserAttack == true then
                CupheadAttackingA = false
                chaserAttackDrain = false
            end
        end
    else
        -- nothing lol, cant do anything with shift!
    end

    if CooldownHasEnded and hasHitParryNote == true then
        canAttack = true
    else
        canAttack = false
    end
end

CooldownHasEnded = true

function onTimerCompleted(timerEnd)
    if timerEnd == 'StartCooldown' then
        CooldownHasEnded = false
        luaSpritePlayAnimation('AttackButton', 'AttackCooldown', true)
        setProperty('AttackButton.y', 240)
        runTimer('CooldownEnd', 5.5)
    end

    if timerEnd == 'CooldownEnd' then
        CooldownHasEnded = true
        luaSpritePlayAnimation('AttackButton', 'AttackClick', false)
        setProperty('AttackButton.y', 265)
    end

    if timerEnd == 'bfAnimStop' then
        setProperty('boyfriend.visible', true)
        setProperty('bfAttack.visible', false)
    end

    if timerEnd == 'cupheadAnimStop' then
        setProperty('dad.visible', true)
        setProperty('CupheadHit.visible', false)
    end

    if timerEnd == 'cupHitStart' then
        setProperty('dad.visible', false)
        setProperty('CupheadHit.visible', true)
        objectPlayAnimation('CupheadHit', 'Hit', true)
        runTimer('cupheadAnimStop', 1.25)
        playSound('Cuphead/mugmandeath', 0.6)
    end
end

CupheadAttackingB = false
function onStepHit()
    if curStep == 308 then
        CupheadAttackingB = true
    end

    if curStep == 724 then
        CupheadAttackingB = true
    end

    if curStep == 822 then
        CupheadAttackingB = true
    end

    if curStep == 1285 then
        CupheadAttackingB = true
    end

    if curStep == 1414 then
        CupheadAttackingB = true
    end

    -- chaser
    if curStep == 272 then
        chaserAttack = true
    end

    if curStep == 656 then
        chaserAttack = true
    end

    if curStep == 783 then
        chaserAttack = true
    end

    if curStep == 847 then
        chaserAttack = true
    end

    if curStep == 880 then
        chaserAttack = true
    end

    if curStep == 912 then
        chaserAttack = false
        chaserAttackDrain = false
    end

    health = getProperty('health')

    if CupheadAttackingB == true then
        CupheadAttackingStopped = false
        CupheadAttackingA = false
        chaserAttack = false
        chaserAttackDrain = false
        triggerEvent('Alt Idle Animation', 'dad','-alt')
        setProperty('PeashooterFlash.visible', true)
        setProperty('Peashooter.visible', true)
        setProperty('health', health- 0.082);
        playSound('Cuphead/pea0', 0.4)
    else
        triggerEvent('Alt Idle Animation', 'dad','')
        setProperty('PeashooterFlash.visible', false)
        setProperty('Peashooter.visible', false)
    end

    if CupheadAttackingA == false then
        setProperty('Chaser.visible', false)
    end
end