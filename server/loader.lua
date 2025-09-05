-- ox_inventory usable drugs server-side
local ox_inventory = exports.ox_inventory

-- Register usable items with ox_inventory
for itemName, _ in pairs(Config.Items) do
    ox_inventory:RegisterUsableItem(itemName, function(source, item)
        local player = source
        if not player then return end
        
        print('^2[DEBUG] Player ' .. player .. ' used item: ' .. itemName .. '^0')
        
        -- Trigger the appropriate client event based on the item
        if itemName == 'weed_pooch' then
            print('^3[DEBUG] Triggering weed event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useWeed', player, item)
        elseif itemName == 'coke_pooch' then
            print('^3[DEBUG] Triggering coke event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useCoke', player, item)
        elseif itemName == 'spice_pooch' then
            print('^3[DEBUG] Triggering spice event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useSpice', player, item)
        elseif itemName == 'lean_bottle' then
            print('^3[DEBUG] Triggering lean event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useLean', player, item)
        elseif itemName == 'double_cup' then
            print('^3[DEBUG] Triggering double cup event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useDoubleCup', player, item)
        elseif itemName == 'xpills' then
            print('^3[DEBUG] Triggering xpills event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useXPills', player, item)
        elseif itemName == 'heroin_shot' then
            print('^3[DEBUG] Triggering heroin event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useHeroin', player, item)
        elseif itemName == 'meth_pooch' then
            print('^3[DEBUG] Triggering meth event for player ' .. player .. '^0')
            TriggerClientEvent('ak47_druglabs:useMeth', player, item)
        end
        
        -- Remove the item from inventory
        ox_inventory:RemoveItem(player, itemName, 1)
        print('^2[DEBUG] Item ' .. itemName .. ' removed from player ' .. player .. '^0')
    end)
end

-- Server-side effects handler
RegisterNetEvent('ak47_druglabs:applyEffects', function(drugType)
    local player = source
    if not player then return end
    
    print('^2[DEBUG] Applying effects for drug type: ' .. drugType .. ' to player ' .. player .. '^0')
    
    local ped = GetPlayerPed(player)
    if not ped then 
        print('^1[DEBUG] Could not get player ped for player ' .. player .. '^0')
        return 
    end
    
    -- Apply drug effects based on type
    if drugType == 'weed' then
        -- Weed effects
        local currentArmor = GetPedArmour(ped)
        SetPedArmour(ped, currentArmor + Config.Weed.armour)
        print('^3[DEBUG] Applied weed effects - Armor: ' .. currentArmor .. ' -> ' .. (currentArmor + Config.Weed.armour) .. '^0')
    elseif drugType == 'coke' then
        -- Coke effects
        local currentArmor = GetPedArmour(ped)
        SetPedArmour(ped, currentArmor + Config.Coke.armour)
        print('^3[DEBUG] Applied coke effects - Armor: ' .. currentArmor .. ' -> ' .. (currentArmor + Config.Coke.armour) .. '^0')
    elseif drugType == 'spice' then
        -- Spice effects
        local currentArmor = GetPedArmour(ped)
        SetPedArmour(ped, currentArmor + Config.Spice.armour1)
        print('^3[DEBUG] Applied spice effects - Armor: ' .. currentArmor .. ' -> ' .. (currentArmor + Config.Spice.armour1) .. '^0')
    elseif drugType == 'xpills' then
        -- X Pills effects
        local currentArmor = GetPedArmour(ped)
        SetPedArmour(ped, currentArmor + Config.xPill.armour)
        print('^3[DEBUG] Applied xpills effects - Armor: ' .. currentArmor .. ' -> ' .. (currentArmor + Config.xPill.armour) .. '^0')
    elseif drugType == 'heroin' then
        -- Heroin effects
        local currentArmor = GetPedArmour(ped)
        SetPedArmour(ped, currentArmor + Config.Heroin.armour)
        print('^3[DEBUG] Applied heroin effects - Armor: ' .. currentArmor .. ' -> ' .. (currentArmor + Config.Heroin.armour) .. '^0')
    elseif drugType == 'meth' then
        -- Meth effects
        local currentArmor = GetPedArmour(ped)
        SetPedArmour(ped, currentArmor + Config.Meth.armour)
        print('^3[DEBUG] Applied meth effects - Armor: ' .. currentArmor .. ' -> ' .. (currentArmor + Config.Meth.armour) .. '^0')
    end
end)

-- Notification system
RegisterNetEvent('ak47_druglabs:notify', function(message, type)
    local player = source
    if not player then return end
    
    print('^2[DEBUG] Sending notification to player ' .. player .. ': ' .. message .. '^0')
    TriggerClientEvent('ak47_druglabs:showNotification', player, message, type or 'inform')
end)