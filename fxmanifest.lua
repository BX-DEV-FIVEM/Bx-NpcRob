fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'BX-NpcRob'
author 'BX-DEV'

description 'Npc robbery'
version 'V1.0'
url 'https://github.com/BX-DEV-FIVEM'


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}


client_scripts {

    'config.lua',
    'client/*.lua'
}


server_script {
    'config.lua',
    'version.lua',
    'server/*.lua'
}

