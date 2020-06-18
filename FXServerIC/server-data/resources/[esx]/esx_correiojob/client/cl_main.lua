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

local Status = {
	DELIVERY_INACTIVE                 = 0,
	PLAYER_INIT_JOB			  		  = 1,
	PLAYER_REACHED_CARGA_POINT        = 2,
	PLAYER_CARRING_TRUCK			  = 3,
	PLAYER_STARTED_DELIVERY           = 4,
	PLAYER_REACHED_VEHICLE_POINT      = 5,
	PLAYER_REMOVED_GOODS_FROM_VEHICLE = 6,
	PLAYER_REACHED_DELIVERY_POINT     = 7,
	PLAYER_RETURNING_TO_BASE          = 8
}

local truck_pos = {
	[0] = {x = 0.25, y = -1.2,z = -0.05},
	[1] = {x = -0.25, y = -1.2,z = -0.05},
	[2] = {x = 0.25, y = -1.65,z = -0.05},
	[3] = {x = -0.25, y = -1.65,z = -0.05},
	[4] = {x = 0.25, y = -2.1,z = -0.05},
	[5] = {x = -0.25, y = -2.1,z = -0.05},
	[6] = {x = 0.25, y = -2.55,z = -0.05},
	[7] = {x = -0.25, y = -2.55,z = -0.05},
	[8] = {x = 0.25, y = -3.0,z = -0.05},
	[9] = {x = -0.25, y = -3.0,z = -0.05}
}

local truck2_pos = {
	[0] = {x = 1.00, y = 1.25,z = 0.10},
	[1] = {x = 0.50, y = 1.25,z = 0.10},
	[2] = {x = 0.00, y = 1.25,z = 0.10},
	[3] = {x = -0.50, y = 1.25,z = 0.10},
	[4] = {x = -1.00, y = 1.25,z = 0.10},
	[5] = {x = 1.00, y = 0.85,z = 0.10},
	[6] = {x = 0.50, y = 0.85,z = 0.10},
	[7] = {x = 0.00, y = 0.85,z = 0.10},
	[8] = {x = -0.50, y = 0.85,z = 0.10},
	[9] = {x = -1.00, y = 0.85,z = 0.10},
	[10] = {x = 1.00, y = 0.45,z = 0.10},
	[11] = {x = 0.50, y = 0.45,z = 0.10},
	[12] = {x = 0.00, y = 0.45,z = 0.10},
	[13] = {x = -0.50, y = 0.45,z = 0.10},
	[14] = {x = -1.00, y = 0.45,z = 0.10},
	[15] = {x = 1.00, y = 0.05,z = 0.10},
	[16] = {x = 0.50, y = 0.05,z = 0.10},
	[17] = {x = 0.00, y = 0.05,z = 0.10},
	[18] = {x = -0.50, y = 0.05,z = 0.10},
	[19] = {x = -1.00, y = 0.05,z = 0.10},
	[20] = {x = 1.00, y = -0.35,z = 0.10},
	[21] = {x = 0.50, y = -0.35,z = 0.10},
	[22] = {x = 0.00, y = -0.35,z = 0.10},
	[23] = {x = -0.50, y = -0.35,z = 0.10},
	[24] = {x = -1.00, y = -0.35,z = 0.10},
	[25] = {x = 1.00, y = -0.75,z = 0.10},
	[26] = {x = 0.50, y = -0.75,z = 0.10},
	[27] = {x = 0.00, y = -0.75,z = 0.10},
	[28] = {x = -0.50, y = -0.75,z = 0.10},
	[29] = {x = -1.00, y = -0.75,z = 0.10},
	[30] = {x = 1.00, y = -1.15,z = 0.10},
	[31] = {x = 0.50, y = -1.15,z = 0.10},
	[32] = {x = 0.00, y = -1.15,z = 0.10},
	[33] = {x = -0.50, y = -1.15,z = 0.10},
	[34] = {x = -1.00, y = -1.15,z = 0.10},
	[35] = {x = 1.00, y = -1.55,z = 0.10},
	[36] = {x = 0.50, y = -1.55,z = 0.10},
	[37] = {x = 0.00, y = -1.55,z = 0.10},
	[38] = {x = -0.50, y = -1.55,z = 0.10},
	[39] = {x = -1.00, y = -1.55,z = 0.10}
}

