-- On world creating, create platform 10x10 starting from (1,0,1) to (10,0,10)
minetest.register_on_generated(function(minp, maxp, blockseed)
	for i=1, 10 do 
		for j=1, 10 do
			minetest.add_node({x = i, y = 0, z = j}, {name="default:dirt"})
		end
	end

end)



-- On join player will be placed at (10, 10, 10)
minetest.register_on_joinplayer(function(player)
	minetest.log("action", "hello world")
	player:set_pos({ x = 10, y = 10, z = 10})
end)
