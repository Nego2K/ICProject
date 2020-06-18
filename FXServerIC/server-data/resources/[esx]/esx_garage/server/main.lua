ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_2KGarage:getOwnedProperties',function(source, cb)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local properties = {}

	MySQL.Async.fetchAll("SELECT * FROM owned_properties WHERE owner = @identifier",{['@identifier'] = xPlayer.getIdentifier()}, function(data)
		for _,v in pairs(data) do
			table.insert(properties, v.name)
		end
		cb(properties)
	end)
end)


RegisterServerEvent('esx_garage:setParking')
AddEventHandler('esx_garage:setParking', function(garage, zone, vehicleProps)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	if vehicleProps == false then

		MySQL.Async.execute('DELETE FROM `user_garage` WHERE `identifier` = @identifier AND `garage` = @garage AND zone = @zone',
		{
			['@identifier'] = xPlayer.identifier,
			['@garage']     = garage,
			['@zone']       = zone
		}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_released'))
		end)
	else
		MySQL.Async.execute('INSERT INTO user_garage (identifier, plate, garage, zone, vehicle) VALUES (@identifier, @plate, @garage, @zone, @vehicle)',
		{
			['@identifier'] = xPlayer.identifier,
			['plate'] = vehicleProps.plate,
			['@garage']     = garage,
			['@zone']       = zone,
			['vehicle']     = json.encode(vehicleProps)
	}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_stored'))
		end)
	end
end)

TriggerEvent('es:addGroupCommand', 'reloadgarage', 'admin', function(source, args, user)
		TriggerClientEvent('esx_2KGarage:reloadGarages', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Heal a player, or yourself - restores thirst, hunger and health."})

RegisterServerEvent('esx_garage:updateOwnedVehicle')
AddEventHandler('esx_garage:updateOwnedVehicle', function(vehicleProps)
	MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
		['@plate'] = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	})
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehiclesInGarage', function(source, cb, garage)
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM `user_garage` WHERE `identifier` = @identifier AND garage = @garage',
	{
		['@identifier'] = xPlayer.identifier,
		['@garage']     = garage
	}, function(result)

		local vehicles = {}
		for i=1, #result, 1 do
			table.insert(vehicles, {
				zone    = result[i].zone,
				vehicle = json.decode(result[i].vehicle)
			})
		end

		cb(vehicles)

	end)

end)