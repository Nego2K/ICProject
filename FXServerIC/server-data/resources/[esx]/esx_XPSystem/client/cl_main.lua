ESX = nil
local EXPData, isPaused = {}, false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function GetEXPData(minimal)
	local xp_data = {}

	for i=1, #EXPData, 1 do
		if minimal then
			table.insert(xp_data, {
				name    = EXPData[i].name,
				val     = EXPData[i].val,
			})
		else
			table.insert(xp_data, {
				name    = EXPData[i].name,
				val     = EXPData[i].val,
				color   = EXPData[i].color,
				visible = EXPData[i].visible(EXPData[i]),
				max     = EXPData[i].max,
			})
		end
	end

	return xp_data
end

AddEventHandler('esx_systemxp:registerXPData', function(name, default, color, visible, tickCallback)
	local xp_data = CreateEXPSystem(name, default, color, visible, tickCallback)
	table.insert(EXPData, xp_data)
end)

AddEventHandler('esx_systemxp:unregisterXPData', function(name)
	for k,v in ipairs(EXPData) do
		if v.name == name then
			table.remove(EXPData, k)
			break
		end
	end
end)

RegisterNetEvent('esx_systemxp:load')
AddEventHandler('esx_systemxp:load', function(xp_data)
	for i=1, #EXPData, 1 do
		for j=1, #xp_data, 1 do
			if EXPData[i].name == xp_data[j].name then
				EXPData[i].set(xp_data[j].val)
			end
		end
	end

	Citizen.CreateThread(function()
		while true do
			for i=1, #EXPData, 1 do
				EXPData[i].onTick()
			end

			TriggerEvent('esx_systemxp:onTick', GetEXPData(true))
			Citizen.Wait(Config.TickTime)
		end
	end)
end)

RegisterNetEvent('esx_systemxp:set')
AddEventHandler('esx_systemxp:set', function(name, val)
	for i=1, #EXPData, 1 do
		if EXPData[i].name == name then
			EXPData[i].set(val)
			break
		end
	end

	TriggerServerEvent('esx_systemxp:update', GetEXPData(true))
end)

RegisterNetEvent('esx_systemxp:add')
AddEventHandler('esx_systemxp:add', function(name, val)
	for i=1, #EXPData, 1 do
		if EXPData[i].name == name then
			EXPData[i].add(val)
			break
		end
	end

	TriggerServerEvent('esx_systemxp:update', GetEXPData(true))
end)

RegisterNetEvent('esx_systemxp:remove')
AddEventHandler('esx_systemxp:remove', function(name, val)
	for i=1, #EXPData, 1 do
		if EXPData[i].name == name then
			EXPData[i].remove(val)
			break
		end
	end
	
	TriggerServerEvent('esx_systemxp:update', GetEXPData(true))
end)

AddEventHandler('esx_systemxp:getXPData', function(name, cb)
	for i=1, #EXPData, 1 do
		if EXPData[i].name == name then
			cb(EXPData[i])
			return
		end
	end
end)

-- Pause menu disable hud display
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)

		if IsPauseMenuActive() and not isPaused then
			isPaused = true
		elseif not IsPauseMenuActive() and isPaused then
			isPaused = false
		end
	end
end)

-- Loaded event
Citizen.CreateThread(function()
	TriggerEvent('esx_systemxp:loaded')
end)

-- Update server
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.UpdateInterval)
		TriggerServerEvent('esx_systemxp:update', GetEXPData(true))
	end
end)


