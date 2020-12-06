-- |  \  |  _)                      __ )            |       |  |      _ \     _ \     _ \   _ | 
-- |   \ |   |    __|    _ \        __ \     _` |   __|  _  |_ |_|   |   |   |   |   |   |    | 
-- | |\  |   |   (      (   |       |   |   (   |   |    _  |_ |_|   |   |   |   |   |   |    | 
-- |_| \_|  _|  \___|  \___/   _)  ____/   \__,_|  \__|    _| _|    \___/   \___/   \___/    _| 

-------------------------------------------------------------------------
RegisterServerEvent('va:getPlayerIdentifiers')
AddEventHandler('va:getPlayerIdentifiers', function()
    if GetPlayerIdentifiers({source}) ~= nil then
        TriggerClientEvent('va:setPlayerIdentifiers', source, GetPlayerIdentifiers({source}))
    end
end)
--------------------------------------------------------------------------