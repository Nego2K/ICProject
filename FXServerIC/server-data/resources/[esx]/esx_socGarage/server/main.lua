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

function GetVehiclePositionbySql(player, currentGarage)
	
end

RegisterServerEvent('esx_2KGarage:enteredGarage')
AddEventHandler('esx_2KGarage:enteredGarage', function(currentGarage, veh_position, vehicleProps)
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	
	if vehicleProps == false then
		TriggerClientEvent('esx_2KGarage:insideGarage', _source, currentGarage)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Você entrará a pé')
	else
		MySQL.Async.execute('INSERT INTO users_garages (identifier, plate, garage, position, vehicle) VALUES (@identifier, @plate, @garage, @position, @vehicle)',
			{
				['@identifier'] = xPlayer.identifier,
				['plate'] = vehicleProps.plate,
				['@garage']     = currentGarage,
				['@position']   = json.encode(Config.Garages[currentGarage].Parkings[veh_position]),
				['vehicle']     = json.encode(vehicleProps)
			}, function(rowsChanged)
				TriggerClientEvent('esx:showNotification', xPlayer.source, 'Veículo Guardado')
				print(json.encode(Config.Garages[currentGarage].Parkings[veh_position]))	
		end)
		TriggerClientEvent('esx_2KGarage:insideGarage', _source, currentGarage)
	end	
		
end)

RegisterServerEvent('esx_2KGarage:deleteVehicle')
AddEventHandler('esx_2KGarage:deleteVehicle', function(garage, vehicleProps)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	MySQL.Async.execute('DELETE FROM users_garages WHERE identifier = @identifier AND plate = @plate AND garage = @garage ',
	{
		['@identifier'] = xPlayer.identifier,
		['@plate']       = vehicleProps.plate,
		['@garage']     = garage
	}, function(rowsChanged)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Veículo Retirado')
	end)
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

ESX.RegisterServerCallback('esx_N2KGarage:getGaragePos', function(source, cb, currentGarage, positions)
	local xPlayer  = ESX.GetPlayerFromId(source)
	--print(json.encode(positions))
	MySQL.Async.fetchScalar('SELECT COUNT(1) FROM users_garages WHERE identifier = @identifier AND garage = @garage',
		{
			['@identifier'] = xPlayer.identifier,
			['@garage']     = currentGarage
		}, function(result)
			cb(result+1)
	end)
end)

ESX.RegisterServerCallback('esx_N2KGarage:getVehiclesInGarage', function(source, cb, currentGarage)
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM users_garages WHERE identifier = @identifier AND garage = @garage',
		{
			['@identifier'] = xPlayer.identifier,
			['@garage']     = currentGarage
		}, function(result)
			
			local vehicles = {}
			for i=1, #result, 1 do
				table.insert(vehicles, {
					position    = json.decode(result[i].position),
					vehicle = json.decode(result[i].vehicle)
				})
			end
		cb(vehicles)
	end)
end)