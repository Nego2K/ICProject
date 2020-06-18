resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX XP System'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/sv_main.lua'
}

client_scripts {
	'config.lua',
	'client/classes/xp_data.lua',
	'client/cl_main.lua'
}