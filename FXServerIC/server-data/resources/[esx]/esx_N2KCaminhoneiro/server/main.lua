ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
MySQL.ready(function()
	Citizen.Wait(1500)
	MySQL.Async.fetchAll('SELECT * FROM trucker_cargas', {}, function(cargas)

			for i=1, #cargas, 1 do
				local position_empresa    = nil
				local position_carga   = nil
				local position_entrega  = nil
				local model    = nil
				local status  = nil

				if cargas[i].position_a then
					position_empresa = json.decode(cargas[i].position_a)
				end

				if cargas[i].position_b then
					position_carga = json.decode(cargas[i].position_b)
				end

				if cargas[i].position_c then
					position_entrega = json.decode(cargas[i].position_c)
				end

				if cargas[i].status == 0 then
					status = false
				else
					status = true
				end

				table.insert(Config.Cargas, {
					carga_id  = name,
					label     = nome_carga,
					empresa  = position_empresa,
					position_carga      = position_carga,
					position_entrega    = position_entrega,
					model   = model,
					reward      = reward,
					status   = status
				})
			end

			TriggerClientEvent('esx_N2KCaminhoneiro:sendCargas', -1, Config.Cargas)
	end)
end)

RegisterServerEvent("esx_N2KCaminhoneiro:IniciarEntrega")
AddEventHandler("esx_N2KCaminhoneiro:IniciarEntrega", function(carga, nome)
	if Config.Cargas.status then
		TriggerClientEvent("esx:showNotification", source, "Você escolheu a carga de "..nome)
		Config.Cargas.status = false
	else
		TriggerClientEvent("esx:showNotification", source, "Esta carga está indisponível!")
	end
end)

ESX.RegisterServerCallback('esx_N2KCaminhoneiro:getCargas', function(source, cb)
	cb(Config.Cargas)
end)