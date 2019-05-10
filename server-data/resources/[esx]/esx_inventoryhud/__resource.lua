resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

description 'ESX Inventory HUD'

version '1.1'

ui_page 'html/ui.html'

client_scripts {
  '@es_extended/locale.lua',
  'client/main.lua',
  'locales/cs.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'config.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'server/main.lua',
  'locales/cs.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'config.lua'
}

files {
    'html/ui.html',
    'html/css/contextMenu.min.css',
    'html/css/jquery.dialog.min.css',
    'html/css/ui.min.css',
    'html/js/config.js',
    'html/js/contextMenu.min.js',
    'html/js/jquery.dialog.min.js',
    'html/locales/cs.js',
    'html/locales/en.js',
    'html/locales/fr.js',
    'html/fonts/osifont.ttf',
    -- ICONS
    'html/img/items/bandage.png',
    'html/img/items/beer.png',
    'html/img/items/binoculars.png',
    'html/img/items/bread.png',
    'html/img/items/cannabis.png',
    'html/img/items/cigarette.png',
    'html/img/items/clip.png',
    'html/img/items/cocacola.png',
    'html/img/items/coffee.png',
    'html/img/items/coke.png',
    'html/img/items/gold.png',
    'html/img/items/hamburger.png',
    'html/img/items/cash.png',
    'html/img/items/chocolate.png',
    'html/img/items/iron.png',
    'html/img/items/jewels.png',
    'html/img/items/medikit.png',
    'html/img/items/tequila.png',
    'html/img/items/whisky.png',
    'html/img/items/limonade.png',
    'html/img/items/phone.png',
    'html/img/items/vodka.png',
    'html/img/items/water.png',
    'html/img/items/cupcake.png',
    'html/img/items/drpepper.png',
    'html/img/items/energy.png',
    'html/img/items/croquettes.png',
    'html/img/items/bolpistache.png',
    'html/img/items/bolnoixcajou.png',
    'html/img/items/bolcacahuetes.png',
    'html/img/items/fixkit.png',
    'html/img/items/bolchips.png',
    'html/img/items/black_money.png',
    'html/img/items/WEAPON_APPISTOL.png',
    'html/img/items/WEAPON_ADVANCEDRIFLE.png',
    'html/img/items/WEAPON_ASSAULTSHOTGUN.png',
    'html/img/items/WEAPON_BOTTLE.png',
    'html/img/items/WEAPON_BULLPUPRIFLE.png',
    'html/img/items/WEAPON_CARBINERIFLE.png',
    'html/img/items/WEAPON_COMBATMG.png',
    'html/img/items/WEAPON_BAT.png',
    'html/img/items/WEAPON_COMBATPISTOL.png',
    'html/img/items/WEAPON_CROWBAR.png',
    'html/img/items/WEAPON_GOLFCLUB.png',
    'html/img/items/WEAPON_KNIFE.png',
    'html/img/items/WEAPON_MACHETE.png',
    'html/img/items/WEAPON_MICROSMG.png',
    'html/img/items/WEAPON_NIGHTSTICK.png',
    'html/img/items/WEAPON_HAMMER.png',
    'html/img/items/WEAPON_PISTOL.png',
    'html/img/items/WEAPON_PUMPSHOTGUN.png',
    'html/img/items/WEAPON_SAWNOFFSHOTGUN.png',
    'html/img/items/WEAPON_SMG.png',
    'html/img/items/WEAPON_STUNGUN.png',
    'html/img/items/WEAPON_SPECIALCARBINE.png',
    'html/img/items/WEAPON_KNUCKLE.png',
    'html/img/items/WEAPON_FLASHLIGHT.png',
    'html/img/items/WEAPON_REVOLVER.png',
    'html/img/items/WEAPON_DAGGER.png',
    'html/img/items/WEAPON_PETROLCAN.png',
    'html/img/items/WEAPON_PISTOL50.png',
    'html/img/items/WEAPON_DBSHOTGUN.png',
    'html/img/items/WEAPON_SWITCHBLADE.png',
    'html/img/items/WEAPON_POOLCUE.png',
    'html/img/items/blowpipe.png',
    'html/img/items/clothe.png',
    'html/img/items/coke.png',
    'html/img/items/coke_pooch.png',
    'html/img/items/contract.png',
    'html/img/items/copper.png',
    'html/img/items/cutted_wood.png',
    'html/img/items/diamond.png',
    'html/img/items/essence.png',
    'html/img/items/fabric.png',
    'html/img/items/fish.png',
    'html/img/items/lockpick.png',
    'html/img/items/meth.png',
    'html/img/items/meth_pooch.png',
    'html/img/items/packaged_chicken.png',
    'html/img/items/petrol.png',
    'html/img/items/petrol_raffin.png',
    'html/img/items/repairkit.png',
    'html/img/items/slaughtered_chicken.png',
    'html/img/items/stone.png',
    'html/img/items/washed_stone.png',
    'html/img/items/weed.png',
    'html/img/items/weed_pooch.png',
    'html/img/items/wood.png',
    'html/img/items/wool.png',
    'html/img/items/alive_chicken.png',
    'html/img/items/scratchoff.png',
    'html/img/items/burger.png',
    'html/img/items/coffee.png',
    'html/img/items/donut.png',
    'html/img/items/oxygen_mask.png',
    'html/img/items/picnic.png',
    'html/img/items/redgull.png',
    'html/img/items/rose.png',
    'html/img/items/sandwich.png',
    'html/img/items/nitro.png',
}
