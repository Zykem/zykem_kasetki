ESX = nil
TriggerEvent('hypex:getTwojStarySharedTwojaStaraObject', function(obj) 
    ESX = obj 
end)

Citizen.CreateThread(function()
   
    local tokenSEC = 'ZykemSEC'.. math.random(1111,999999)
    TriggerClientEvent('zykem:security', -1, token)

end)

RegisterServerEvent('zykem:payforkaseta')
AddEventHandler('zykem:payforkaseta', function(token)

    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if token ~= tokenSEC then
        -- tutaj dodajcie wysylanie logow / export bana
        print('Cheater zlapany!')

    else

        xPlayer.addMoney(Config.Reward)

    end

end)
-- github.com/Zykem