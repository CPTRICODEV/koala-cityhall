ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('koala-cityhall:taxijob')
AddEventHandler('koala-cityhall:taxijob', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob('taxi', 0)
end)