ESX                           = nil

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentSubtitle           = nil
local CurrentBlip               = nil
local CurrentType               = nil
local CurrentVehicle            = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local CurrentAttachments        = {}
local CaminhaoAttachments = {}
local DeliveryLocation          = {}
local DeliveryComplete          = {}
local DeliveryRoutes            = {}
local MotoAttachments = {}
local times = 0
local FinishedJobs              = 0
local CurrentStatus           = Status.DELIVERY_INACTIVE



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

AddEventHandler('esx_correiojob:hasEnteredMarker', function(zone)
	if zone == 'CorreioActions' then
		CurrentAction     = 'correio_actions_menu'
		CurrentActionMsg  = 'Pressione ~INPUT_CONTEXT~ para abirir o Menu'
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_correiojob:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

function DrawSub(text, time)
	ClearPrints()
	SetTextEntry_2('STRING')
	AddTextComponentString(text)
	DrawSubtitleTimed(time, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'correio' then
			local coords = GetEntityCoords(PlayerPedId())

			for k,v in pairs(Config.Zones) do
				if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 180.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, true, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if PlayerData.job ~= nil and PlayerData.job.name == 'correio' then

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
				TriggerEvent('esx_correiojob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_correiojob:hasExitedMarker', LastZone)
			end

		end
	end
end)

function HandleInput()
	if PlayerData.job.name ~= 'correio' then
		return
	end
	
	if CurrentStatus == Status.PLAYER_REMOVED_GOODS_FROM_VEHICLE or CurrentStatus == Status.PLAYER_CARRING_TRUCK then
		DisableControlAction(0, 21, true)
	else
		Wait(500)
	end
end

function HandleLogic(howMany)
	
	if PlayerData.job.name ~= 'correio' then
		return
	end
	local playerPed = GetPlayerPed(-1)
	local pCoords   = GetEntityCoords(playerPed)
	
	if CurrentStatus ~= Status.DELIVERY_INACTIVE then
		if IsPedDeadOrDying(playerPed, true) then
			FinishDelivery(CurrentType, false)
			return
		elseif GetVehicleEngineHealth(CurrentVehicle) < 20 and CurrentVehicle ~= nil then
			FinishDelivery(CurrentType, false)
			return
		end
	
		if CurrentStatus == Status.PLAYER_INIT_JOB then
			if not IsPlayerInsideDeliveryVehicle() then
				CurrentSubtitle = 'Vá até o veículo'
			else
				CurrentSubtitle = 'Leve o veículo até a zona de carga'
			end
			
			if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, Config.SpawnZones.CargaZone.Pos.x, Config.SpawnZones.CargaZone.Pos.y, Config.SpawnZones.CargaZone.Pos.z, true) < 1.5 then
				CurrentStatus = Status.PLAYER_REACHED_CARGA_POINT
				portasFunc()
				PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", false, 0, true)
			end
		end
		
		if CurrentStatus == Status.PLAYER_REACHED_CARGA_POINT then
			CurrentSubtitle = 'Carregue o veículo com as encomendas para entrega!'
			if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, Config.SpawnZones.CargaZone.Pos1.x, Config.SpawnZones.CargaZone.Pos1.y, Config.SpawnZones.CargaZone.Pos1.z, true) < 1.5 then
				CurrentStatus = Status.PLAYER_CARRING_TRUCK
				CurrentSubtitle = 'Leve a encomenda até o veículo'
				if CurrentType == 'scooter' then
					TakePropScooter()
				else
					GetPlayerPropsForDelivery(CurrentType)
				end
			end
		end
		
		if CurrentStatus == Status.PLAYER_CARRING_TRUCK then
			if not IsPlayerInsideDeliveryVehicle() then
				TrunkPos = GetEntityCoords(CurrentVehicle)
				TrunkForward = GetEntityForwardVector(CurrentVehicle)
				local ScaleFactor = 1.0
				
				for k, v in pairs(Config.Scales) do
					if k == CurrentType then
						ScaleFactor = v
					end
				end
				
				TrunkPos = TrunkPos - (TrunkForward * ScaleFactor)
				TrunkHeight = TrunkPos.z
				TrunkHeight = TrunkPos.z + 0.7
				
				local ArrowSize = {x = 0.8, y = 0.8, z = 0.8}
				
				DrawMarker(20, TrunkPos.x, TrunkPos.y, TrunkHeight, 0, 0, 0, 180.0, 0, 0, ArrowSize.x, ArrowSize.y, ArrowSize.z, 102, 217, 239, 150, true, true)
				
				if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, TrunkPos.x, TrunkPos.y, TrunkHeight, true) < 1.0 then
						RemovePlayerProps()
						PutPropsInVehicle(CurrentType)
						print(howMany)
						print(times)
						times = times + 1
						if CurrentType == 'scooter' then
							times = howMany
						end
						
					if howMany > times then
						CurrentStatus = Status.PLAYER_REACHED_CARGA_POINT
					else
						CurrentStatus = Status.PLAYER_STARTED_DELIVERY
						portasFunc()
						CreateRoute(deliveryType, howMany)
						GetNextDeliveryPoint(true)
					end
				end
			end
		end
		
		if CurrentStatus == Status.PLAYER_STARTED_DELIVERY then
			
			if not IsPlayerInsideDeliveryVehicle() then
				CurrentSubtitle = 'Vá até o veículo e leve as encomendas até o ponto de entrega'
			else
				CurrentSubtitle = nil
			end
			if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, DeliveryLocation.Item1.x, DeliveryLocation.Item1.y, DeliveryLocation.Item1.z, true) < 1.5 then
				CurrentStatus = Status.PLAYER_REACHED_VEHICLE_POINT
				CurrentSubtitle = 'Saia do veículo e pegue uma ~y~encomenda~w~!'
				PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", false, 0, true)
			end
		end
		
		if CurrentStatus == Status.PLAYER_REMOVED_GOODS_FROM_VEHICLE then
			if CurrentType == 'truck2' or CurrentType == 'truck' then
				CurrentSubtitle = 'Leve as ~y~caixas~w~ para o próximo destino!'
				if CurrentType == 'truck2' or CurrentType == 'truck' then
					if not IsEntityPlayingAnim(playerPed, "anim@heists@box_carry@", "walk", 3) then
						ForceCarryAnimation()
					end
				end
			end
			
			if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, DeliveryLocation.Item2.x, DeliveryLocation.Item2.y, DeliveryLocation.Item2.z, true) < 1.5 then
				
				--TriggerServerEvent("esx_deliveries:finishDelivery:server", CurrentType)
				PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", false, 0, true)
				times = times - 1
				
				FinishedJobs = FinishedJobs + 1
				
				ESX.ShowNotification('Você concluiu ' .. FinishedJobs .. "/" .. #DeliveryRoutes..' entrega(s)')
				print(FinishedJobs)
				print(#DeliveryRoutes)
				if FinishedJobs >= #DeliveryRoutes then
					RemovePlayerProps()
					RemoveBlip(CurrentBlip)
					DeliveryLocation.Item1 = Config.Base.retveh
					DeliveryLocation.Item2 = {x = 0, y = 0, z = 0}
					CurrentBlip            = CreateBlipAt(DeliveryLocation.Item1.x, DeliveryLocation.Item1.y, DeliveryLocation.Item1.z)
					CurrentSubtitle        = 'Volte para o deposito para guardar o veículo!'
					CurrentStatus          = Status.PLAYER_RETURNING_TO_BASE
					return
				else
					print('Ola')
					RemovePlayerProps()
					GetNextDeliveryPoint(false)
					CurrentStatus = Status.PLAYER_STARTED_DELIVERY
					CurrentSubtitle = 'Dirija para o próximo destino'
					PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", false, 0, true)
				end
			end
		end
		
	else
		Citizen.Wait(500)
	end
end

function TakePropScooter()
	RequestAnimDict("anim@heists@box_carry@")
	while not HasAnimDictLoaded("anim@heists@box_carry@") do
		Citizen.Wait(0)
	end
	
	TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "walk", 8.0, 8.0, -1, 51)
		
		local ModelHash = GetHashKey("hei_heist_acc_box_trinket_01")
		
		WaitModelLoad(ModelHash)
		
		local PlayerPed = GetPlayerPed(-1)
		local PlayerPos = GetOffsetFromEntityInWorldCoords(PlayerPed, 0.0, 0.0, -5.0)
		local Object = CreateObject(ModelHash, PlayerPos.x, PlayerPos.y, PlayerPos.z, true, false, false)
		
		AttachEntityToEntity(Object, PlayerPed, GetPedBoneIndex(PlayerPed, 28422), 0.0, 0.0, -0.30, 0.0, 0.0, 0.0, true, false, false, true, 1, true)
		table.insert(CurrentAttachments, Object)
end
	

function HandleMarkers()
	
	if PlayerData.job.name ~= 'correio' then
		return
	end
	
	local pCoords = GetEntityCoords(GetPlayerPed(-1))
	local deleter = Config.Base.deleter
	
	if CurrentStatus ~= Status.DELIVERY_INACTIVE then
		form = setupScaleform("instructional_buttons")
		DrawScaleformMovieFullscreen(form, 255, 255, 255, 255, 0)
		if  IsControlJustPressed(1, 74) and IsControlPressed(1, 21) then
				EndDelivery()
				ESX.ShowNotification('Você cancelou o serviço!')
				return
		end
		
		--[[if IsControlJustPressed(1, 21) and IsControlPressed(0, 47) then
			TrunkPos = GetEntityCoords(CurrentVehicle)
			TrunkForward = GetEntityForwardVector(CurrentVehicle)
			TrunkPos = TrunkPos - (TrunkForward * 4.5)
			TrunkHeight = TrunkPos.z + 0.7
			if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, TrunkPos.x, TrunkPos.y, TrunkHeight, true) < 1.0 then
				SetVehicleDoorShut(CurrentVehicle, 3, false)
				SetVehicleDoorShut(CurrentVehicle, 2, false)
			else
				ESX.ShowNotification('Você precisa estar perto da porta traseira!')
			end
		end]]
		
		if CurrentStatus == Status.PLAYER_INIT_JOB then
			DrawMarker(20, Config.SpawnZones.CargaZone.Pos.x, Config.SpawnZones.CargaZone.Pos.y, Config.SpawnZones.CargaZone.Pos.z + 2, 0, 0, 0, 0, 180.0, 0, 1.5, 1.5, 1.5, 102, 217, 239, 150, true, true)
		end
		
		if CurrentStatus == Status.PLAYER_REACHED_CARGA_POINT then
			DrawMarker(20, Config.SpawnZones.CargaZone.Pos1.x, Config.SpawnZones.CargaZone.Pos1.y, Config.SpawnZones.CargaZone.Pos1.z + 2, 0, 0, 0, 0, 180.0, 0, 1.5, 1.5, 1.5, 102, 217, 239, 150, true, true)
		end
		
		if CurrentStatus == Status.PLAYER_STARTED_DELIVERY then
			if not IsPlayerInsideDeliveryVehicle() and CurrentVehicle ~= nil then
				local VehiclePos = GetEntityCoords(CurrentVehicle)
				local ArrowHeight = VehiclePos.z
				ArrowHeight = VehiclePos.z + 1.0
				
				if CurrentType == 'truck2' then
					ArrowHeight = ArrowHeight + 2.5
				elseif CurrentType == 'truck' then
					ArrowHeight = ArrowHeight + 2.0
				end
				
				DrawMarker(20, VehiclePos.x, VehiclePos.y, ArrowHeight, 0, 0, 0, 0, 180.0, 0, 0.8, 0.8, 0.8, 102, 217, 239, 150, true, true)
			else
				local dl = DeliveryLocation.Item1
				if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, dl.x, dl.y, dl.z, true) < 150 then
					DrawMarker(20, dl.x, dl.y, dl.z, 0, 0, 0, 0, 180.0, 0, 1.5, 1.5, 1.5, 102, 217, 239, 150, true, true)
				end
			end
		end
		
		if CurrentStatus == Status.PLAYER_REACHED_VEHICLE_POINT then
			if not IsPlayerInsideDeliveryVehicle() then
				TrunkPos = GetEntityCoords(CurrentVehicle)
				TrunkForward = GetEntityForwardVector(CurrentVehicle)
				local ScaleFactor = 1.0
				
				for k, v in pairs(Config.Scales) do
					if k == CurrentType then
						ScaleFactor = v
					end
				end
				
				TrunkPos = TrunkPos - (TrunkForward * ScaleFactor)
				TrunkHeight = TrunkPos.z
				TrunkHeight = TrunkPos.z + 0.7
				
				local ArrowSize = {x = 0.8, y = 0.8, z = 0.8}
				
				DrawMarker(20, TrunkPos.x, TrunkPos.y, TrunkHeight, 0, 0, 0, 180.0, 0, 0, ArrowSize.x, ArrowSize.y, ArrowSize.z, 102, 217, 239, 150, true, true)
				
				if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, TrunkPos.x, TrunkPos.y, TrunkHeight, true) < 1.0 then
						portasFunc()
						Citizen.Wait(1000)
						GetPlayerPropsForDelivery(CurrentType)
						DetachEntity(CaminhaoAttachments[times])
						DeleteEntity(CaminhaoAttachments[times])
						CurrentStatus = Status.PLAYER_REMOVED_GOODS_FROM_VEHICLE
						Citizen.Wait(500)
						portasFunc()
				end
			end
		end
		
		if CurrentStatus == Status.PLAYER_REMOVED_GOODS_FROM_VEHICLE then
			local dp = DeliveryLocation.Item2
			DrawMarker(20, dp.x, dp.y, dp.z, 0, 0, 0, 0, 180.0, 0, 1.5, 1.5, 1.5, 102, 217, 239, 150, true, true)
		end
		
		if CurrentStatus == Status.PLAYER_RETURNING_TO_BASE then
			local dp = Config.Base.deleter
			DrawMarker(20, dp.x, dp.y, dp.z, 0, 0, 0, 0, 180.0, 0, 1.5, 1.5, 1.5, 102, 217, 239, 150, true, true)
			if GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, dp.x, dp.y, dp.z) < 1.5 then
				ESX.ShowHelpNotification('Pressione ~INPUT_CONTEXT~ para devolver o veículo!')
				if IsControlJustReleased(0, 51) then
					TriggerServerEvent('esx_correiojob:payDelivery', FinishedJobs)
					Citizen.Wait(500)
					EndDelivery()
					return
				end
			end
		end
	end
