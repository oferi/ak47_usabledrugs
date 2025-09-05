fx_version 'adamant'
game 'gta5'
name "ak47_usabledrugs"
author "MenanAk47 (MenanAk47#3129)"
description "MenanAk47 - Optimized Usable Drugs (ox_inventory version)"
version "2.0"

dependencies {
    'ox_inventory'
}

server_scripts {
	'locales/en.lua',
	'config.lua',
	'server/loader.lua',
}

client_scripts {
	'locales/en.lua',
	'config.lua',
	'client/editable.lua',
	'client/loader.lua',
}
