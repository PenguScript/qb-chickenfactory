fx_version 'cerulean'
game 'gta5'

author 'PenguScripts'   --rewritten by oosayeroo
description 'qb-chickenjob'
version '3.1.0'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
	'client/menus.lua',
	'client/deliveries.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}
