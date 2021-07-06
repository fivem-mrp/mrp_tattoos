MRP = nil
TriggerEvent('mrp:getSharedObject', function(obj) MRP = obj end)

RegisterServerEvent("SmallTattoos:GetPlayerTattoos")
AddEventHandler('SmallTattoos:GetPlayerTattoos', function(source, data, uuid)
	local xPlayer = MRP.getSpawnedCharacter(source)

	if xPlayer then
        TriggerClientEvent("SmallTattoos:GetPlayerTattoos:response", source, xPlayer.tattoos, uuid)
	else
        TriggerClientEvent("SmallTattoos:GetPlayerTattoos:response", source, {}, uuid)
	end
end)

RegisterServerEvent("SmallTattoos:PurchaseTattoo")
AddEventHandler('SmallTattoos:PurchaseTattoo', function(source, tattooList, price, tattoo, tattooName, uuid)
	local xPlayer = MRP.getSpawnedCharacter(source)

	if xPlayer.stats.cash >= price then
        TriggerEvent('mrp:bankin:server:pay:cash', source, price)
		table.insert(tattooList, tattoo)

        xPlayer.tattoos = tattooList
        TriggerEvent('mrp:updateCharacter', xPlayer);
        TriggerClientEvent('mrp:updateCharacter', source, xPlayer);

        TriggerClientEvent('chat:addMessage', source, {
            template = '<div class="chat-message nonemergency">{0}</div>',
            args = {"You have bought the " .. tattooName .. " tattoo for $" .. price}
        })
        TriggerClientEvent("SmallTattoos:PurchaseTattoo:response", source, true, uuid)
	else
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div class="chat-message nonemergency">{0}</div>',
            args = {"You do not have enough money for this tattoo"}
        })
        TriggerClientEvent("SmallTattoos:PurchaseTattoo:response", source, false, uuid)
	end
end)

RegisterServerEvent('SmallTattoos:RemoveTattoo')
AddEventHandler('SmallTattoos:RemoveTattoo', function (tattooList)
	local xPlayer = MRP.getSpawnedCharacter(source)

    xPlayer.tattoos = tattooList
    TriggerEvent('mrp:updateCharacter', xPlayer)
    TriggerClientEvent('mrp:updateCharacter', source, xPlayer)
end)