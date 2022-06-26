ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('koala-cityhall:setplayerjobtaxi')
AddEventHandler('koala-cityhall:setplayerjobtaxi', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob(taxi, 0)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = _U('setjob'), style = { ['background-color'] = '#00e029', ['color'] = '#ffffff' } })
end)