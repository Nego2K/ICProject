ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	local players = ESX.GetPlayers()

	for _,playerId in ipairs(players) do
		local xPlayer = ESX.GetPlayerFromId(playerId)

		MySQL.Async.fetchAll('SELECT xp_data FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		}, function(result)
			local data = {}

			if result[1].xp_data then
				data = json.decode(result[1].xp_data)
			end

			xPlayer.set('xp_data', data)
			TriggerClientEvent('esx_systemxp:load', playerId, data)
		end)
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	MySQL.Async.fetchAll('SELECT xp_data FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local data = {}

		if result[1].xp_data then
			data = json.decode(result[1].xp_data)
		end

		xPlayer.set('xp_data', data)
		TriggerClientEvent('esx_systemxp:load', playerId, data)
	end)
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local xp_data = xPlayer.get('xp_data')

	MySQL.Async.execute('UPDATE users SET xp_data = @xp_data WHERE identifier = @identifier', {
		['@xp_data']     = json.encode(xp_data),
		['@identifier'] = xPlayer.identifier
	})
end)

AddEventHandler('esx_systemxp:getXPData', function(playerId, EXPName, cb)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local xp_data  = xPlayer.get('xp_data')

	for i=1, #xp_data, 1 do
		if xp_data[i].name == EXPName then
			cb(xp_data[i])
			break
		end
	end
end)

RegisterServerEvent('esx_systemxp:update')
AddEventHandler('esx_systemxp:update', function(xp_data)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		xPlayer.set('xp_data', xp_data)
	end
end)

function SaveData()
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local xp_data  = xPlayer.get('xp_data')

		MySQL.Async.execute('UPDATE users SET xp_data = @xp_data WHERE identifier = @identifier', {
			['@xp_data']     = json.encode(xp_data),
			['@identifier'] = xPlayer.identifier
		})
	end

	SetTimeout(10 * 60 * 1000, SaveData)
end

SaveData()

TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local playerId = tonumber(args[1])

		-- is the argument a number?
		if playerId then
			-- is the number a valid player?
			if GetPlayerName(playerId) then
				print(('esx_basicneeds: %s healed %s'):format(GetPlayerIdentifier(source, 0), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_status:add', source, 'correio', 200000)
				TriggerClientEvent('chat:addMessage', source, { args = { '^5HEAL', 'You have been healed.' } })
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player id.' } })
		end
	else
		print(('esx_basicneeds: %s healed self'):format(GetPlayerIdentifier(source, 0)))
		TriggerClientEvent('esx_status:add', source, 'correio', 200000)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', params = {{name = 'playerId', help = '(optional) player id'}}})
