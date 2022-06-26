fx_version 'cerulean'
game 'gta5'

author 'Project Koala'
description 'Official Koala-CityHall for ESX Legacy'
version '1.0.0'
lua54 'yes'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'nui/ui.html'

files {
    'nui/ui.html',
    'nui/script.js',
    'nui/index.css',
}
