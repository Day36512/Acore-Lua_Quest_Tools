local NPC_ID = 400034 -- The ID of the NPC you want players to get kill credit for

-- List of allowed zones (use zone ID)
local ALLOWED_ZONES = {
    1519, -- SW City
	12,	
}

-- List of allowed spell IDs
local ALLOWED_SPELLS = {
    100144, -- Spell 1
    100142, 
    100143,
	100145, 
    -- Add more spells here as needed
}

-- Define the indexOf function for tables
function table.indexOf(t, value)
    for k, v in ipairs(t) do
        if v == value then
            return k
        end
    end
    return -1
end

function OnPlayerCastSpell(event, player, spell)
    print("Zone ID: "..player:GetZoneId())
    local spellId = spell:GetEntry()
    local zoneId = player:GetZoneId()

    if table.indexOf(ALLOWED_ZONES, zoneId) ~= -1 then
        if table.indexOf(ALLOWED_SPELLS, spellId) ~= -1 then
            player:KilledMonsterCredit(NPC_ID)
            player:SendBroadcastMessage("You have received kill credit for NPC #"..NPC_ID)
        end
    end
end

RegisterPlayerEvent(5, OnPlayerCastSpell)
