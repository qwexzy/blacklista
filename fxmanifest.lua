fx_version 'cerulean'
game 'gta5'

version '0.1.3'
author 'Reece Stokes <hagen@hyena.gay>'
description 'FiveM resource for ACE-specific blacklisting.'
repository 'https://github.com/MrGriefs/dynamicblacklist'

shared_scripts {
  'ammotypes.lua',
  'config.lua',
}
client_scripts {
  'client.lua',
}
server_scripts {
  'server.lua',
}