-- Made by Nico.Bat#0001
-- Edited by Lasse Christensen#0001
-- Second eyes Eske#1337
-- Third person Wut#0013
-- ---- ^^Thank you^^ ---- 

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local lcfg = module("vrp", "cfg/base")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_login")

-- Ændre dine coords her --

local coords = {
  ['center'] = {219.98,-884.48,30.69},
  ['sandy'] = {318.82,2622.06,44.47},
  ['paleto'] = {106.38,6609.39,31.93},
  ['pillbox'] = {295.25,-611.19,43.36},
  ['centerclothes'] = {429.53,-803.025,29.49},
  ['lufthavn'] = {-1027.65,-2493.39,13.85}

}

RegisterServerEvent("vrp_login:select")
AddEventHandler("vrp_login:select",function(select)
  if coords[select] then
    vRPclient.teleport(source,coords[select])
  end
end)
