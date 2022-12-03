Restricted = nil
local ClientBlacklist = {
  vehicles = {},
  peds = {},
  weapons = {},
}
local ClientLastModel = GetHashKey('a_m_y_hipster_01')
for i, v in ipairs(WeaponAmmoBannedTypes) do
  WeaponAmmoBannedTypes[v] = true
  WeaponAmmoBannedTypes[i] = nil
end

RegisterNetEvent('dblacklist:setClientBlacklist')
AddEventHandler('dblacklist:setClientBlacklist', function (blacklist)
  ClientBlacklist = blacklist
end)

AddEventHandler('playerSpawned', function ()
  TriggerServerEvent('dblacklist:getClientBlacklist')
end)

TriggerServerEvent('dblacklist:getClientBlacklist')

-- Vehicle blacklist handler
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(500)
    local ped = PlayerPedId()
    local veh
    if IsPedInAnyVehicle(ped, false) then
      veh = GetVehiclePedIsUsing(ped)
    else
      veh = GetVehiclePedIsTryingToEnter(ped)
    end
    if veh and DoesEntityExist(veh) then
      local hash = GetEntityModel(veh)
      local driver = GetPedInVehicleSeat(veh, -1)
      if not VehicleDriverBlacklist or driver == ped then
        local confirm = ClientBlacklist.vehicles[hash]
        if Inverted then confirm = not confirm end
        if confirm then
          DeleteEntity(veh)
          ClearPedTasksImmediately(ped)
          ShowNotification('qwexzy ti je jebo mater!')
        end
      end
    end
  end
end)

-- Ped blacklist handler
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(5000)
    local ped = GetPlayerPed(-1)
    local hash = GetEntityModel(ped)
    local confirm = ClientBlacklist.peds[hash]
    if Inverted then confirm = not confirm end
    if confirm then
      RequestModel(ClientLastModel)
      while not HasModelLoaded(ClientLastModel) do
        Citizen.Wait(400)
      end
      SetPlayerModel(PlayerId(), ClientLastModel)
      ShowNotification('Ne moze qwexzy ti je jebo mater!')
    else
      ClientLastModel = hash
    end
  end
end)

-- Weapon blacklist handler
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local ped = GetPlayerPed(-1)
    local _, hash = GetCurrentPedWeapon(ped, true)
    local confirm = ClientBlacklist.weapons[hash] or WeaponAmmoBannedTypes[GetPedAmmoTypeFromWeapon(ped, hash)]
    if Inverted then confirm = not confirm end
    if confirm then
      RemoveWeaponFromPed(ped, hash)
      ShowNotification('qwexzy reko ne moze!')
    end
  end
end)

function ShowNotification(message)
  SetNotificationTextEntry('STRING')
  AddTextComponentSubstringPlayerName(message)
  DrawNotification(true, true)
end