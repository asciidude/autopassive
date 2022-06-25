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
    SetEntityInvincible(player, true)
end

-- Join Passive --
print('AutoPassive loaded, created by asciidude')
local joinPassive = false

if config.joinEnabled then
    local ped = GetPlayerPed(-1)
    local playerPos = GetEntityCoords(ped)

    joinPassive = true

    if config.teleportEnabled then
        x1, y1, z1 = config.teleportCoordinates:match("([^,]+),([^,]+),([^,]+)")
        SetEntityCoords(ped, x1, y1, z1)
    end

    AddEventHandler('playerSpawned', function()
        if config.welcomeEnabled then
            notify(config.message)
        end

        if config.infinite then
            Citizen.CreateThread(function()
                local ped = GetPlayerPed(-1)

                while true do
                    Citizen.Wait(1)
                    enablePeaceMode(ped)
                end
            end)
        else
            local time = config.time

            if config.messageEnabled then
                notify(config.message)
            end
            
            Citizen.CreateThread(function()
                local ped = GetPlayerPed(-1)
                
                while time > 0 do
                    Citizen.Wait(1)
                    enablePeaceMode(ped)

                    time = time - 1
                end
                
                -- END --
                if time == 0 then
                    if config.endMessageEnabled then
                        notify(config.endMessage)
                    end

                    SetEntityInvincible(ped, false)
                    joinPassive = false

                    if config.teleportEnabled then
                        if config.teleportBackEnabled then
                            SetEntityCoords(ped, playerPos.x, playerPos.y, playerPos.z)
                        else
                            x2, y2, z2 = config.teleportCoordinates2:match("([^,]+),([^,]+),([^,]+)")
                            SetEntityCoords(ped, x2, y2, z2)
                        end
                    end
                end
            end)
        end
    end)
end

-- AFK Passive --
if config.AFKpassiveEnabled and config.infinite == false then
    local ped = GetPlayerPed(-1)
    local AFK = false

    RegisterCommand(config.AFKpassiveCommand, function(source, args, rawCommand)
        if joinPassive then
            notify(config.AFKpassiveFailureMessage)
        else
            if AFK then
                AFK = false
                notify(config.AFKpassiveDisabledMessage)
                SetEntityInvincible(ped, false)
            else
                AFK = true
                notify(config.AFKpassiveEnabledMessage)

                while AFK do
                    Citizen.Wait(1)
                    enablePeaceMode(ped)
                end
            end
        end
    end, config.enableACE)
end