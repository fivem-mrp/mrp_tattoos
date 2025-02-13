fx_version 'adamant'
games { 'gta5' }

description 'MRP Tattoos'
version '0.0.1'

client_scripts {
	'jaymenu.lua',
	'config.lua',
	'client.lua'
}

server_scripts {
	'server.lua'
}

files {
  'mpheist3/shop_tattoo.meta',
  'mpheist3/mpheist3_overlays.xml',
  'mpvinewood/shop_tattoo.meta',
  'mpvinewood/mpvinewood_overlays.xml',
  'mpheist4/shop_tattoo.meta',
  'mpheist4/mpheist4_overlays.xml',
  'AllTattoos.json',
}

data_file 'TATTOO_SHOP_DLC_FILE' 'mpheist3/shop_tattoo.meta'
data_file 'PED_OVERLAY_FILE' 'mpheist3/mpheist3_overlays.xml'
data_file 'TATTOO_SHOP_DLC_FILE' 'mpvinewood/shop_tattoo.meta'
data_file 'PED_OVERLAY_FILE' 'mpvinewood/mpvinewood_overlays.xml'
data_file 'TATTOO_SHOP_DLC_FILE' 'mpheist4/shop_tattoo.meta'
data_file 'PED_OVERLAY_FILE' 'mpheist4/mpheist4_overlays.xml'