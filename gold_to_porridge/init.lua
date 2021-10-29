function OnWorldInitialized()
	local from_materials = {"gold", "gold_box2d"}
	local to_material = "porridge"

	local to_material_id = CellFactory_GetType(to_material)

	for i, it in ipairs(from_materials) do
		local from_material_id = CellFactory_GetType(it)
		ConvertMaterialEverywhere(from_material_id, to_material_id)
	end

	local entity = EntityLoad("mods/gold_to_porridge/files/potion_precursor.xml", 240, -80)
end

function main()
	local gold_entity_files = {
		("data/entities/items/pickup/goldnugget.xml"),
		("data/entities/items/pickup/goldnugget_10.xml"),
		("data/entities/items/pickup/goldnugget_50.xml"),
		("data/entities/items/pickup/goldnugget_200.xml"),
		("data/entities/items/pickup/goldnugget_1000.xml"),
		("data/entities/items/pickup/goldnugget_10000.xml"),
		("data/entities/animals/boss_centipede/rewards/gold_reward.xml"),
	}

	local to_porridge_script = ("mods/gold_to_porridge/files/entity_to_porridge.lua")

	local content_to_insert = [[
		<LuaComponent
			execute_every_n_frame="-1"
			script_source_file="]] .. to_porridge_script .. [["
		></LuaComponent>
	]]

	for i, filename in pairs(gold_entity_files) do
		local old_content = ModTextFileGetContent(filename)
		if old_content then
			local insertion_point = string.find(old_content, "</Entity>") - 1
			print("Tweaking item <" .. filename .. "> at insertion point: " .. insertion_point)
			new_content = old_content:sub(1, insertion_point) .. content_to_insert .. "\n" .. old_content:sub(insertion_point + 1)
			ModTextFileSetContent(filename, new_content)
		end
	end
end

main()
