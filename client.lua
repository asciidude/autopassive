-- FUNCTIONS --
function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

function enablePeaceMode(player)
    SetPlayerCanDoDriveBy(player, false)
    DisablePlayerFiring(player, true)
    DisableControlAction(0, 140)
end

-- CODE --
print('AutoPassive loaded, created by asciidude')
local time = config.time

if config.enabled == true then
    AddEventHandler('playerSpawned', function()
        if config.welcomeEnabled then
            notify(config.message)
        end

        if config.messageEnabled then
            notify(config.message)
        end
        
        Citizen.CreateThread(function()
            local ped = GetPlayerPed(-1)
            
            while time > 0 do
                Citizen.Wait(1)
                enablePeaceMode(ped)

                if config.messageEnabled then
                    if IsControlJustReleased(1, 24) then
                        notify(config.message)
                    end
                end

                time = time - 1
                print(time)
            end
            
            -- END --
            if time == 0 then
                if config.endMessageEnabled then
                    notify(config.endMessage)
                end
            end
        end)
    end)
end