ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('koala-cityhall:taxijob')
AddEventHandler('koala-cityhall:taxijob', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob('taxi', 0)
end)

RegisterServerEvent('koala-cityhall:delijob')
AddEventHandler('koala-cityhall:delijob', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob('delivery', 0)
end)


RegisterServerEvent('koala-cityhall:trashjob')
AddEventHandler('koala-cityhall:trashjob', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob('garbage', 0)
end)