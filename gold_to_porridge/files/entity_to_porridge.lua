dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y, rot = EntityGetTransform(entity_id)

EntityConvertToMaterial(entity_id, "gold")
EntityKill(entity_id)
