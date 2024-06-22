local blacklist = {
    WEAPON_STUNGUN = { 'policeItem' },
    WEAPON_44MAGNUM = { 'policeItem' },
    WEAPON_BEANBAG = { 'policeItem' },
    WEAPON_M4A1 = { 'policeItem' },
    WEAPON_TACTICALRIFLE = { 'policeItem' },
    WEAPON_M4 = { 'policeItem' },
    radio = { 'policeItem' },
    ['ammo-9'] = { 'policeItem' },
    ['ammo-45'] = { 'policeItem' },
    ['ammo-shotgun'] = { 'policeItem' },
    ['ammo-rifle'] = { 'policeItem' }
}

local whiteListInventorys = {
    "policetrash_1",
}

local metadataJobWhiteList = {
    policeItem = 'police'
}

AddEventHandler('onServerResourceStart', function(resourceName) --stashes
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
            print(json.encode(payload, { indent = true }))
            local hasPermission = false

            --check if item is blacklisted (with metadata or every item)
            local isItemBlacklisted = false
            for item, metadata in pairs(blacklist) do

                if payload.fromSlot.name == item then

                    for _, value in pairs(metadata) do

                        if payload.fromSlot.metadata[value] then
                            isItemBlacklisted = true
                        end
                    end

                    if next(metadata) == nil then
                        isItemBlacklisted = true
                    end
                end
            end
            hasPermission = not isItemBlacklisted

            --allow moving items in your own inventory
            if payload.fromInventory == payload.toInventory
            then
                hasPermission = true
            end

            --allow moving items to other inventorys
            for _, inventory in pairs(whiteListInventorys) do
                if payload.toInventory == inventory then
                    hasPermission = true
                end
            end

            return hasPermission
        end, {
            print = false,
        })
    end
end)