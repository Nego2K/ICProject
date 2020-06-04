local webhook = 'https://discordapp.com/api/webhooks/717938888160575530/JVpU6vUQfurxREz61aPp7qcm6w2ayxt0seHTdYRK8I6EZ9dPPMcpcCjjKhCtok2aKM8f'
local footer = 'Logs Imperio City'
local color = '5015295'


AddEventHandler('chatMessage', function(source, playername, message)
    DiscordWebHook(playername, message)
end)

AddEventHandler('playerConnecting', function() 
    DiscordWebHook("Login server", "**" .. GetPlayerName(source) .. "** Está conectando na cidade.", 3066993)
end)

AddEventHandler('OnClientMapStart', function()
	DiscordWebHook("Spwanado", "**" .. GetPlayerName(source) .. "** chegou com sucesso e foi spwnado.", 10181046)
end)

AddEventHandler('playerDropped', function(reason)
	if reason == "Exiting" then
		reason = "Saiu"
	end
	
	DiscordWebHook("Server Logout", "**" .. GetPlayerName(source) .. "** deixou a cidade. \n **Motivo: **" .. reason, 15158332)
end)

function DiscordWebHook(name, message, color)
  local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = footer,
            },
        }
    }
  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = GetPlayerName(source), embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end