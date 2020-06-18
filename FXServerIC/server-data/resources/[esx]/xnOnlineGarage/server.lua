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
		print(json.encode(properties))
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
    savePlayerFile(player, json.encode(data))
	print(player, json.encode(data))
	--saveVehicleToFile(json.encode(data))

    TriggerClientEvent("xnov:savecallback", source, "success")
end)

RegisterServerEvent("xnov:deleteVehicle")
AddEventHandler("xnov:deleteVehicle", function(location, position)
    local player = source
    local data = json.decode(loadPlayerFile(player)) or {}
    if data[location] and data[location][position] then data[location][position] = "none" end

    savePlayerFile(player, json.encode(data))

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
	print(player, json.encode(data))
	--saveVehicleToFile(json.encode(data))

    TriggerClientEvent("xnov:message", source, "Vehicle Moved")
end)

TriggerEvent('es:addGroupCommand', 'reloadgarage', 'admin', function(source, args, user)
		TriggerClientEvent('esx_2KGarage:reloadGarages', source)
end, function(source, args, user)
	TriggerClientEvent('chatMessage', source, "HEAL", {255, 0, 0}, "Insufficient Permissions.")
end, {help = "Heal a player, or yourself - restores thirst, hunger and health."})
