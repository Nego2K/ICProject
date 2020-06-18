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

local resourceName = tostring(GetCurrentResourceName())
function savePlayerFile(player, data)
    local fileName = GetPlayerIdentifiers(player)[2]
    local ret = SaveResourceFile(resourceName, fileName..".json", data, -1)
    return ret
end
local function loadPlayerFile(player)
    local fileName = GetPlayerIdentifiers(player)[2]
    local ret = LoadResourceFile(resourceName, fileName..".json")
    if ret then return ret else return "[]" end
end

RegisterServerEvent("xnov:reqVehicles")
AddEventHandler("xnov:reqVehicles", function(player)
    local ply = player or source
    local data = json.decode(loadPlayerFile(ply)) or {}
    TriggerClientEvent("xnov:recVehicles",source,data)
	print(json.encode(data))
end)

RegisterServerEvent("xnov:saveVehicle")
AddEventHandler("xnov:saveVehicle", function(vehicleData, location, position, oldLocation)
    local player = source
	local xPlayer  = ESX.GetPlayerFromId(player)
    local data = json.decode(loadPlayerFile(player)) or {}
    if not data[location] then data[location] = {} end
    local oldLocation = oldLocation or location
    if not data[oldLocation] then data[oldLocation] = {} end

    if location == oldLocation then
        if not position then
            local found = false
            for i=1,#xnGarageConfig.locations[location].carLocations do
                if data[location][i] == nil or data[location][i] == "none" then
                    data[location][i] = vehicleData
                    found = true
                    break
                end
            end
            if not found then TriggerClientEvent("xnov:savecallback", source, "no_slot") return end
        else
            data[location][position] = vehicleData
        end
    else
        if data[oldLocation] then
            data[oldLocation][position] = "none"
        end

        local found = false
        for i=1,#xnGarageConfig.locations[location].carLocations do
            if data[location][i] == nil or data[location][i] == "none" then
                data[location][i] = vehicleData
                found = true
                break
            end
        end
        if not found then TriggerClientEvent("xnov:savecallback", source, "no_slot") return end
    end
	
	if vehicleData == false then
		MySQL.Async.execute('DELETE FROM `user_parkings` WHERE `identifier` = @identifier AND plate = @plate',
		{
			['@identifier'] = xPlayer.identifier,
			['@plate']     = location
		}, function(rowsChanged)
			savePlayerFile(player, json.encode(data))
		end)
	
	else
		MySQL.Async.execute('INSERT INTO user_parkings (identifier, vehicle) VALUES (@identifier, @vehicle)',
		{
			['@identifier'] = xPlayer.identifier,
			['vehicle']     = json.encode(data),
		}, function(rowsChanged)
			 TriggerClientEvent("xnov:savecallback", player, "success")
			 savePlayerFile(player, json.encode(data))
		end)
	end
end)

RegisterServerEvent("xnov:deleteVehicle")
AddEventHandler("xnov:deleteVehicle", function(location, position)
    local player = source
	local xPlayer  = ESX.GetPlayerFromId(player)
	
    local data = json.decode(loadPlayerFile(player)) or {}
	print(data[location])
    if data[location] and data[location][position] then data[location][position] = "none" end
	
    TriggerClientEvent("xnov:message", source, "Vehicle Deleted")
end)

RegisterServerEvent("xnov:moveVehicle")
AddEventHandler("xnov:moveVehicle", function(location, oldPosition, newPosition)
    local player = source
    local data = json.decode(loadPlayerFile(player)) or {}
    if data[location] then
        local oldVehicleData
        if data[location][newPosition] then
            oldVehicleData = data[location][newPosition]
        else
            oldVehicleData = "none"
        end
        data[location][newPosition] = data[location][oldPosition]
        data[location][oldPosition] = oldVehicleData
    end

    savePlayerFile(player, json.encode(data))
	--print(player, json.encode(data))
	saveVehicleToFile(json.encode(data))

    TriggerClientEvent("xnov:message", source, "Vehicle Moved")
end)

--[[RegisterServerEvent('esx_2KGarage:setParking')
AddEventHandler('esx_2KGarage:setParking', function(garage, zone, vehicleProps, plate)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)

	if vehicleProps == false then

		MySQL.Async.execute('DELETE FROM `user_parkings` WHERE `identifier` = @identifier AND `garage` = @garage AND zone = @zone',
		{
			['@identifier'] = xPlayer.identifier,
			['@garage']     = garage,
			['@zone']       = zone
		}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_released'))
		end)
	else
		MySQL.Async.execute('INSERT INTO `user_parkings` (identifier, garage, zone, vehicle, plate) VALUES (@identifier, @garage, @zone, @vehicle, @plate)',
		{
			['@identifier'] = xPlayer.identifier,
			['@garage']     = garage;
			['@zone']       = zone,
			['vehicle']     = json.encode(vehicleProps),
			['plate'] = plate
		}, function(rowsChanged)
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('veh_stored'))
		end)
	end
end)

RegisterServerEvent('esx_2KGarage:updateOwnedVehicle')
AddEventHandler('esx_2KGarage:updateOwnedVehicle', function(vehicleProps)
	MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle WHERE plate = @plate', {
		['@plate'] = vehicleProps.plate,
		['@vehicle'] = json.encode(vehicleProps)
	})
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehiclesInGarage', function(source, cb, garage)
	local xPlayer  = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM user_parkings WHERE `identifier` = @identifier AND garage = @garage',
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

end)]]

TriggerEvent('es:addGroupCommand', 'reloadgarage', 'admin', function(source, args, user)
		TriggerClientEvent('esx_2KGarage:reloadGarages', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Heal a player, or yourself - restores thirst, hunger and health."})
