-- xDoors mod by xyz
-- xFences mod by xyz
-- gates edit of xdoors by GloopMaster
-- gates nodebox by splizard

minetest.register_node("gates:gate_wood", {
		description = "Wooden Gate",
        drawtype = "nodebox",
        tile_images = {"default_wood.png"},
        paramtype = "light",
        paramtype2 = "facedir",
        is_ground_content = true,
        groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
        drop = "gates:gate_wood",
        node_box = {
                type = "fixed",
                fixed = {
                        {-0.5, -0.15, -0.06, -0.25, 0.4, 0.06},  
                        {0.25, -0.15, -0.06, 0.5, 0.4, 0.06},   
                        {-0.125, 0, -0.06, 0.125, 0.25, 0.06},  
                        {-0.25, 0.25, -0.06, 0.25, 0.4, 0.06},
                        {0.25, 0, -0.06, -0.25, -0.15, 0.06},   
                        {0, 1.0, -0.1, 0.5, 1.0, -0.0999}, 
                        {0, 1.0, 0.0999, 0.5, 1.0, 0.1},
                }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                        {-0.5, -0.15, -0.06, 0.5, 0.4, 0.06},
                },
        },
        on_punch = function(pos, node, puncher)
                --Gate always opens away from the player
                if node.param2 then
                        local playerpos = puncher:getpos()
                        local dir = {x = pos.x - playerpos.x, y = pos.y - playerpos.y, z = pos.z - playerpos.z}
                        local param = minetest.dir_to_facedir(dir)
                        if node.param2 == 0 and param == 2 then node.param2 = 2 end
                        if node.param2 == 2 and param == 0 then node.param2 = 0 end
                        if node.param2 == 1 and param == 3 then node.param2 = 3 end
                        if node.param2 == 3 and param == 1 then node.param2 = 1 end
                end
                minetest.env:add_node(pos, {name = "gates:gate_wood_open", param2=node.param2})
        end
})
 
minetest.register_node("gates:gate_wood_open", {
        drawtype = "nodebox",
        tile_images = {"default_wood.png"},
        paramtype = "light",
        paramtype2 = "facedir",
        is_ground_content = true,
        groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
        drop = "gates:gate_wood",
        sunlight_propagates = true,
        node_box = {
                type = "fixed",
                fixed = {
                        --Left
                        {-0.5, -0.15, -0.06, -0.4, 0.4,  0.19},   
                        {-0.5,  0,     0.34, -0.4, 0.25, 0.50},   
                        {-0.5,  0.25,  0.19, -0.4, 0.4,  0.50},
                        {-0.5, -0.15,  0.19, -0.4, 0,    0.50},  
                        
                        --Right
                        {0.4, -0.15, -0.06, 0.5, 0.4,  0.19},  
                        {0.4,  0,     0.34, 0.5, 0.25, 0.50},  
                        {0.4,  0.25,  0.19, 0.5, 0.4,  0.50},   
                        {0.4, -0.15,  0.19, 0.5, 0,    0.50},   
                }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                        {-0.5, -0.15, -0.06, 0.5, 0.4, 0.06},
                },
        },
        on_punch = function(pos, node, puncher)
                minetest.env:add_node(pos, {name = "gates:gate_wood", param2 = node.param2})
        end
})
 
 
minetest.register_craft({
        output = 'gates:gate_wood',
        recipe = {
                { 'default:stick', 'default:wood', 'default:stick' },
                { 'default:stick', 'default:wood', 'default:stick' },
        },
})

minetest.register_node("gates:gate_cobble", {
		description = "Cobble Gate",
        drawtype = "nodebox",
        tile_images = {"default_cobble.png"},
        paramtype = "light",
        paramtype2 = "facedir",
        is_ground_content = true,
        groups = {cracky=3},
        drop = "gates:gate_cobble",
        node_box = {
                type = "fixed",
                fixed = {
                        {-0.5, -0.15, -0.06, -0.25, 0.4, 0.06},  
                        {0.25, -0.15, -0.06, 0.5, 0.4, 0.06},   
                        {-0.125, 0, -0.06, 0.125, 0.25, 0.06},  
                        {-0.25, 0.25, -0.06, 0.25, 0.4, 0.06},
                        {0.25, 0, -0.06, -0.25, -0.15, 0.06},   
                        {0, 1.0, -0.1, 0.5, 1.0, -0.0999}, 
                        {0, 1.0, 0.0999, 0.5, 1.0, 0.1},
                }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                        {-0.5, -0.15, -0.06, 0.5, 0.4, 0.06},
                },
        },
        on_punch = function(pos, node, puncher)
                --Gate always opens away from the player
                if node.param2 then
                        local playerpos = puncher:getpos()
                        local dir = {x = pos.x - playerpos.x, y = pos.y - playerpos.y, z = pos.z - playerpos.z}
                        local param = minetest.dir_to_facedir(dir)
                        if node.param2 == 0 and param == 2 then node.param2 = 2 end
                        if node.param2 == 2 and param == 0 then node.param2 = 0 end
                        if node.param2 == 1 and param == 3 then node.param2 = 3 end
                        if node.param2 == 3 and param == 1 then node.param2 = 1 end
                end
                minetest.env:add_node(pos, {name = "gates:gate_cobble_open", param2=node.param2})
        end
})
 