end

function ReturnVehicle(deliveryType)
	SetVehicleAsNoLongerNeeded(CurrentVehicle)
	DeleteEntity(CurrentVehicle)
	ESX.ShowNotification('Veículo entregue!')
	FinishDelivery(deliveryType, true)
end

function ReturnToBase(deliveryType)
	CurrentBlip = CreateBlipAt(Config.Base.retveh.x, Config.Base.retveh.y, Config.Base.retveh.z)
end

function EndDelivery()
	local PlayerPed = GetPlayerPed(-1)
	if not IsPedSittingInAnyVehicle(PlayerPed) or GetVehiclePedIsIn(PlayerPed) ~= CurrentVehicle then
		FinishDelivery(CurrentType, false)
	else
		ReturnVehicle(CurrentType)
	end
end

function FinishDelivery(deliveryType, safeReturn)
	if CurrentVehicle ~= nil then
		for i = 0, #CaminhaoAttachments do
			DetachEntity(CaminhaoAttachments[i])
			DeleteEntity(CaminhaoAttachments[i])
		end
		for i = 0, #MotoAttachments do
			DetachEntity(MotoAttachments[i])
			DeleteEntity(MotoAttachments[i])
		end
		CaminhaoAttachments = {}
		MotoAttachments = {}
		DeleteEntity(CurrentVehicle)
	end
	
	CurrentStatus    = Status.DELIVERY_INACTIVE
	CurrentVehicle   = nil
	CurrentSubtitle  = nil
	times     = 0
	FinishedJobs     = 0
	DeliveryRoutes   = {}
	DeliveryComplete = {}
	DeliveryLocation = {}
	
	if CurrentBlip ~= nil then
		RemoveBlip(CurrentBlip)
	end
	
	CurrentBlip = nil
	CurrentType = ''
	
	--TriggerServerEvent("esx_deliveries:returnSafe:server", deliveryType, safeReturn)
	
	--LoadDefaultPlayerSkin()
