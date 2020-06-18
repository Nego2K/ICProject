resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Caminhoneiro Job'

version '1.1.0'

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/cl_main.lua',
	'client/function.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'server/sv_main.lua'
}