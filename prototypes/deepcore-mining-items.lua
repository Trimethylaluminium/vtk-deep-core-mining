-- item
data:extend({
  {
    type = "item",
    name = "vtk-deepcore-mining-drill",
    icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "v[items]-d[vtk-deepcore-mining-drill]",
    place_result = "vtk-deepcore-mining-drill",
    stack_size = 25
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-drill-advanced",
    icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine-advanced.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "extraction-machine",
    order = "v[items]-d[vtk-deepcore-mining-drill-advanced]",
    place_result = "vtk-deepcore-mining-drill-advanced",
    stack_size = 10
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-drone",
    icon = "__vtk-deep-core-mining__/graphics/icons/mining-drone.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "intermediate-product",
    order = "v[vtk-deepcore-mining-drone]",
    stack_size = 50
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-ore-chunk",
    icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-ore-chunk.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "vz[vtk-deepcore-mining-ore-chunk]",
    stack_size = 100
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-iron-ore-chunk",
    icon = "__vtk-deep-core-mining__/graphics/icons/iron-ore-patch-chunk.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "va[vtk-deepcore-mining-iron-ore-chunk]",
    stack_size = 100
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-copper-ore-chunk",
    icon = "__vtk-deep-core-mining__/graphics/icons/copper-ore-patch-chunk.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "vb[vtk-deepcore-mining-copper-ore-chunk]",
    stack_size = 100
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-coal-chunk",
    icon = "__vtk-deep-core-mining__/graphics/icons/coal-patch-chunk.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "vc[vtk-deepcore-mining-coal-chunk]",
    stack_size = 100
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-stone-chunk",
    icon = "__vtk-deep-core-mining__/graphics/icons/stone-patch-chunk.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "vd[vtk-deepcore-mining-stone-chunk]",
    stack_size = 100
  },
  {
    type = "item",
    name = "vtk-deepcore-mining-uranium-ore-chunk",
    icon = "__vtk-deep-core-mining__/graphics/icons/uranium-ore-patch-chunk.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "ve[vtk-deepcore-mining-uranium-ore-chunk]",
    stack_size = 100
  },
})

-- planner
data:extend({
  {
    type = "selection-tool",
    name = "vtk-deepcore-mining-planner",
    icon = "__vtk-deep-core-mining__/graphics/icons/mining-drone-blueprint.png",
    icon_size = 32,
    stack_size = 1,
    subgroup = "tool",
    order = "v[automated-construction]-d[deep-core-mining]",
    flags = {"goes-to-quickbar"},
    selection_color = {r = 1.0, g = 0.2, b = 1.0, a = 0.3},
    alt_selection_color = {r = 0.2, g = 0.8, b = 0.3, a = 0.3},
    selection_mode = {"any-entity"},
    alt_selection_mode = {"any-entity"},
    selection_cursor_box_type = "entity",
    alt_selection_cursor_box_type = "entity"
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-planner",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {"blueprint", 1},
      {"advanced-circuit", 4},
      {"vtk-deepcore-mining-drone", 5}
    },
    result = "vtk-deepcore-mining-planner"
  }
})

