local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
local resourceName = GetCurrentResourceName()
local expectedResourceName = "BX-NpcRob"

local versionURL = "https://raw.githubusercontent.com/BX-DEV-FIVEM/BX.Version/refs/heads/main/version.lua"

 if GetCurrentResourceName() == expectedResourceName then
PerformHttpRequest(versionURL, function(err, response, headers)
    if err == 200 then
        local func, loadErr = load(response)
        if func then
            func() 
            if version then
                local remoteVersion = version["BX-NpcRob"]

                if remoteVersion ~= currentVersion then
                        print("  //\n  || ^1   " .. resourceName .. "^0 from ^5BX-DEV^0")
                        print("  ||    Last Version: ❌ ")
                        print(string.format("  ||    ^3New version available!^0 Current Version: ^1%s^0, Latest Version: ^2%s^0  ", currentVersion, remoteVersion))
                        print("  || ^5   https://keymaster.fivem.net ^0\n  \\\\")
   
                else
                    print("^2[INFO]^1 " .. resourceName .. " ^0from ^5BX-DEV^0 is update ✔️")
                            

                end
            else
                print("^1[ERROR]^7 Unable to retrieve remote version for" .. resourceName .. ".")
            end
        else
            print("^1[ERROR]^7 Error running remote script: " .. loadErr)
        end
    else
        print("^1[ERROR]^7Unable to retrieve remote version for " .. resourceName .. ". error: " .. err)
    end
end)
    
    end



AddEventHandler('onResourceStart', function(resourceName)
        if GetCurrentResourceName() ~= expectedResourceName then
            print("^1 [ERROR] ^3 Ressource Name must be ".. expectedResourceName .." ^0")
        end
    
    end)
