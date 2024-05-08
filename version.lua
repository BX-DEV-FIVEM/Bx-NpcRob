

local version = 'V2.0'
local expectedResourceName = "BX-NpcRob"

if Config.CheckUpdate then

    CreateThread(function()
        Wait(5000)
        local resourceName = GetCurrentResourceName()
        local currentVersion = GetResourceMetadata(resourceName, 'version', 0)
        local versionUrl = 'https://raw.githubusercontent.com/BX-DEV-FIVEM/BX-NpcRob/main/version.lua'

        PerformHttpRequest(versionUrl, function(error, result, headers)
            if error ~= 200 then
                print("^1Error checking version: GitHub is having issues or the manifest file is not accessible.^0")
                return
            end

            -- Pattern pour extraire la version depuis le contenu de version.lua
            local latestVersion = result:match("local version = ['\"](%S+)['\"]")

            if latestVersion == nil then
                print("^1Error: Version information could not be found in the version file.^0")
                return
            end
            

            if currentVersion ~= latestVersion then
                print("  //\n  || ^1   " .. resourceName .. "^0 from ^5BX-DEV^0")
                print("  ||    Last Version: ❌ ")
                print(string.format("  ||    ^3New version available!^0 Current Version: ^5%s^0, Latest Version: ^2%s^0  ", currentVersion, latestVersion))
                print("  || ^5   https://github.com/BX-DEV-FIVEM/BX-NpcRob ^0\n  \\\\")
            else
                print("  //\n  || ^1   " .. resourceName .. "^0 from ^5BX-DEV^0")
                print("  ||    Version : ^2" .. latestVersion .. "^0")
                print("  ||    Last Version: ✔️ \n  \\\\")
            end
        end, 'GET')
    end)
end

    AddEventHandler('onResourceStart', function(resourceName)
        if GetCurrentResourceName() ~= expectedResourceName then
            print("^1  Ressource Name must be 'BX-NpcRob' ^0")
        end
    
    end)
    
    
    
