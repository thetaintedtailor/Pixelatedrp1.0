ESX                  = nil
local IsAlreadyDrunk = false
local DrunkLevel     = -1
local ArmorAdded     = 0
local Drinking       = false

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function Drunk(level, start)
  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    if start then
      DoScreenFadeOut(800)
      Wait(1000)
    end

    if level == 0 then
      RequestAnimSet("move_m@drunk@slightlydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
    elseif level == 1 then
      RequestAnimSet("move_m@drunk@moderatedrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
    elseif level == 2 then
      RequestAnimSet("move_m@drunk@verydrunk")
      
      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrunk(playerPed, true)

    if start then
      DoScreenFadeIn(800)
    end
  end)
end

function Reality()
  Citizen.CreateThread(function()
    TriggerEvent("esx_status:getStatus", "drug", function(status)
      local playerPed = GetPlayerPed(-1)

      ResetPedMovementClipset(playerPed, 0)

      if status.val <= 0 then
        DoScreenFadeOut(800)
        Wait(1000)
        SetPedIsDrunk(playerPed, false)
        ClearTimecycleModifier()
        ResetScenarioTypesEnabled()
        SetPedMotionBlur(playerPed, false)
        DoScreenFadeIn(800)
      end
    end)
  end)
end

AddEventHandler('esx_status:loaded', function(status)
  TriggerEvent('esx_status:registerStatus', 'drunk', 0, '#8F15A5', 
    function(status)
      if status.val > 0 then
        return true
      else
        return false
      end
    end,
    function(status)
      status.remove(1500)
    end
  )

  Citizen.CreateThread(function()
    while true do
      Wait(3000)

      TriggerEvent('esx_status:getStatus', 'drunk', function(status)
        if status.val > 0 then
          local level     = 0
          local start     = true
          local playerPed = GetPlayerPed(-1)

          if IsAlreadyDrunk then
            start = false
          end

          if status.val <= 250000 then
            level = 0
          elseif status.val <= 500000 then
            level = 1
          else
            level = 2
          end

          if level ~= DrunkLevel then
            Drunk(level, start)

            if level < DrunkLevel then
              local armorAmount = math.floor(math.max(ArmorAdded, ArmorAdded / (level + 1)))

              ArmorAdded = ArmorAdded - armorAmount

              SetPedArmour(playerPed, math.max(0, GetPedArmour(playerPed) - (-1 * armorAmount)))
            end
          end

          if Drinking then
            local armorAmount = math.random(Config.MinArmor, Config.MaxArmor)

            ArmorAdded = ArmorAdded + armorAmount
            AddArmourToPed(playerPed, armorAmount)
            Drinking = false
          end

          IsAlreadyDrunk = true
          DrunkLevel     = level
        end

        if status.val == 0 then
          if IsAlreadyDrunk then
            Reality()

            if ArmorAdded > 0 then
              local playerPed   = GetPlayerPed(-1)
              local armorAmount = GetPedArmour(playerPed) - ArmorAdded

              if armorAmount < 0 then
                armorAmount = 0
              end

              SetPedArmour(playerPed, armorAmount)

              ArmorAdded = 0
            end
          end

          IsAlreadyDrunk = false
          DrunkLevel     = -1
        end
      end)
    end
  end)
end)

RegisterNetEvent('esx_optionalneeds:onDrink')
AddEventHandler('esx_optionalneeds:onDrink', function()
  local playerPed = GetPlayerPed(-1)

  Drinking = true
  
  if IsPedInAnyVehicle(playerPed, true) then
    TriggerEvent("esx_basicneeds:onDrink", "prop_amb_beer_bottle")
  else
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  end
end)