end

function CreateBlipAt(x, y, z)
	
	local tmpBlip = AddBlipForCoord(x, y, z)
	
	SetBlipSprite(tmpBlip, 1)
	SetBlipColour(tmpBlip, 66)
	SetBlipAsShortRange(tmpBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Destino")
	EndTextCommandSetBlipName(blip)
	SetBlipAsMissionCreatorBlip(tmpBlip, true)
	SetBlipRoute(tmpBlip, true)
	
	return tmpBlip
end


function PutPropsInVehicle(deliveryTypes)
	if deliveryTypes == 'truck' then
		local ModelHash = GetHashKey("hei_prop_heist_box")
		local coordsVeh = GetOffsetFromEntityInWorldCoords(CurrentVehicle,0.0,0.0,-5.0)
		
		WaitModelLoad(ModelHash)
		
		local Object1 = CreateObject(ModelHash, coordsVeh.x, coordsVeh.y, coordsVeh.z, true, false, false)
						
		AttachEntityToEntity(Object1,CurrentVehicle,0.0,truck_pos[times].x,truck_pos[times].y,truck_pos[times].z,0.0,0.0,0.0,false,false,true,false,2,true)
		table.insert(CaminhaoAttachments, Object1)
	elseif deliveryTypes == 'truck2' then
		local ModelHash = GetHashKey("hei_prop_heist_box")
		local coordsVeh = GetOffsetFromEntityInWorldCoords(CurrentVehicle,0.0,0.0,-5.0)
		
		WaitModelLoad(ModelHash)
		
		local Object1 = CreateObject(ModelHash, coordsVeh.x, coordsVeh.y, coordsVeh.z, true, false, false)
						
		AttachEntityToEntity(Object1,CurrentVehicle,0.0,truck2_pos[times].x,truck2_pos[times].y,truck2_pos[times].z,0.0,0.0,0.0,false,false,true,false,2,true)
		table.insert(CaminhaoAttachments, Object1)
	elseif deliveryTypes == 'scooter' then
		local ModelHash = GetHashKey("hei_heist_acc_box_trinket_01")
		local coordsVeh = GetOffsetFromEntityInWorldCoords(CurrentVehicle,0.0,0.0,-5.0)
		
		WaitModelLoad(ModelHash)
		
		local Object1 = CreateObject(ModelHash, coordsVeh.x, coordsVeh.y, coordsVeh.z, true, false, false)
						
		AttachEntityToEntity(Object1,CurrentVehicle,0.0,0.0,-0.80,0.30,0.0,0.0,0.0,false,false,true,false,2,true)
		table.insert(MotoAttachments, Object1)
	end
end

function CreateRoute(deliveryType, howMany)
	
	local TotalDeliveries = howMany
	local DeliveryPoints = {}
	
	if deliveryType == 'scooter' then
		DeliveryPoints = Config.DeliveryLocationsScooter
	elseif deliveryType == 'truck2' then
		DeliveryPoints = Config.DeliveryLocationsVan
	else
		DeliveryPoints = Config.DeliveryLocationsTruck
	end
	
	while #DeliveryRoutes < howMany do
		Wait(1)
		local PreviousPoint = nil
		if #DeliveryRoutes < 1 then
			PreviousPoint = GetEntityCoords(GetPlayerPed(-1))
		else
			PreviousPoint = DeliveryRoutes[#DeliveryRoutes].Item1
		end
		
		local Rnd             = GetRandomFromRange(1, #DeliveryPoints)
		local NextPoint       = DeliveryPoints[Rnd]
		local HasPlayerAround = false
		
		for i = 1, #DeliveryRoutes do
			local Distance = GetDistanceBetweenCoords(NextPoint.Item1.x, NextPoint.Item1.y, NextPoint.Item1.z, DeliveryRoutes[i].x, DeliveryRoutes[i].y, DeliveryRoutes[i].z, true)
			if Distance < 50 then
				HasPlayerAround = true
			end
		end
		
		if not HasPlayerAround then
			table.insert(DeliveryRoutes, NextPoint)
			table.insert(DeliveryComplete, false)
		end
	end
end

function PlayTrunkAnimation()
	Citizen.CreateThread(function()
		if CurrentType == 'truck' then
			SetVehicleDoorOpen(CurrentVehicle, 2, false, false)
			SetVehicleDoorOpen(CurrentVehicle, 3, false, false)
		elseif CurrentType == 'truck2' then
			SetVehicleDoorOpen(CurrentVehicle, 2, false, false)
			SetVehicleDoorOpen(CurrentVehicle, 3, false, false)
		end
		Wait(1000)
	end)
end

function RemovePlayerProps()
	for i = 0, #CurrentAttachments do
		DetachEntity(CurrentAttachments[i])
		DeleteEntity(CurrentAttachments[i])
	end
	ClearPedTasks(GetPlayerPed(-1))
	CurrentAttachments = {}
end

function IsPlayerInsideDeliveryVehicle()
	if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
		local playerVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		if playerVehicle == CurrentVehicle then
			return true
		end
	end
	return false
end

function GetPlayerPropsForDelivery(deliveryType)
	
	RequestAnimDict("anim@heists@box_carry@")
	while not HasAnimDictLoaded("anim@heists@box_carry@") do
		Citizen.Wait(0)
	end
		
	if deliveryType == 'scooter' then
		local ModelHash = GetHashKey("prop_paper_bag_01")
		local PlayerPed = GetPlayerPed(-1)
		local PlayerPos = GetOffsetFromEntityInWorldCoords(PlayerPed, 0.0, 0.0, -5.0)
		
			
		WaitModelLoad(ModelHash)
			
		local Object = CreateObject(ModelHash, PlayerPos.x, PlayerPos.y, PlayerPos.z, true, true, false)
			
		AttachEntityToEntity(Object, PlayerPed, GetPedBoneIndex(PlayerPed, 28422), 0.25, 0.0, 0.06, 65.0, -130.0, -65.0, true, true, false, true, 0, true)
		table.insert(CurrentAttachments, Object)
	end
	
	if deliveryType == 'truck2' then
		TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "walk", 8.0, 8.0, -1, 51)
		
		local ModelHash = GetHashKey('hei_prop_heist_box')
		WaitModelLoad(ModelHash)
		
		local PlayerPed = GetPlayerPed(-1)
		local PlayerPos = GetOffsetFromEntityInWorldCoords(PlayerPed, 0.0, 0.0, -5.0)
		local Object = CreateObject(ModelHash, PlayerPos.x, PlayerPos.y, PlayerPos.z, true, false, false)
		
		AttachEntityToEntity(Object, PlayerPed, GetPedBoneIndex(PlayerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, false, false, true, 1, true)
		table.insert(CurrentAttachments, Object)
	end
	
	if deliveryType == 'truck' then
		TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "walk", 8.0, 8.0, -1, 51)
		
		local ModelHash = GetHashKey("hei_prop_heist_box")
		
		WaitModelLoad(ModelHash)
		
		local PlayerPed = GetPlayerPed(-1)
		local PlayerPos = GetOffsetFromEntityInWorldCoords(PlayerPed, 0.0, 0.0, -5.0)
		local Object = CreateObject(ModelHash, PlayerPos.x, PlayerPos.y, PlayerPos.z, true, false, false)
		
		AttachEntityToEntity(Object, PlayerPed, GetPedBoneIndex(PlayerPed, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, false, false, true, 1, true)
		table.insert(CurrentAttachments, Object)
	end
end

function ForceCarryAnimation()
	TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "walk", 8.0, 8.0, -1, 51)
end

function GetNextDeliveryPoint(firstTime)
	if CurrentBlip ~= nil then
		RemoveBlip(CurrentBlip)
	end
	
	for i = 1, #DeliveryComplete do
		if not DeliveryComplete[i] then
			if not firstTime then
				DeliveryComplete[i] = true
				break
			end
		end
	end
	
	for i = 1, #DeliveryComplete do
		if not DeliveryComplete[i] then
			CurrentBlip = CreateBlipAt(DeliveryRoutes[i].Item1.x, DeliveryRoutes[i].Item1.y, DeliveryRoutes[i].Item1.z)
			DeliveryLocation = DeliveryRoutes[i]
			break
		end
	end
end

function SpawnDeliveryVehicle(deliveryType)
	
	local SpawnLocation = Config.SpawnZones.SpawnVehicleZone.Pos
	
	if deliveryType == 'scooter' then
		local ModelHash = GetHashKey('faggio')
		WaitModelLoad(ModelHash)
		ESX.Game.SpawnVehicle(ModelHash, SpawnLocation, 180.0, function(vehicle)
			CurrentVehicle = vehicle
		end)
	end
	
	if deliveryType == 'truck' then
		local ModelHash = GetHashKey('boxville4')
		WaitModelLoad(ModelHash)
		ESX.Game.SpawnVehicle(ModelHash, SpawnLocation, 180.0, function(vehicle)
			CurrentVehicle = vehicle
			SetVehicleLivery(CurrentVehicle, 2)
		end)
		
	end
	
	if deliveryType == 'truck2' then
		local ModelHash = GetHashKey('mule')
		ESX.Game.SpawnVehicle(ModelHash, SpawnLocation, 90.0, function(vehicle)
			CurrentVehicle = vehicle
			SetVehicleLivery(CurrentVehicle, 1)
		end)
	end
	
	DecorSetInt(CurrentVehicle, "Delivery.Rental", Config.DecorCode)
	SetVehicleOnGroundProperly(CurrentVehicle)
end

function portasFunc()
      if GetVehicleDoorAngleRatio(CurrentVehicle, 2) > 0.0 or GetVehicleDoorAngleRatio(CurrentVehicle, 3) > 0.0 then 
         SetVehicleDoorShut(CurrentVehicle, 2, false)
		 SetVehicleDoorShut(CurrentVehicle, 3, false)
       else
         SetVehicleDoorOpen(CurrentVehicle, 2, false)
		 SetVehicleDoorOpen(CurrentVehicle, 3, false)       
      end
end

function ServInit(howMany)
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			HandleInput()
		end
	end)
	
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			HandleLogic(howMany)
		end
	end)
	
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			HandleMarkers()
		end
	end)
