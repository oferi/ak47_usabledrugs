-- Test script for ak47_usabledrugs
-- This script can be used to test if the drug system is working correctly
-- Add this to your server.cfg temporarily for testing: ensure test_drugs

-- Test command to give drugs to player
RegisterCommand('testdrugs', function(source, args, rawCommand)
    local player = source
    if not player then return end
    
    -- Give one of each drug type for testing
    local ox_inventory = exports.ox_inventory
    
    ox_inventory:AddItem(player, 'weed_pooch', 1)
    ox_inventory:AddItem(player, 'coke_pooch', 1)
    ox_inventory:AddItem(player, 'spice_pooch', 1)
    ox_inventory:AddItem(player, 'lean_bottle', 1)
    ox_inventory:AddItem(player, 'double_cup', 1)
    ox_inventory:AddItem(player, 'xpills', 1)
    ox_inventory:AddItem(player, 'heroin_shot', 1)
    ox_inventory:AddItem(player, 'meth_pooch', 1)
    
    TriggerClientEvent('ak47_druglabs:showNotification', player, 'Test drugs added to inventory!', 'success')
end, false)

-- Test command to check if resource is loaded
RegisterCommand('checkdrugs', function(source, args, rawCommand)
    local player = source
    if not player then return end
    
    local ox_inventory = exports.ox_inventory
    if ox_inventory then
        TriggerClientEvent('ak47_druglabs:showNotification', player, 'ox_inventory is available and working!', 'success')
    else
        TriggerClientEvent('ak47_druglabs:showNotification', player, 'ox_inventory is NOT available!', 'error')
    end
end, false)

print('^2[INFO] Test script loaded for ak47_usabledrugs^0')
print('^3[INFO] Use /testdrugs to add test drugs^0')
print('^3[INFO] Use /checkdrugs to verify ox_inventory^0')
