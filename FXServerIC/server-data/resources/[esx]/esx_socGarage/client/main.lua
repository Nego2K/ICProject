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

ESX                	  = nil
local hasProperty	  = false
local isInGarage 	  = false
local lock_fancyteleport = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.TriggerServerCallback('esx_2KGarage:getOwnedProperties', function(properties)
      userProperties = properties
            for zoneKey,zoneValues in pairs(Config.Garages)do
                if zoneValues.Propriedade and has_value(userProperties, zoneValues.Propriedade) then
                    hasProperty = true
              else
					hasProperty = false
             end
          end
     end)
end)

TriggerEvent('instance:registerType', 'garage')

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance.type == 'garage' then
		TriggerEvent('instance:enter', instance)
	end
end)

RegisterNetEvent('esx_2KGarage:insideGarage')
AddEventHandler('esx_2KGarage:insideGarage', function(currentGarage)
	isInGarage = true
	local spawnCoords  = {
		x = Config.Garages[currentGarage].spawnInLocation.x,
		y = Config.Garages[currentGarage].spawnInLocation.y,
		z = Config.Garages[currentGarage].spawnInLocation.z
	}
	
	FancyTeleport()
	Citizen.Wait(1500)
	ESX.Game.Teleport(PlayerPedId(), spawnCoords, function()
		TriggerEvent('instance:create', 'garage')
		ESX.TriggerServerCallback('esx_N2KGarage:getVehiclesInGarage', function(vehicles)
			for i=1, #vehicles, 1 do
				print(vehicles[i].vehicle.model)
				ESX.Game.SpawnLocalVehicle(vehicles[i].vehicle.model, {
				x = Config.Garages[currentGarage].Parkings[i].x,
				y = Config.Garages[currentGarage].Parkings[i].y,
				z = Config.Garages[currentGarage].Parkings[i].z
				}, Config.Garages[currentGarage].Parkings[i].h, function(vehicle)
					ESX.Game.SetVehicleProperties(vehicle, vehicles[i].vehicle)
					SetVehicleOnGroundProperly(vehicle)
					SetEntityInvincible(vehicle, true)
            		SetEntityProofs(vehicle, true, true, true, true, true, true, 1, true)
            		SetVehicleTyresCanBurst(vehicle, false)
            		SetVehicleCanBreak(vehicle, false)
            		SetVehicleCanBeVisiblyDamaged(vehicle, false)
            		SetEntityCanBeDamaged(vehicle, false)
            		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
				end)
			end	
		end, currentGarage)
	end)
	Citizen.CreateThread(function()
		while true do
		Citizen.Wait(1)
		local coords 		= GetEntityCoords(PlayerPedId(), true)
		local outCoords  = {
			x = Config.Garages[currentGarage].spawnOutLocation.x,
			y = Config.Garages[currentGarage].spawnOutLocation.y,
			z = Config.Garages[currentGarage].spawnOutLocation.z
		}
			if(GetDistanceBetweenCoords(coords, Config.Garages[currentGarage].outMarker.x, Config.Garages[currentGarage].outMarker.y, Config.Garages[currentGarage].outMarker.z, true) < Config.DrawDistance) then
			DrawMarker(Config.MarkerType, Config.Garages[currentGarage].outMarker.x, Config.Garages[currentGarage].outMarker.y, Config.Garages[currentGarage].outMarker.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords, Config.Garages[currentGarage].outMarker.x, Config.Garages[currentGarage].outMarker.y, Config.Garages[currentGarage].outMarker.z, true) < 1.5) then
					ESX.ShowHelpNotification('Pressione ~INPUT_CONTEXT~ para sair da garagem!')
					if IsControlJustReleased(0, Keys['E']) then
						FancyTeleport()
						Citizen.Wait(1500)
						ESX.Game.Teleport(PlayerPedId(), outCoords, function()
							TriggerEvent('instance:close')
							LimparGaragem(currentGarage)
							isInGarage = false
						end)
					end
				end
			end
		end
	end)
	Citizen.CreateThread(function()
		while true do
		Citizen.Wait(0)
		local vehicle       = GetVehiclePedIsIn(PlayerPedId(),  false)
		local outCoords  = {
			x = Config.Garages[currentGarage].spawnOutLocation.x,
			y = Config.Garages[currentGarage].spawnOutLocation.y,
			z = Config.Garages[currentGarage].spawnOutLocation.z
		}
			if IsPedInAnyVehicle(PlayerPedId(),  false) and isInGarage then
			ESX.ShowHelpNotification('~INPUT_MOVE_UP_ONLY~ Retirar o veículo da garagem\n \n~INPUT_ENTER~ Sair do veículo')
			local x,y,z = table.unpack(GetEntityVelocity(vehicle))
			local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
				if (x > 1.0 or y > 1.0 or z > 1.0) or (x < -1.0 or y < -1.0 or z < -1.0) then
					FancyTeleport()
					Citizen.Wait(2000)
					DeletarGaragemVehicle(vehicle)
					TriggerServerEvent('esx_2KGarage:deleteVehicle', currentGarage, vehicleProps)
					ESX.Game.Teleport(PlayerPedId(), outCoords, function()
					
					TriggerEvent('instance:close')

						ESX.Game.SpawnVehicle(vehicleProps.model, outCoords, Config.Garages[currentGarage].spawnOutLocation.h, function(vehicle)
							TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
							ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
							SetVehicleOnGroundProperly(vehicle)
						end)
					end)
					isInGarage = false
					LimparGaragem(currentGarage)
					break
				end
			end
		end
	end)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords 		= GetEntityCoords(PlayerPedId(), true)
		for k,v in pairs(Config.Garages) do
			local GaragePos = v.inLocation
			if(GetDistanceBetweenCoords(coords, GaragePos.x, GaragePos.y, GaragePos.z, true) < Config.DrawDistance) and hasProperty then
				DrawMarker(Config.MarkerType, GaragePos.x, GaragePos.y, GaragePos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				if(GetDistanceBetweenCoords(coords, GaragePos.x, GaragePos.y, GaragePos.z, true) < 2.5) then
					ESX.ShowHelpNotification('Pressione ~INPUT_CONTEXT~ para entrar na garagem!')
					if IsControlJustReleased(0, Keys['E']) then
						if IsPedInAnyVehicle(PlayerPedId(),  false) then
							local vehicle       = GetVehiclePedIsIn(PlayerPedId(),  false)
							if GetPedInVehicleSeat(vehicle,  -1) == PlayerPedId() then
									ESX.TriggerServerCallback('esx_N2KGarage:getGaragePos', function(position)
										if position < #Config.Garages[k].Parkings then
											local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
											TriggerServerEvent('esx_2KGarage:enteredGarage', k, position, vehicleProps)
											FancyTeleport()
											Citizen.Wait(1750)
											DeletarGaragemVehicle(vehicle)
										end
									end, k)
							else
								ESX.ShowNotification('Somente o dono do veículo pode guardar o veículo na garagem!')
							end
						else
							TriggerServerEvent('esx_2KGarage:enteredGarage', k, 0, false)
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isInGarage then
			for i=0,63 do
                if i ~= GetPlayerServerId(PlayerId()) then
                    SetPlayerInvisibleLocally(GetPlayerFromServerId(i))
                end
            end
            DisableControlAction(0, Keys['LEFTSHIFT'], true)
            DisablePlayerFiring(PlayerId(), true)
        end
    end
end)

