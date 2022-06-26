ESX               = nil
local PlayerData = {}
local TextLocation = Config.Location
local ped = PlayerPedId()
local menuIsShowed          = false


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:PlayerLoaded')
AddEventHandler('esx:PlayerLoaded',function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('koala-cityhall:closemenu')
AddEventHandler('koala-cityhall:closemenu', function()
    menuIsShowed = false
    SetNuiFocus(false)
    SendNUIMessage({hideAll = true})
end)


RegisterNUICallback('escape', function(data, cb)
    TriggerEvent('koala-cityhall:closemenu')
    cb('ok')
end)



RegisterNetEvent ('esx:setJob')
AddEventHandler('esx:setJob',function(job)
    PlayerData.job = Job
end)


RegisterNetEvent('koala-cityhall:setjobtaxi')
AddEventHandler('koala-cityhall:setjobtaxi', function()
    TriggerServerEvent('koala-cityhall:setplayerjobtaxi')
end)

RegisterNUICallback('taxi', function(data, cb)
    TriggerEvent('koala-cityhall:setjobtaxi')
end)



-- Draw Text --
function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.40)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextEntry("STRING")
        SetTextCentre(true)
        SetTextColour(255, 255, 215, 215)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end



    local text_distance = Config.Distance
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(4)
            if isNear then
            Draw3DText(TextLocation.x, TextLocation.y, TextLocation.z, _U('open_menu'), 0.8)
                if Vdist(GetEntityCoords(ped), Config.Location) < 1 and IsControlJustReleased(1, 38) then
                    if ESX.PlayerData.job.name == "police" then
                        exports['mythic_notify']:DoHudText('error', _U('police_warning'), { ['background-color'] = '#007bff', ['color'] = '#ffffff' })
                    else
                        RequestAnimDict("mp_fbi_heist")
                        while (not HasAnimDictLoaded("mp_fbi_heist")) do Citizen.Wait(0) end
                        TaskPlayAnim(ped,"mp_fbi_heist", "loop" , 1.0,-1.0, 5000, 0, 1, true, true, true)
                        exports['progressBars']:startUI(4000, _U('pc'))
                        Citizen.Wait(4000)
                        menuIsShowed        = true
    
                        SendNUIMessage({
                            showMenu = true,
                        })
    
                        SetNuiFocus(true, true)
    
                        if menuIsShowed then
                            ESX.HideUI()
                        end
                    end
                end 
            end
        end
    end)


-- End of Draw Text --


-- Open Menu --

Citizen.CreateThread(function()
    while true do
        local coords = GetEntityCoords(ped)
        Citizen.Wait(500)
        if Vdist(coords, TextLocation) < Config.Distance then
            isNear = true
        else
            isNear = false
        end
    end
end)



-- End of open Menu--


