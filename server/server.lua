-- Użycie przedmiotu "carkey"
ESX.RegisterUsableItem('carkey', function(source)
    TriggerClientEvent('ls:useKeys', source)
end)

-- Dodawanie klucza do gracza
RegisterNetEvent("ls:addKeys")
AddEventHandler("ls:addKeys", function(plate)
    local src = source
    local lowerPlate = tostring(string.lower(plate)):gsub("%s+", "")
    local metadata = { plate = lowerPlate }

    local success = exports.ox_inventory:AddItem(src, "carkey", 1, metadata)

    Citizen.SetTimeout(500, function()
        local inventory = exports.ox_inventory:GetInventory(src)
        if type(inventory) == "table" and type(inventory.items) == "table" then
            for _, item in pairs(inventory.items) do
                -- Możesz tu dodać logowanie do pliku, jeśli chcesz, ale usuwam printy
            end
        end
    end)

    TriggerClientEvent('ox_inventory:refresh', src)
end)

-- Callback sprawdzający, czy gracz ma klucz do pojazdu
ESX.RegisterServerCallback("ls:check", function(source, cb, plate)
    local src = source
    local lowerPlate = tostring(string.lower(plate)):gsub("%s+", "")

    local hasKey = false

    local inventory = exports.ox_inventory:GetInventory(src)
    local items = (inventory and inventory.items) or {}
    for _, item in pairs(items) do
        if type(item) == "table" then
            if item.name == "carkey" and item.metadata and item.metadata.plate == lowerPlate then
                hasKey = true
                break
            end
        end
    end

    local isOwned = false
    local isLocked = false

    cb(hasKey, isOwned, isLocked)
end)

function addKeys(source, plate)
    TriggerEvent("ls:addKeys", plate)
end

function removeKeys(source, plate)
    TriggerEvent("ls:removeKeysFromPlayer", plate)
end

--zabieranie kluczy
RegisterNetEvent("ls:removeKeysFromPlayer")
AddEventHandler("ls:removeKeysFromPlayer", function(plate)
    local src = source
    local lowerPlate = tostring(string.lower(plate)):gsub("%s+", "")
    local items = exports.ox_inventory:GetInventory(src).items or {}
    for _, item in pairs(items) do
        if type(item) == "table" and item.name == "carkey" and item.metadata and item.metadata.plate and item.metadata.plate:gsub("%s+", ""):lower() == lowerPlate then
            exports.ox_inventory:RemoveItem(src, 'carkey', 1, item.metadata)
            break
        end
    end
    TriggerClientEvent('ox_inventory:refresh', src)
end)