end

function DrawSubs()
	Citizen.CreateThread(function ()
		while isDeliveryGoing do
			Citizen.Wait(0)
			if CurrentSubtitle ~= nil then
				DrawSub(CurrentSubtitle, 1)
			end
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'correio' then

				if CurrentAction == 'correio_actions_menu' then
					TriggerEvent('esx_correiojob:startJob:client', 3, 'truck')
					--IniciarRota(math.random(1, 4))
				end
				CurrentAction = nil
			end
		end
	end
end)

function WaitModelLoad(name)
	RequestModel(name)
	while not HasModelLoaded(name) do
		Wait(0)
	end
end

function GetRandomFromRange(a, b)
	return GetRandomIntInRange(a, b)
end

RegisterNetEvent('esx_correiojob:startJob:client')
AddEventHandler('esx_correiojob:startJob:client', function(howMany, deliveryType)
	SetTimeout(1000, function()				
		PlaySoundFrontend(-1, '5_SEC_WARNING', 'HUD_MINI_GAME_SOUNDSET', 1)
		ESX.ShowNotification('Calculando rota...')
		SetTimeout(5000, function()
			PlaySoundFrontend(-1, 'Event_Start_Text', 'GTAO_FM_Events_Soundset', 1)
			ESX.ShowNotification('Você terá '..howMany..' entregas!')
			isDeliveryGoing = true
			DrawSubs()
			ServInit(howMany)
		end)
	end)
	
	--LoadWorkPlayerSkin(deliveryType)
	SpawnDeliveryVehicle(deliveryType)
	CurrentType   = deliveryType
	CurrentStatus = Status.PLAYER_INIT_JOB
end)