-- recipe
data:extend({
  {
    type = "recipe",
    name = "vtk-deepcore-mining-drill",
    enabled = false,
    energy_required = 100,
    ingredients =
    {
      {"electric-mining-drill", 10},
      {"steel-plate", 20},
      {"advanced-circuit", 5},
      {"vtk-deepcore-mining-drone", 10}
    },
    result = "vtk-deepcore-mining-drill",
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-drill-advanced",
    enabled = false,
    energy_required = 100,
    ingredients =
    {
      {"vtk-deepcore-mining-drill", 10},
      {"steel-plate", 100},
      {"processing-unit", 20},
      {"vtk-deepcore-mining-drone", 50}
    },
    result = "vtk-deepcore-mining-drill-advanced",
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-drone",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"flying-robot-frame", 1},
      {"electric-mining-drill", 1},
      {"advanced-circuit", 1}
    },
    result = "vtk-deepcore-mining-drone",
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-ore-chunk-refining",
    energy_required = 30,
    enabled = false,
    category = "centrifuging",
    ingredients = {
      {"vtk-deepcore-mining-ore-chunk", 100},
      {"vtk-deepcore-mining-drone", 2}
    },
    icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-ore-chunk.png",
    icon_size = 32,
    subgroup = "intermediate-product",
    order = "v[vtk-deepcore-mining]-a[deepcore-ore-processing]",
    main_product = "",
    results =
    {
      {
        name = "vtk-deepcore-mining-iron-ore-chunk",
        probability = 0.30,
        amount = 10
      },
      {
        name = "vtk-deepcore-mining-copper-ore-chunk",
        probability = 0.30,
        amount = 10
      },
      {
        name = "vtk-deepcore-mining-coal-chunk",
        probability = 0.15,
        amount = 10
      },
      {
        name = "vtk-deepcore-mining-stone-chunk",
        probability = 0.15,
        amount = 10
      },
      {
        name = "vtk-deepcore-mining-uranium-ore-chunk",
        probability = 0.10,
        amount = 10
      },
    },
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-iron-ore-chunk-refining",
    enabled = false,
    energy_required = 5,
    category = "chemistry",
    subgroup = "raw-material",
    ingredients = 
    {
      {"vtk-deepcore-mining-iron-ore-chunk", 1},
      {type="fluid", name="sulfuric-acid", amount=50},
    },
    main_product = "", -- to force use of recipe locales and icons instead of result's
    icons = {{icon = "__vtk-deep-core-mining__/graphics/icons/iron-ore-patch-refining.png"}},
    icon_size = 32,
    results = 
    {
      {type="item", name="iron-ore", amount=100}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.680, b = 0.894, a = 0.000}, -- #00ade45b -- to change?
      secondary = {r = 0.700, g = 0.130, b = 0.180, a = 0.357}, -- steel blue #4682B4
      tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
    }
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-copper-ore-chunk-refining",
    enabled = false,
    energy_required = 5,
    category = "chemistry",
    subgroup = "raw-material",
    ingredients =
    {
      {"vtk-deepcore-mining-copper-ore-chunk", 1},
      {type="fluid", name="sulfuric-acid", amount=50},
    },
    main_product = "", -- to force use of recipe locales and icons instead of result's
    icons = {{icon = "__vtk-deep-core-mining__/graphics/icons/copper-ore-patch-refining.png"}},
    icon_size = 32,
    results = 
    {
      {type="item", name="copper-ore", amount=100}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.680, b = 0.894, a = 0.000}, -- #00ade45b -- to change?
      secondary = {r = 0.255, g = 0.165, b = 0.000, a = 0.357}, -- orange	#FFA500	rgb(255,165,0)
      tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
    }
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-coal-chunk-refining",
    enabled = false,
    energy_required = 5,
    category = "chemistry",
    subgroup = "raw-material",
    ingredients =
    {
      {"vtk-deepcore-mining-coal-chunk", 1},
      {type="fluid", name="sulfuric-acid", amount=50},
    },
    main_product = "", -- to force use of recipe locales and icons instead of result's
    icons = {{icon = "__vtk-deep-core-mining__/graphics/icons/coal-patch-refining.png"}},
    icon_size = 32,
    results = 
    {
      {type="item", name="coal", amount=100}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.680, b = 0.894, a = 0.000}, -- #00ade45b -- to change?
      secondary = {r = 0.105, g = 0.105, b = 0.105, a = 0.357}, -- dimgray / dimgray	#696969	rgb(105,105,105)
      tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
    }
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-stone-chunk-refining",
    enabled = false,
    energy_required = 5,
    category = "chemistry",
    subgroup = "raw-material",
    ingredients =
    {
      {"vtk-deepcore-mining-stone-chunk", 1},
      {type="fluid", name="sulfuric-acid", amount=50},
    },
    main_product = "", -- to force use of recipe locales and icons instead of result's
    icons = {{icon = "__vtk-deep-core-mining__/graphics/icons/stone-patch-refining.png"}},
    icon_size = 32,
    results = 
    {
      {type="item", name="stone", amount=100}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.680, b = 0.894, a = 0.000}, -- #00ade45b -- to change?
      secondary = {r = 0.244, g = 0.164, b = 0.096, a = 0.357}, -- sandybrown	#F4A460	rgb(244,164,96)
      tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
    }
  },
  {
    type = "recipe",
    name = "vtk-deepcore-mining-uranium-ore-chunk-refining",
    enabled = false,
    energy_required = 5,
    category = "chemistry",
    subgroup = "raw-material",
    ingredients =
    {
      {"vtk-deepcore-mining-uranium-ore-chunk", 1},
      {type="fluid", name="sulfuric-acid", amount=100},
    },
    main_product = "", -- to force use of recipe locales and icons instead of result's
    icons = {{icon = "__vtk-deep-core-mining__/graphics/icons/uranium-ore-patch-refining.png"}},
    icon_size = 32,
    results = 
    {
      {type="item", name="uranium-ore", amount=100}
    },
    crafting_machine_tint =
    {
      primary = {r = 0.000, g = 0.173, b = 0.228, a = 0.000}, -- #00ade45b -- to change?
      secondary = {r = 0.173, g = 0.255, b = 0.047, a = 0.357}, -- greenyellow	#ADFF2F	rgb(173,255,47)
      tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900 -- to change?
    }
  },
})

