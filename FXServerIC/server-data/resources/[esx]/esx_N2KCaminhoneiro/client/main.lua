local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.TriggerServerCallback('esx_property:getCargas', function(cargas)
		Config.Cargas = cargas
	end)
end)

-- only used when script is restarting mid-session
RegisterNetEvent('esx_N2KCaminhoneiro:sendCargas')
AddEventHandler('esx_N2KCaminhoneiro:sendCargas', function(cargas)
	Config.Cargas = cargas
end)

AddEventHandler('esx_caminhoneirojob:hasEnteredMarker', function(zone)
	if zone == 'CaminhoneiroActions' then
		CurrentAction     = 'caminhoneiro_actions_menu'
		CurrentActionMsg  = 'Pressione ~INPUT_CONTEXT~ para ~y~abrir o menu~s~ de Cargas.'
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_caminhoneirojob:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'desempregado' then
			local coords = GetEntityCoords(PlayerPedId())

			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 180.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, true, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

function MenudeCargas()
	ESX.UI.Menu.CloseAll()
	ESX.TriggerServerCallback('esx_N2KCaminhoneiro:getCargas', function(server_carga)
		local elements = {}
		for i=1, #server_carga, 1 do
			print(server_carga[i].label)
			print(server_carga[i].carga_id)
			print(server_carga[i].status)
			local NomeCarga = server_carga[i].label
			local carga = server_carga[i].carga_id
			local disponibilidade = ""
						
			if server_carga[i].status then 
				disponibilidade = "Disponível" 
			else 
				disponibilidade = "Indisponível" 
			end
							
			table.insert(elements, {
				label = NomeCarga.." - R$".. ESX.Math.GroupDigits(server_carga[i].reward).." - "..disponibilidade  ,
				value = carga
			})
			end
			
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'nome_cargas',
		{
			title    = 'Menu de Cargas',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
		TriggerServerEvent("esx_N2KCaminhoneiro:IniciarEntrega", data.current.value, NomeCarga)
		menu.close()
		end)
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if PlayerData.job ~= nil and PlayerData.job.name == 'desempregado' then

			local coords      = GetEntityCoords(PlayerPedId())
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_caminhoneirojob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_caminhoneirojob:hasExitedMarker', LastZone)
			end

		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'desempregado' then

				if CurrentAction == 'caminhoneiro_actions_menu' then
					MenudeCargas()
				end
				CurrentAction = nil
			end
		end
	end
end)