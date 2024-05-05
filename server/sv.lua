if Config.UseOldEsx then
    ESX = nil
    
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
    
        ESX.PlayerData = ESX.GetPlayerData()
    end)
else
    ESX = exports["es_extended"]:getSharedObject()
end



local items = Config.Items

RegisterNetEvent('n-npcRob:server:robNpc', function(entityId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemIndex = math.random(1, #items)
    local itemName = items[itemIndex].itemName
    local itemAmount = math.random(items[itemIndex].itemRandomAmount[1], items[itemIndex].itemRandomAmount[2])

    if xPlayer then
        xPlayer.addInventoryItem(itemName, itemAmount)
    end
end)



RegisterNetEvent('n-npcRob:server:policeAlert', function (pos)
	TriggerClientEvent('n-npcRob:client:policeAlert', -1, pos)
end)