-- entity
data:extend({
  {
    type = "mining-drill",
    name = "vtk-deepcore-mining-drill",
    icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 5, result = "vtk-deepcore-mining-drill"},
    resource_categories = {"vtk-deepcore-mining-ore-patch"},
    max_health = 3000,
    dying_explosion = "massive-explosion",
    corpse = "big-remnants",
    
    collision_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    selection_box = {{ -2.5, -2.5}, {2.5, 2.5}},
    drawing_box = {{-2.5, -2.5}, {2.5, 2.5}},
    
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
    mining_speed = 0.5,
    mining_power = 15,
    resource_searching_radius = 0.49,
    
    input_fluid_box =
    {
      production_type = "input",
      --pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 10, -- = x 100 fluid storage
      --height = 10, -- ??
      base_level = 1,-- so it requires a pump to inject
      pipe_connections =
      {
        { position = {-1, -3} },
      }
    },
    
    energy_usage = "1MW",
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.15,
      usage_priority = "secondary-input",
    },
    vector_to_place_result = {2, -3},
    base_picture =
    {
      sheet =
      {
        filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-mine-sheet.png",
        -- priority = "low",
        width = 330,
        height = 400,
        shift = util.by_pixel(8, -8),
        scale = 0.50
      }
    },
    animations =
    {
      north =
      {
        priority = "extra-high",
        width = 120, 
        height = 122, 
        line_length = 7,
	      -- shift = util.by_pixel(9, 33),
	      shift = util.by_pixel(7, 25),
        filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-drill-animation.png",
        frame_count = 21,
        animation_speed = 0.5,
        scale = 0.55
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-mining-drill.ogg",
        volume = 1.75
      },
      apparent_volume = 2.5,
    },
    module_specification =
    {
      module_slots = 3
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    fast_replaceable_group = "vtk-deepcore-mining-drill",
    --[[
    circuit_wire_connection_points =
    {
      get_circuit_connector_wire_shifting_for_connector({-0.09375, -1.65625}, {-0.09375, -1.65625}, 4),
      get_circuit_connector_wire_shifting_for_connector({1.28125, -0.40625},  {1.28125, -0.40625},  2),
      get_circuit_connector_wire_shifting_for_connector({0.09375, 1},         {0.09375, 1},         0),
      get_circuit_connector_wire_shifting_for_connector({-1.3125, -0.3125},   {-1.3125, -0.3125},   6)
    },
    circuit_connector_sprites =
    {
      get_circuit_connector_sprites({-0.09375, -1.65625}, {-0.09375, -1.65625}, 4),
      get_circuit_connector_sprites({1.28125, -0.40625},  {1.28125, -0.40625},  2),
      get_circuit_connector_sprites({0.09375, 1},         {0.09375, 1},         0),
      get_circuit_connector_sprites({-1.3125, -0.3125},   {-1.3125, -0.3125},   6)
    },
    circuit_wire_max_distance = 9,
    --]]
    
    circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
    circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
    circuit_wire_max_distance = 14,
  },
  {
    type = "mining-drill",
    name = "vtk-deepcore-mining-drill-advanced",
    icon = "__vtk-deep-core-mining__/graphics/icons/deepcore-mine-advanced.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 10, result = "vtk-deepcore-mining-drill-advanced"},
    resource_categories = {"vtk-deepcore-mining-ore"},
    max_health = 10000,
    dying_explosion = "massive-explosion",
    corpse = "big-remnants",
    
    collision_box = {{ -4.5, -4.5}, {4.5, 4.5}},
    selection_box = {{ -4.5, -4.5}, {4.5, 4.5}},
    drawing_box = {{-4.5, -4.5}, {4.5, 4.5}},
    
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
    mining_speed = 0.5,
    mining_power = 15,
    resource_searching_radius = 0.49,
    
    input_fluid_box =
    {
      production_type = "input",
      --pipe_picture = assembler2pipepictures(),
      pipe_covers = pipecoverspictures(),
      base_area = 10, -- = x 100 fluid storage
      --height = 10, -- ??
      base_level = 1,-- so it requires a pump to inject
      pipe_connections =
      {
        { position = {5, -3} },
      }
    },
    
    energy_usage = "10MW",
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 0.15,
      usage_priority = "secondary-input",
    },
    vector_to_place_result = {0, -5},
    base_picture =
    {
      sheet =
      {
        filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-advanced-sheet.png",
        priority = "high",
        width = 380, 
        height = 380,
        --shift = util.by_pixel(8, -8),
        scale = 0.90
      }
    },
    animations =
    {
      north =
      {
        priority = "extra-high",
        width = 380, 
        height = 380, 
        line_length = 1,
	      -- shift = util.by_pixel(9, 33),
        filename = "__vtk-deep-core-mining__/graphics/entity/deepcore-miner-advanced.png",
        frame_count = 1,
        animation_speed = 1,
        scale = 0.90
      }
    },
    activate_sound =
    {
      sound =
      {
        filename = "__vtk-deep-core-mining__/sounds/MOHORUN2.ogg",
        volume = 1
      },
      audible_distance_modifier = 1,
    },
    working_sound =
    {
      sound =
      {
        filename = "__vtk-deep-core-mining__/sounds/MOHORUN2_working.ogg",
        volume = 1
      },
      match_speed_to_activity = true,
      audible_distance_modifier = 1,
    },
    module_specification =
    {
      module_slots = 3
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    fast_replaceable_group = "vtk-deepcore-mining-drill-advanced",
    circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
    circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
    circuit_wire_max_distance = 14,
  }
})