minetest.register_node("gates:gate_cobble_open", {
        drawtype = "nodebox",
        tile_images = {"default_cobble.png"},
        paramtype = "light",
        paramtype2 = "facedir",
        is_ground_content = true,
        groups = {cracky=3},
        drop = "gates:gate_cobble",
        sunlight_propagates = true,
        node_box = {
                type = "fixed",
                fixed = {
                        --Left
                        {-0.5, -0.15, -0.06, -0.4, 0.4,  0.19},   
                        {-0.5,  0,     0.34, -0.4, 0.25, 0.50},   
                        {-0.5,  0.25,  0.19, -0.4, 0.4,  0.50},
                        {-0.5, -0.15,  0.19, -0.4, 0,    0.50},  
                        
                        --Right
                        {0.4, -0.15, -0.06, 0.5, 0.4,  0.19},  
                        {0.4,  0,     0.34, 0.5, 0.25, 0.50},  
                        {0.4,  0.25,  0.19, 0.5, 0.4,  0.50},   
                        {0.4, -0.15,  0.19, 0.5, 0,    0.50},   
                }
        },
        selection_box = {
                type = "fixed",
                fixed = {
                        {-0.5, -0.15, -0.06, 0.5, 0.4, 0.06},
                },
        },
        on_punch = function(pos, node, puncher)
                minetest.env:add_node(pos, {name = "gates:gate_cobble", param2 = node.param2})
        end
})
 
 
minetest.register_craft({
        output = 'gates:gate_cobble',
        recipe = {
                { 'default:stick', 'default:cobble', 'default:stick' },
                { 'default:stick', 'default:cobble', 'default:stick' },
        },
})

if minetest.get_modpath("mesecons") ~= nil then
	minetest.register_node("gates:gate_steel", {
			description = "Steel Gate",
			drawtype = "nodebox",
			tile_images = {"default_steel_block.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			is_ground_content = true,
			groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2,mesecon=2},
			drop = "gates:gate_steel",
			node_box = {
					type = "fixed",
					fixed = {
							{-0.5, -0.15, -0.06, -0.25, 0.4, 0.06},  
							{0.25, -0.15, -0.06, 0.5, 0.4, 0.06},   
							{-0.125, 0, -0.06, 0.125, 0.25, 0.06},  
							{-0.25, 0.25, -0.06, 0.25, 0.4, 0.06},
							{0.25, 0, -0.06, -0.25, -0.15, 0.06},   
							{0, 1.0, -0.1, 0.5, 1.0, -0.0999}, 
							{0, 1.0, 0.0999, 0.5, 1.0, 0.1},
					}
			},
			selection_box = {
					type = "fixed",
					fixed = {
							{-0.5, -0.15, -0.06, 0.5, 0.4, 0.06},
					},
			},
	})
	 
	minetest.register_node("gates:gate_steel_open", {
			drawtype = "nodebox",
			tile_images = {"default_steel_block.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			is_ground_content = true,
			groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2,mesecon=2},
			drop = "gates:gate_steel",
			sunlight_propagates = true,
			node_box = {
					type = "fixed",
					fixed = {
							--Left
							{-0.5, -0.15, -0.06, -0.4, 0.4,  0.19},   
							{-0.5,  0,     0.34, -0.4, 0.25, 0.50},   
							{-0.5,  0.25,  0.19, -0.4, 0.4,  0.50},
							{-0.5, -0.15,  0.19, -0.4, 0,    0.50},  
							
							--Right
							{0.4, -0.15, -0.06, 0.5, 0.4,  0.19},  
							{0.4,  0,     0.34, 0.5, 0.25, 0.50},  
							{0.4,  0.25,  0.19, 0.5, 0.4,  0.50},   
							{0.4, -0.15,  0.19, 0.5, 0,    0.50},   
					}
			},
			selection_box = {
					type = "fixed",
					fixed = {
							{-0.5, -0.15, -0.06, 0.5, 0.4, 0.06},
					},
			},
	})
	mesecon:register_effector("gates:gate_steel_open", "gates:gate_steel")
	 
	 
	minetest.register_craft({
			output = 'gates:gate_steel',
			recipe = {
					{ 'default:stick', 'default:steel_ingot', 'default:stick' },
					{ 'default:stick', 'default:steel_ingot', 'default:stick' },
			},
	})

	mesecon:register_on_signal_change(function(pos, node)
		if string.find(node.name, "gates:gate_steel_open") then
			minetest.env:add_node(pos, {name = "gates:gate_steel", param2 = node.param2})
		elseif string.find(node.name, "gates:gate_steel") then
			minetest.env:add_node(pos, {name = "gates:gate_steel_open", param2 = node.param2})
		end
	end)
end