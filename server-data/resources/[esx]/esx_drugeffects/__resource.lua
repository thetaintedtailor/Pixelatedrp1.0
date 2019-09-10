resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Drug Effects'

version '0.0.5'

server_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/drugs/narcotic.lua',
	'client/drugs/prescription.lua',
	'client/narcotics/drugs/weed.lua',
	'client/narcotics/drugs/opium.lua',
	'client/narcotics/drugs/meth.lua',
	'client/narcotics/drugs/coke.lua',
	'client/narcotics/drugs/crack.lua',
	'client/drugs/prescriptions/k3v.lua',
	'client/drugs/prescriptions/xanax.lua',
	'client/drugs/prescriptions/vicodin.lua',
	'client/main.lua'
}
