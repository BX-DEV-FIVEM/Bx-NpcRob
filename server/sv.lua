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


ESX.RegisterServerCallback('BX-NpcRob:amount', function(source,cb)
	local xPlayers = ESX.GetPlayers()
	local cops = 0
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])	
		if xPlayer.job.name == Config.PoliceJobName then
			cops = cops + 1
		end
	end
	if cops >= Config.MinimumCops then
		cb(false)
	else
		cb(true)
	end
end)

local items = Config.Items

RegisterNetEvent('BX-NpcRob:server:robNpc', function(entityId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemIndex = math.random(1, #items)
    local itemName = items[itemIndex].itemName
    local itemAmount = math.random(items[itemIndex].itemRandomAmount[1], items[itemIndex].itemRandomAmount[2])

    if xPlayer then
        xPlayer.addInventoryItem(itemName, itemAmount)
    end
end)



RegisterNetEvent('BX-NpcRob:server:policeAlert', function (pos)
	TriggerClientEvent('BX-NpcRob:client:policeAlert', -1, pos)
end)



