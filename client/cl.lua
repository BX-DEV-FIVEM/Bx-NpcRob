
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

ped = {}

local function policeAlert()
    local alertLuck = math.random(100)
    if alertLuck <= Config.PoliceAlertProbability then  -- Utilise la probabilité du Config
        TriggerServerEvent('n-npcRob:server:policeAlert', GetEntityCoords(PlayerPedId()))
    end    
end


local function isBlacklisted(model)
    return Config.BlacklistNpc[model] == true
end


function Notify(msg, typenotif)
    if Config.Notify == 'ox' then
        lib.notify({
            title = "",
            description = msg,
            type = typenotif  
        })
    elseif Config.Notify == 'okok' then
        exports['okokNotify']:Alert("", msg, 5000, typenotif)
    elseif Config.Notify == 'esx' then 
        ESX.ShowNotification(msg)
    end
end



exports.ox_target:addGlobalPed({
    {
        name = 'npc-rob',
        label = 'Racketter la personne',
        icon = 'fa-solid fa-male',
        canInteract = function(entity)
            local pedType = GetPedType(entity)
            local model = GetEntityModel(entity)
            return IsPedArmed(PlayerPedId(), 7) and (pedType == 4 or pedType == 5 or pedType == 6) and not isBlacklisted(model)
        end,
        canSelect = function(entity)
            return GetPedType(entity) == 28
        end, 
        onSelect = function(data)
            local chance = math.random(100)
            if ped[data.entity] then
                Notify(Strings['can_rob_npc_again'], 'error')
                return false
            end
        
            if IsPedArmed(PlayerPedId(), 2 | 4) then
                local entityId = NetworkGetNetworkIdFromEntity(data.entity)
                local playerPed = PlayerPedId()
                SetBlockingOfNonTemporaryEvents(data.entity, true)
                ped[data.entity] = true
                
                local animDictp = 'weapons@pistol@'
                local animNamep = 'settle_med'

            RequestAnimDict(animDictp)
            while not HasAnimDictLoaded(animDictp) do
                Wait(100) 
            end

            TaskTurnPedToFaceEntity(playerPed, data.entity, 0)

            Wait(700)
            TaskPlayAnim(playerPed, animDictp, animNamep, 8.0, -8.0, 5000, 1, 1, false, false, false)

                local endTime = GetGameTimer() + 5000
                while GetGameTimer() < endTime do
                    if not IsEntityPlayingAnim(data.entity, "random@mugging3", "handsup_standing_base", 3) then
                        TaskHandsUp(data.entity, endTime - GetGameTimer(), PlayerPedId(), 0, true)
                        
                    end
                    Wait(100)
                end

                FreezeEntityPosition(data.entity, false)
                TaskGoToEntity(data.entity, PlayerPedId(), -1, 0.5, 1.0, 1073741824, 0)

                if chance <= Config.ResistanceChance then
                    local weaponHash = GetHashKey(Config.NameWeaponNPC)
                    local playerPed = PlayerPedId()
                    GiveWeaponToPed(data.entity, weaponHash, 200, false, true)
                   SetPedRelationshipGroupHash(data.entity, GetHashKey("ENEMY"))
                    TaskCombatPed(data.entity, playerPed, 0, 16)
                    policeAlert()
                    return
                end

                while GetDistanceBetweenCoords(GetEntityCoords(data.entity), GetEntityCoords(PlayerPedId()), true) > 1.0 do
                    Wait(100)
                    if GetDistanceBetweenCoords(GetEntityCoords(data.entity), GetEntityCoords(PlayerPedId()), true) > 5.0 then
                        break
                    end
                end
            
                if GetDistanceBetweenCoords(GetEntityCoords(data.entity), GetEntityCoords(PlayerPedId()), true) <= 5.0 then
                    local animDict = 'mp_common'
                    RequestAnimDict(animDict)
                    while not HasAnimDictLoaded(animDict) do
                        Wait(100) 
                    end
                    TaskPlayAnim(data.entity, animDict, 'givetake2_a', 8.0, -8.0, -1, 32, 0, false, false, false)
                    TaskPlayAnim(playerPed, animDict, 'givetake2_a', 8.0, -8.0, 2000, 32, 0, false, false, false)
                    Wait(2000) 
                    TriggerServerEvent('n-npcRob:server:robNpc', NetworkGetNetworkIdFromEntity(data.entity))
                    Notify(Strings['rob_complete'], 'success')
                end
            
                ClearPedTasksImmediately(data.entity) 
                SetBlockingOfNonTemporaryEvents(data.entity, false)
                TaskSmartFleePed(data.entity, PlayerPedId(), 50.0, 100000, 0, 0)
                policeAlert()
            
                
            
                
            end
            
            
        end
    }
})



RegisterNetEvent('n-npcRob:client:policeAlert', function (pos)
		if ESX.PlayerData.job.name == "police" then
            if Config.Notify == 'esx' then
			ESX.ShowAdvancedNotification('911','', (Strings['police_alert']), 'CHAR_CHAT_CALL', 2, false, false, 27)
            else
            Notify((Strings['police_alert']), 'warning')
            end
			local alert = AddBlipForCoord(pos)
			SetBlipSprite(alert , 42)
			SetBlipScale(alert , 1.0)
			SetBlipColour(alert, 29)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString((Strings['police_alert_blip']))
			EndTextCommandSetBlipName(alert)
			PulseBlip(alert)
			Wait(10*1000)
			RemoveBlip(alert)
		end
end)