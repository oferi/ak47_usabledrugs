-- ox_inventory usable drugs client-side loader

-- Initialize the resource
Citizen.CreateThread(function()
    -- Wait for the resource to fully start
    Wait(1000)
    
    -- Check if ox_inventory is available
    if not GetResourceState('ox_inventory') == 'started' then
        print('^1[ERROR] ox_inventory is required for ak47_usabledrugs to work!^0')
        return
    end
    
    print('^2[INFO] ak47_usabledrugs loaded successfully with ox_inventory support^0')
end)

-- Animation state tracking (moved to editable.lua)

-- Function to play drug use animation
function PlayDrugAnimation(animDict, animName, duration)
    if IsAnimated then return false end
    
    IsAnimated = true
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end
    
    TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, duration, 0, 0, false, false, false)
    
    Citizen.CreateThread(function()
        Wait(duration)
        IsAnimated = false
        ClearPedTasks(PlayerPedId())
    end)
    
    return true
end

-- Function to apply screen effects
function ApplyScreenEffect(effectName, duration)
    Citizen.CreateThread(function()
        StartScreenEffect(effectName, 0, true)
        Wait(duration)
        StopScreenEffect(effectName)
    end)
end

-- Function to apply time cycle modifier
function ApplyTimeCycleModifier(modifier, strength, duration)
    Citizen.CreateThread(function()
        SetTimecycleModifier(modifier)
        SetTimecycleModifierStrength(strength)
        Wait(duration)
        ClearTimecycleModifier()
    end)
end

-- Function to apply screen shake
function ApplyScreenShake(intensity, duration)
    Citizen.CreateThread(function()
        local startTime = GetGameTimer()
        while GetGameTimer() - startTime < duration do
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', intensity)
            Wait(100)
        end
        StopGameplayCamShaking(true)
    end)
end