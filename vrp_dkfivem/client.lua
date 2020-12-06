-- Made by Nico.Bat#0001
-- Edited by Lasse Christensen#0001
-- Second eyes Eske#1337
-- Third person Wut#0013
-- ---- ^^Thank you^^ ---- 

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('vrp_login:display')
AddEventHandler('vrp_login:display', function(value)
	SetNuiFocus(value,value)
  SendNUIMessage({ showmenu = value })
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- BUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ButtonClick",function(data,cb)
	if data then
		TriggerServerEvent("vrp_login:select", data)
	end
	TriggerEvent('vrp_login:display', false)
end)


AddEventHandler("playerSpawned",function()
    Citizen.Wait(31000)  -- Sæt et delay der passer til din Spawntid
    TriggerEvent('vrp_login:display', true)
 	Citizen.Wait(12000)  -- Sæt din tid for hvor lang tid menuen skal være synlig
 	TriggerEvent('vrp_login:display', false)
end)

--  RegisterCommand('test', function()
-- 	TriggerEvent('vrp_login:display', true)
--  end)