function FancyTeleport()
    if not lock_fancyteleport then
        lock_fancyteleport = true
        Citizen.CreateThread(function() Citizen.Wait(15000) DoScreenFadeIn(500) end)
        Citizen.CreateThread(function()

            DoScreenFadeOut(500)
            while IsScreenFadingOut() do Citizen.Wait(0) end

            Citizen.Wait(5000)

            DoScreenFadeIn(500)
            while IsScreenFadingIn() do Citizen.Wait(0) end

            lock_fancyteleport = false
        end)
    end
end

function LimparGaragem(garagem)
	local clearArea = {
		x = Config.Garages[garagem].spawnInLocation.x,
		y = Config.Garages[garagem].spawnInLocation.y,
		z = Config.Garages[garagem].spawnInLocation.z
	}
	vehicles_area = ESX.Game.GetVehiclesInArea(clearArea, 30.0)
	if #vehicles_area > 0 then
		for k,v in ipairs(vehicles_area) do
			ESX.TriggerServerCallback('esx_N2KGarage:getVehiclesInGarage', function(vehicles)
				for i=1, #vehicles, 1 do
					if ESX.Math.Trim(GetVehicleNumberPlateText(v)) == vehicles[i].vehicle.plate then
						print(v)
						DeletarGaragemVehicle(v)
						if DoesEntityExist(v) then
							DeletarGaragemVehicle(v)
							print('Bug duplicação de veículo'.. v)
						end
					end
				end
			end, garagem)
		end
	end
end

function DeletarGaragemVehicle(vehicle)
	SetEntityAsMissionEntity(vehicle, false, true)
	DeleteVehicle(vehicle)
	SetVehicleHasBeenOwnedByPlayer(vehicle,false)
    Citizen.InvokeNative(0xAD738C3085FE7E11, vehicle, false, true) -- set not as mission entity
    SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle))
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
end

RegisterNetEvent('esx_2KGarage:reloadGarages')
AddEventHandler('esx_2KGarage:reloadGarages', function()
	ESX.TriggerServerCallback('esx_2KGarage:getOwnedProperties', function(properties)
      userProperties = properties
            for zoneKey,zoneValues in pairs(Config.Garages)do
                if zoneValues.Propriedade and has_value(userProperties, zoneValues.Propriedade) then
                    hasProperty = true
              else
					hasProperty = false
             end
          end
     end)
end)

function has_value (tab, val)
	for index, value in ipairs(tab) do
			if value == val then
					return true
			end
	end

	return false
end