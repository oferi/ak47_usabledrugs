print('^2[INFO] ak47_usabledrugs client script starting...^0')

-- Animation state tracking (moved from loader.lua)
IsAnimated = false

function isPlayerDead()
    return IsEntityDead(GetPlayerPed(-1))
end

function showNotification(text, eType, time)
	local message = text
	if eType == 'error' then
		message = '~r~'..message
	elseif eType == 'inform' then
		message = '~y~'..message
	elseif eType == 'success' then
		message = '~g~'..message
	end
	ShowNotificationDefault(message)
end

RegisterNetEvent('ak47_druglabs:showNotification')
AddEventHandler('ak47_druglabs:showNotification', function(text, eType, time)
    showNotification(text, eType, time)
end)

function ShowNotificationDefault(msg)
    SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName(msg)
	DrawNotification(false, true)
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

-- Drug usage events for ox_inventory
RegisterNetEvent('ak47_druglabs:useWeed')
AddEventHandler('ak47_druglabs:useWeed', function(item)
    print('^2[DEBUG] Client received weed event^0')
    if not IsAnimated then
        print('^3[DEBUG] Applying weed effects^0')
        TriggerServerEvent('ak47_druglabs:applyEffects', 'weed')
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['weed_use'], 'Weed Pooch', Config.Weed.time), 'success')
        -- Add any additional client-side effects here
    else
        print('^1[DEBUG] Player is already animated, skipping weed effects^0')
    end
end)

RegisterNetEvent('ak47_druglabs:useCoke')
AddEventHandler('ak47_druglabs:useCoke', function(item)
    if not IsAnimated then
        TriggerServerEvent('ak47_druglabs:applyEffects', 'coke')
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['coke_use'], 'Coke Pooch', Config.Coke.time), 'success')
        -- Add any additional client-side effects here
    end
end)

RegisterNetEvent('ak47_druglabs:useSpice')
AddEventHandler('ak47_druglabs:useSpice', function(item)
    if not IsAnimated then
        TriggerServerEvent('ak47_druglabs:applyEffects', 'spice')
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['spice_use'], 'Spice Pooch', Config.Spice.time), 'success')
        -- Add any additional client-side effects here
    end
end)

RegisterNetEvent('ak47_druglabs:useLean')
AddEventHandler('ak47_druglabs:useLean', function(item)
    if not IsAnimated then
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['lean_use'], 'Lean Bottle', Config.Lean.time), 'success')
        -- Add any additional client-side effects here
    end
end)

RegisterNetEvent('ak47_druglabs:useDoubleCup')
AddEventHandler('ak47_druglabs:useDoubleCup', function(item)
    if not IsAnimated then
        TriggerServerEvent('ak47_druglabs:applyEffects', 'double_cup')
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['double_use'], 'Double Cup', Config.DoubleCup.time), 'success')
        -- Add any additional client-side effects here
    end
end)

RegisterNetEvent('ak47_druglabs:useXPills')
AddEventHandler('ak47_druglabs:useXPills', function(item)
    if not IsAnimated then
        TriggerServerEvent('ak47_druglabs:applyEffects', 'xpills')
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['xpills_use'], 'X Pills', Config.xPill.time, Config.xPill.runSpeed), 'success')
        -- Add any additional client-side effects here
    end
end)

RegisterNetEvent('ak47_druglabs:useHeroin')
AddEventHandler('ak47_druglabs:useHeroin', function(item)
    if not IsAnimated then
        TriggerServerEvent('ak47_druglabs:applyEffects', 'heroin')
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['heroin_use'], 'Heroin Shot', Config.Heroin.time, Config.Heroin.runSpeed), 'success')
        -- Add any additional client-side effects here
    end
end)

RegisterNetEvent('ak47_druglabs:useMeth')
AddEventHandler('ak47_druglabs:useMeth', function(item)
    if not IsAnimated then
        TriggerServerEvent('ak47_druglabs:applyEffects', 'meth')
        TriggerServerEvent('ak47_druglabs:notify', string.format(Locales['meth_use'], 'Meth Pooch', Config.Meth.time), 'success')
        -- Add any additional client-side effects here
    end
end)

-- Debug command to reset animation state
RegisterCommand('resetdrugs', function()
    IsAnimated = false
    print('^2[DEBUG] Animation state reset^0')
end, false)