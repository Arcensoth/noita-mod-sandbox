function OnWorldInitialized()
	local from_materials = {"gold", "gold_box2d"}
	local to_material = "porridge"

	local to_material_id = CellFactory_GetType(to_material)

	for i, it in ipairs(from_materials) do
		local from_material_id = CellFactory_GetType(it)
		ConvertMaterialEverywhere(from_material_id, to_material_id)
	end
end
