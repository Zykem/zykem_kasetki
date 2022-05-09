ESX = nil
print('github.com/Zykem')
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('hypex:getTwojStarySharedTwojaStaraObject', function(obj) 
			ESX = obj 
		end)
        Citizen.Wait(0)
    end
end)
local token
RegisterNetEvent('zykem:security')
AddEventHandler('zykem:security', function(tokensec)

    token = tokensec

end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)



   end
end)
local currentZone
local rabunekOn = false
local timer = 27
local dist15
local dist05
local cooldown

-- Drawing Markers
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(10)
    for i=1, #Config.Sklepy, 1 do
     local distance = #(GetEntityCoords(PlayerPedId()) - vector3(Config.Sklepy[i].x, Config.Sklepy[i].y, Config.Sklepy[i].z))
    dist15 = false
    dist05 = false

        if distance < 1.5 then
            dist15 = true
        end
        if distance < 0.5 then

            dist05 = true

        end


    end

   end
end)

function timerCooldown()

    cooldown = false
    print('Wyczysczono cooldowny!')

end


Citizen.CreateThread(function()
    while true do
      Citizen.Wait(10)
      for i=1, #Config.Sklepy, 1 do  
          if dist15 then
              ESX.ShowFloatingHelpNotification('Nacisnij ~b~E ~w~by obrabować Sklep!', vector3(Config.Sklepy[i].x, Config.Sklepy[i].y, Config.Sklepy[i].z))
          end
          if dist05 then

            ESX.ShowHelpNotification('Nacisnij ~b~E ~w~by ~r~obrabować Sklep!')
                if IsControlJustReleased(0,38) then
                    if cooldown then

                        if Config.CustomNotify then

                            ESX.ShowNotification('Ten sklep juz zostal obrabowany!')
                        else 

                            notify('Ten sklep juz zostal obrabowany!')

                        end

                    else
                        if rabunekOn then

                            if Config.CustomNotify then
                                ESX.ShowNotification('Juz rabujesz ten Sklep!')
                            else

                                notify('Juz rabujesz ten Sklep!')

                            end
                            
                        else
                            currentZone = vector3(Config.Sklepy[i].x, Config.Sklepy[i].y, Config.Sklepy[i].z)
                           -- print(timer)
                            rabunekOn = true
                            TriggerEvent('zykem:startTimer')
                        
                        end
                    end
                end

          end
  
  
      end
  
     end
  end)

RegisterNetEvent('zykem:startTimer')
AddEventHandler('zykem:startTimer', function()
    exports.entry_taskbar:Custom({
        Duration = timer * 1000,
        Label = "Rabowanie",
        Animation = {
            scenario = "WORLD_HUMAN_COP_IDLES", -- https://pastebin.com/6mrYTdQv
            animationDictionary = "idle_a", -- https://alexguirre.github.io/animations-list/
        },
        DisableControls = {
            Mouse = false,
            Player = false,
            Vehicle = true
        }
    })
    while rabunekOn do
        local distance = #(GetEntityCoords(PlayerPedId()) - currentZone)


        if distance < 15 then

            Citizen.Wait(1000)
            if timer <= 0 then
                if Config.CustomNotify then
                    ESX.ShowNotification('Obrabowales ten Sklep!')
                else
                    notify('Obrabowales ten Sklep!')
                end
                TriggerServerEvent('zykem:payforkaseta',token)
                rabunekOn = false
                cooldown = true
                SetTimeout(Config.Cooldown * 60 * 1000, timerCooldown)
                break
            end
            timer = timer - 1
         --   print(timer)

        else
            exports.entry_taskbar:Stop()
            if Config.CustomNotify then

                ESX.ShowNotification('Odszedles za daleko i Rabunek zostal anulowany!')

            else

                notify('Odszedles za daleko i Rabunek zostal anulowany!')

            end
            rabunekOn = false

        end
        Citizen.Wait(0)
    end

end)

function notify(text)
    SetNotificationTextEntry('STRING')
       AddTextComponentString(text)
    DrawNotification(false, true)
end