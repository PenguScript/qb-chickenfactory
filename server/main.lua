local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("qb-chickenfactory:bill:player")
AddEventHandler("qb-chickenfactory:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'chickenfactory' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

QBCore.Functions.CreateCallback('qb-chickenfactory:server:get:ingredientchickennugget', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("groundchicken")
    local meat = Ply.Functions.GetItemByName("breadcrumbs")
    if lettuce ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)




QBCore.Functions.CreateUseableItem("chickennugget", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-chickenfactory:use-nugget", src, item.name)
    end
end)

----------DELIVERY STUFF----------------

RegisterNetEvent('qb-chickenfactory:server:DeliveryItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'eggs'
    
    local quantity = 12

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('qb-chickenfactory:server:KnockDoor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = 'eggs'
    local item2 = 'receipt'
    local quantity1 = 12
    local quantity2 = 1

    Player.Functions.RemoveItem(item1, quantity1)
    Player.Functions.AddItem(item2, quantity2)
end)

QBCore.Functions.CreateCallback('qb-chickenfactory:server:get:ReceiptChecker', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local wreceipt = Ply.Functions.GetItemByName("receipt")
    if wreceipt ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('qb-chickenfactory:server:ReceivePayment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local payment = Config.DeliveryPayment

    Player.Functions.RemoveItem('receipt', 1)
    Player.Functions.AddMoney('bank', payment)
end)
