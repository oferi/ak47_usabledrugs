-- ox_inventory usable drugs server-side
local ox_inventory = exports.ox_inventory

-- Register usable items with ox_inventory
for itemName, _ in pairs(Config.Items) do
    ox_inventory:RegisterUsableItem(itemName, function(source, item)
        local player = source
        if not player then return end
        
        -- Trigger the appropriate client event based on the item
        if itemName == 'weed_pooch' then
            TriggerClientEvent('ak47_druglabs:useWeed', player, item)
        elseif itemName == 'coke_pooch' then
            TriggerClientEvent('ak47_druglabs:useCoke', player, item)
        elseif itemName == 'spice_pooch' then
            TriggerClientEvent('ak47_druglabs:useSpice', player, item)
        elseif itemName == 'lean_bottle' then
            TriggerClientEvent('ak47_druglabs:useLean', player, item)
        elseif itemName == 'double_cup' then
            TriggerClientEvent('ak47_druglabs:useDoubleCup', player, item)
        elseif itemName == 'xpills' then
            TriggerClientEvent('ak47_druglabs:useXPills', player, item)
        elseif itemName == 'heroin_shot' then
            TriggerClientEvent('ak47_druglabs:useHeroin', player, item)
        elseif itemName == 'meth_pooch' then
            TriggerClientEvent('ak47_druglabs:useMeth', player, item)
        end
        
        -- Remove the item from inventory
        ox_inventory:RemoveItem(player, itemName, 1)
    end)
end

-- Server-side effects handler
RegisterNetEvent('ak47_druglabs:applyEffects', function(drugType)
    local player = source
    if not player then return end
    
    local ped = GetPlayerPed(player)
    if not ped then return end
    
    -- Apply drug effects based on type
    if drugType == 'weed' then
        -- Weed effects
        SetPedArmour(ped, GetPedArmour(ped) + Config.Weed.armour)
    elseif drugType == 'coke' then
        -- Coke effects
        SetPedArmour(ped, GetPedArmour(ped) + Config.Coke.armour)
    elseif drugType == 'spice' then
        -- Spice effects
        SetPedArmour(ped, GetPedArmour(ped) + Config.Spice.armour1)
    elseif drugType == 'xpills' then
        -- X Pills effects
        SetPedArmour(ped, GetPedArmour(ped) + Config.xPill.armour)
    elseif drugType == 'heroin' then
        -- Heroin effects
        SetPedArmour(ped, GetPedArmour(ped) + Config.Heroin.armour)
    elseif drugType == 'meth' then
        -- Meth effects
        SetPedArmour(ped, GetPedArmour(ped) + Config.Meth.armour)
    end
end)

-- Notification system
RegisterNetEvent('ak47_druglabs:notify', function(message, type)
    local player = source
    if not player then return end
    
    TriggerClientEvent('ak47_druglabs:showNotification', player, message, type or 'inform')
end)