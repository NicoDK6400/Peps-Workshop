-- |  \  |  _)                      __ )            |       |  |      _ \     _ \     _ \   _ | 
-- |   \ |   |    __|    _ \        __ \     _` |   __|  _  |_ |_|   |   |   |   |   |   |    | 
-- | |\  |   |   (      (   |       |   |   (   |   |    _  |_ |_|   |   |   |   |   |   |    | 
-- |_| \_|  _|  \___|  \___/   _)  ____/   \__,_|  \__|    _| _|    \___/   \___/   \___/    _| 
                                                                                         

local m = {}
m.delay = 10 -- Ændre her hvor tit beskerne skal komme ((minutter) default er 10 min.)

m.prefix = '^1[Min RP Server] ' -- Skift dit prefix her
m.suffix = ''
m.messages = {
	'^0Daglige genstart er ^1kl. 18.00 ^0og ^1kl. 06.00^0.',
    '^0Vores Discord er: ^1https://discord.gg/MinRPServer',
    '^0Brug din ^1sunde fornuft^ og ^1forsøg at lav et længervarende RP.',
    '^0Tyk ^1[F3] ^0for at åbne mobil ^1[F10] ^0for emote menu.',
    '^0/automsg for at ^1Sluk/^2tTænd system beskeder.',
	'^0Ingen ^1PowerGaming^0, ^1RDM^0, ^1VDM ^0eller ^1MetaGaming ^0det vil der straffes ^1hårdt på.'
}

m.ignorelist = {

}

local playerIdentifiers
local enableMessages = true
local timeout = m.delay * 600 * 60 
local playerOnIgnoreList = false
RegisterNetEvent('va:setPlayerIdentifiers')
AddEventHandler('va:setPlayerIdentifiers', function(identifiers)
    playerIdentifiers = identifiers
end)
Citizen.CreateThread(function()
    while playerIdentifiers == {} or playerIdentifiers == nil do
        Citizen.Wait(1000)
        TriggerServerEvent('va:getPlayerIdentifiers')
    end
    for iid in pairs(m.ignorelist) do
        for pid in pairs(playerIdentifiers) do
            if m.ignorelist[iid] == playerIdentifiers[pid] then
                playerOnIgnoreList = true
                break
            end
        end
    end
    if not playerOnIgnoreList then
        while true do
            for i in pairs(m.messages) do
                if enableMessages then
                    chat(i)

                end
                Citizen.Wait(timeout)
            end

            Citizen.Wait(0)
        end
    else

    end
end)
function chat(i)
    TriggerEvent('chatMessage', '', {255,255,255}, m.prefix .. m.messages[i] .. m.suffix)
end
RegisterCommand('automsg', function() -- Kan ændre commandoen her; "automsg" er for at sluk/tænd beskederne 
    enableMessages = not enableMessages
    if enableMessages then
        status = '^2TÆNDT.^5'
    else
        status = '^1SLUKKET.^5'
    end
    TriggerEvent('chatMessage', '', {255, 255, 255}, '^5[SYSTEM] ^0Automatiske beskeder er nu ' .. status) --- Status besked Tænd/Slukket
end, false)
--------------------------------------------------------------------------
