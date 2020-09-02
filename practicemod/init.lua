-- On world creating, create platform 10x10 starting from (1,0,1) to (10,0,10)
-- c_dirt = minetest.get_content_id("default:cobble")
minetest.register_on_generated(function(minp, maxp,  blockseed)
	start_pos = {x=0, y=0, z=0}
	if (minp.x <= start_pos.x and start_pos.x <= maxp.x
	and minp.y <= start_pos.y and start_pos.y <= maxp.y
	and minp.z <= start_pos.z and start_pos.z <= maxp.z)
	then 
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local data = vm:get_data()
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	
	for i in area:iter(
		0, 0, 0,
		10, 0, 10
	) do
	 
		data[i] = {name="default:dirt"}
		
	end

	vm:set_data(data)
	vm:write_to_map()
end
end)

-- On join player will be placed at (10, 10, 10)
minetest.register_on_joinplayer(function(player)
	minetest.log("action", "hello world")
	player:set_pos({ x = 10, y = 10, z = 10})
end)
