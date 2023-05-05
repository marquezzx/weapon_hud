local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local showOverlay = false
local Weapons = {
  [GetHashKey("WEAPON_UNARMED")] = {"WEAPON_UNARMED" },
  [GetHashKey("WEAPON_KNIFE")] = { "WEAPON_KNIFE" },
  [GetHashKey("WEAPON_NIGHTSTICK")] = { "WEAPON_NIGHTSTICK" },
  [GetHashKey("WEAPON_HAMMER")] = { "WEAPON_HAMMER" },
  [GetHashKey("WEAPON_BAT")] = { "WEAPON_BAT" },
  [GetHashKey("WEAPON_GOLFCLUB")] = { "WEAPON_GOLFCLUB" },
  [GetHashKey("WEAPON_CROWBAR")] = { "WEAPON_CROWBAR" },
  [GetHashKey("WEAPON_PISTOL")] = { "WEAPON_PISTOL" },
  [GetHashKey("WEAPON_COMBATPISTOL")] = { "WEAPON_COMBATPISTOL" },
  [GetHashKey("WEAPON_APPISTOL")] = { "WEAPON_APPISTOL" },
  [GetHashKey("WEAPON_PISTOL50")] = { "WEAPON_PISTOL50" },
  [GetHashKey("WEAPON_MICROSMG")] = { "WEAPON_MICROSMG" },
  [GetHashKey("WEAPON_SMG")] = { "WEAPON_SMG" },
  [GetHashKey("WEAPON_ASSAULTSMG")] = { "WEAPON_ASSAULTSMG" },
  [GetHashKey("WEAPON_ASSAULTRIFLE")] = { "WEAPON_ASSAULTRIFLE" },
  [GetHashKey("WEAPON_CARBINERIFLE")] = { "WEAPON_CARBINERIFLE" },
  [GetHashKey("WEAPON_ADVANCEDRIFLE")] = { "WEAPON_ADVANCEDRIFLE" },
  [GetHashKey("WEAPON_MG")] = { "WEAPON_MG" },
  [GetHashKey("WEAPON_COMBATMG")] = { "WEAPON_COMBATMG" },
  [GetHashKey("WEAPON_PUMPSHOTGUN")] = { "WEAPON_PUMPSHOTGUN" },
  [GetHashKey("WEAPON_SAWNOFFSHOTGUN")] = { "WEAPON_SAWNOFFSHOTGUN" },
  [GetHashKey("WEAPON_ASSAULTSHOTGUN")] = { "WEAPON_ASSAULTSHOTGUN" },
  [GetHashKey("WEAPON_BULLPUPSHOTGUN")] = { "WEAPON_BULLPUPSHOTGUN" },
  [GetHashKey("WEAPON_STUNGUN")] = { "WEAPON_STUNGUN" },
  [GetHashKey("WEAPON_SNIPERRIFLE")] = { "WEAPON_SNIPERRIFLE" },
  [GetHashKey("WEAPON_HEAVYSNIPER")] = { "WEAPON_HEAVYSNIPER" },
  [GetHashKey("WEAPON_GRENADELAUNCHER")] = { "WEAPON_GRENADELAUNCHER" },
  [GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE")] = { "WEAPON_GRENADELAUNCHER_SMOKE" },
  [GetHashKey("WEAPON_RPG")] = { "WEAPON_RPG" },
  [GetHashKey("WEAPON_MINIGUN")] = { "WEAPON_MINIGUN" },
  [GetHashKey("WEAPON_GRENADE")] = { "WEAPON_GRENADE" },
  [GetHashKey("WEAPON_STICKYBOMB")] = { "WEAPON_STICKYBOMB" },
  [GetHashKey("WEAPON_SMOKEGRENADE")] = { "WEAPON_SMOKEGRENADE" },
  [GetHashKey("WEAPON_BZGAS")] = { "WEAPON_BZGAS" },
  [GetHashKey("WEAPON_MOLOTOV")] = { "WEAPON_MOLOTOV" },
  [GetHashKey("WEAPON_FIREEXTINGUISHER")] = { "WEAPON_FIREEXTINGUISHER" },
  [GetHashKey("WEAPON_PETROLCAN")] = { "WEAPON_PETROLCAN" },
  [GetHashKey("WEAPON_FLARE")] = { "WEAPON_FLARE" },
  [GetHashKey("WEAPON_SNSPISTOL")] = { "WEAPON_SNSPISTOL" },
  [GetHashKey("WEAPON_SPECIALCARBINE")] = { "WEAPON_SPECIALCARBINE" },
  [GetHashKey("WEAPON_HEAVYPISTOL")] = { "WEAPON_HEAVYPISTOL" },
  [GetHashKey("WEAPON_BULLPUPRIFLE")] = { "WEAPON_BULLPUPRIFLE" },
  [GetHashKey("WEAPON_HOMINGLAUNCHER")] = { "WEAPON_HOMINGLAUNCHER" },
  [GetHashKey("WEAPON_PROXMINE")] = { "WEAPON_PROXMINE" },
  [GetHashKey("WEAPON_SNOWBALL")] = { "WEAPON_SNOWBALL" },
  [GetHashKey("WEAPON_VINTAGEPISTOL")] = { "WEAPON_VINTAGEPISTOL" },
  [GetHashKey("WEAPON_DAGGER")] = { "WEAPON_DAGGER" },
  [GetHashKey("WEAPON_FIREWORK")] = { "WEAPON_FIREWORK" },
  [GetHashKey("WEAPON_MUSKET")] = { "WEAPON_MUSKET" },
  [GetHashKey("WEAPON_MARKSMANRIFLE")] = { "WEAPON_MARKSMANRIFLE" },
  [GetHashKey("WEAPON_HEAVYSHOTGUN")] = { "WEAPON_HEAVYSHOTGUN" },
  [GetHashKey("WEAPON_GUSENBERG")] = { "WEAPON_GUSENBERG" },
  [GetHashKey("WEAPON_HATCHET")] = { "WEAPON_HATCHET" },
  [GetHashKey("WEAPON_RAILGUN")] = { "WEAPON_RAILGUN" },
  [GetHashKey("WEAPON_COMBATPDW")] = { "WEAPON_COMBATPDW" },
  [GetHashKey("WEAPON_KNUCKLE")] = { "WEAPON_KNUCKLE" },
  [GetHashKey("WEAPON_MARKSMANPISTOL")] = { "WEAPON_MARKSMANPISTOL" },
  [GetHashKey("WEAPON_FLASHLIGHT")] = { "WEAPON_FLASHLIGHT" },
  [GetHashKey("WEAPON_MACHETE")] = { "WEAPON_MACHETE" },
  [GetHashKey("WEAPON_MACHINEPISTOL")] = { "WEAPON_MACHINEPISTOL" },
  [GetHashKey("WEAPON_SWITCHBLADE")] = { "WEAPON_SWITCHBLADE" },
  [GetHashKey("WEAPON_REVOLVER")] = { "WEAPON_REVOLVER" },
  [GetHashKey("WEAPON_COMPACTRIFLE")] = { "WEAPON_COMPACTRIFLE" },
  [GetHashKey("WEAPON_DBSHOTGUN")] = { "WEAPON_DBSHOTGUN" },
  [GetHashKey("WEAPON_FLAREGUN")] = { "WEAPON_FLAREGUN" },
  [GetHashKey("WEAPON_AUTOSHOTGUN")] = { "WEAPON_AUTOSHOTGUN" },
  [GetHashKey("WEAPON_BATTLEAXE")] = { "WEAPON_BATTLEAXE" },
  [GetHashKey("WEAPON_COMPACTLAUNCHER")] = { "WEAPON_COMPACTLAUNCHER" },
  [GetHashKey("WEAPON_MINISMG")] = { "WEAPON_MINISMG" },
  [GetHashKey("WEAPON_PIPEBOMB")] = { "WEAPON_PIPEBOMB" },
  [GetHashKey("WEAPON_POOLCUE")] = { "WEAPON_POOLCUE" },
  [GetHashKey("WEAPON_SWEEPER")] = { "WEAPON_SWEEPER" },
  [GetHashKey("WEAPON_WRENCH")] = { "WEAPON_WRENCH" },
  [GetHashKey("WEAPON_PISTOL_MK2")] = {  "WEAPON_PISTOL_MK2" },
  [GetHashKey("WEAPON_SNSPISTOL_MK2")] = {  "WEAPON_SNSPISTOL_MK2" },
  [GetHashKey("WEAPON_REVOLVER_MK2")] = {  "WEAPON_REVOLVER_MK2" },
  [GetHashKey("WEAPON_SMG_MK2")] = {  "WEAPON_SMG_MK2" },
  [GetHashKey("WEAPON_PUMPSHOTGUN_MK2")] = {  "WEAPON_PUMPSHOTGUN_MK2" },
  [GetHashKey("WEAPON_ASSAULTRIFLE_MK2")] = {  "WEAPON_ASSAULTRIFLE_MK2" },
  [GetHashKey("WEAPON_CARBINERIFLE_MK2")] = {  "WEAPON_CARBINERIFLE_MK2" },
  [GetHashKey("WEAPON_SPECIALCARBINE_MK2")] = {  "WEAPON_SPECIALCARBINE_MK2" },
  [GetHashKey("WEAPON_BULLPUPRIFLE_MK2")] = {  "WEAPON_BULLPUPRIFLE_MK2" },
  [GetHashKey("WEAPON_COMBATMG_MK2")] = {  "WEAPON_COMBATMG_MK2" },
  [GetHashKey("WEAPON_HEAVYSNIPER_MK2")] = {  "WEAPON_HEAVYSNIPER_MK2" },
  [GetHashKey("WEAPON_MARKSMANRIFLE_MK2")] = {  "WEAPON_MARKSMANRIFLE_MK2" }
}

RegisterCommand('gun', function()
  if not showOverlay then
    showOverlay = true
    TriggerEvent('Notify','sucesso','Você <b>ligou</b> o overlay de arma!')
  elseif showOverlay then
    showOverlay = false
    SendNUIMessage({ action = 'hide' })
    TriggerEvent('Notify','sucesso','Você <b>desligou</b> o overlay de arma!')
  end
end)

CreateThread(function()
  while true do
    local playerPed = PlayerPedId()
    if showOverlay then
      local currentWeapon = GetCurrentPedWeapon(playerPed)
      if currentWeapon ~= false then
        local weapon = GetSelectedPedWeapon(playerPed)
        for k,v in pairs(Weapons) do 
          if k == weapon then
            local retval,ammoInClip = GetAmmoInClip(playerPed,weapon)
            local ammoOutClip = GetAmmoInPedWeapon(playerPed,weapon) - ammoInClip
            SendNUIMessage({ action = 'show', gun = v, ammoInClip = ammoInClip, ammoOffClip = ammoOutClip })
          end
        end
      end
    end
    Wait(4)
  end
end)