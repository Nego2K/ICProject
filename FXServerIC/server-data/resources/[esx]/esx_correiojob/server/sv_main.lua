ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_correiojob:payDelivery')
AddEventHandler('esx_correiojob:payDelivery', function(quantidade)
	local xPlayer     = ESX.GetPlayerFromId(source)
	print(quantidade)
	local recompensa = math.random(45, 65)
	print(recompensa)
	local totalrep = math.ceil(recompensa*quantidade)
	print(totalrep)
	xPlayer.addMoney(totalrep)
	TriggerClientEvent('esx:showNotification', source, 'Você recebeu R$'..recompensa..' por cada entrega\n~y~Total: R$~s~ '..totalrep)
end)