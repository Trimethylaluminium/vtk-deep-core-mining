-- 1.8.2 update with DCMD rotation force and ore patches yields set for existing world before 1.8.2 version of the mod
function upgrade182(data)
    local dcmdfixed = 0
    local orepatchesfixed = 0
    
    for s, surface in pairs (game.surfaces) do

        -- scan surface for DCMD already installed in the world and rotate them south if needed and mark them on the map for their force to check their logistics
        for e, entity in pairs(surface.find_entities_filtered({name = "vtk-deepcore-mining-drill"})) do
            entity.rotatable = false 
            if entity.direction ~= defines.direction.south then
                entity.direction = defines.direction.south
                entity.force.add_chart_tag(entity.surface,{position=entity.position, text="Rotated DCMD need its output fixed.",icon={type="item", name=entity.name}})
                dcmdfixed = dcmdfixed + 1
            end
        end

        -- scan surface for all ore patches and set their amount to the new intended 100% yield
        local orepatches = {}
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "iron-ore-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "copper-ore-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "coal-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "stone-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "uranium-ore-patch"}), {option1=true})
        orepatches = table.merge(orepatches, surface.find_entities_filtered({name = "crack"}), {option1=true})
        
        for o, orepatch in pairs(orepatches) do
            orepatch.amount = 10000
            orepatchesfixed = orepatchesfixed + 1
        end
        
        -- notify everyone if needed
        for f, force in pairs(game.forces) do
            for p, player in pairs(force.players) do
                if dcmdfixed > 0 then
                    player.print("Deep Core Mining 1.8.2+ update : "..dcmdfixed.." DCMD have been force rotated south and might need logistic fixing. They have been marked on the map.")
                end
                if orepatchesfixed > 0 then
                    player.print("Deep Core Mining 1.8.2+ update : "..orepatchesfixed.." Ore patches & Cracks have been updated and now have an undepleting yield of 100% to properly work with changed Deep Core Mining drills power.")
                end
            end
        end
    end
end

-- 2.0.0 replace the ADCMD to place update with DCMD rotation force and ore patches yields set for existing world before 1.8.2 version of the mod
function upgrade200(data)
    local drillscount = 0
    local advdrillscount = 0
    for _, surface in pairs(game.surfaces) do
        local dcmd = surface.find_entities_filtered{name="vtk-deepcore-mining-drill"}
        local adcmd = surface.find_entities_filtered{name="vtk-deepcore-mining-drill-advanced"}
        for _, drill in pairs (dcmd) do
            drill.active = false
            drillscount = drillscount + 1
        end
        for _, drill in pairs (adcmd) do
            drill.active = false
            adcmd_energy_companion_add(drill)
            advdrillscount = advdrillscount + 1
        end
    end

    -- notify everyone
    for f, force in pairs(game.forces) do
        for p, player in pairs(force.players) do
            player.print("[img=technology/vtk-deepcore] Deep Core Mining 2.0.0 update major changes !")
            player.print("To prevent logistic nightmares all DCMDrills have been disabled and must be manually replaced to use their new functionalities.")
            player.print("A total of "..drillscount.." [img=item/vtk-deepcore-mining-drill] Deepcore Mining Drills and "..advdrillscount.." [img=item/vtk-deepcore-mining-drill-advanced] Advanced Deepcore Mining Drills have all been disabled.")
            player.print("[color=1,0,0]WARNING[/color] This upgrade is a big change and may break your factory logistics and DeepCore refining.")
            player.print("[img=item/vtk-deepcore-mining-drill] DeepCore Mining Drills now mine [img=item/vtk-deepcore-mining-ore-chunk] DeepCore ore chunks and not raw ore anymore. Chunks need refining in a [img=item/chemical-plant] chemical plant to get ore [img=item/iron-ore].")
            player.print("[img=item/vtk-deepcore-mining-drill-advanced] Advanced Deepcore Mining Drills now consume [img=item/vtk-deepcore-mining-drone] DeepCore Mining Drones to mine [img=item/vtk-deepcore-mining-ore-chunk] DeepCore ore and no longer requires [img=fluid/sulfuric-acid] sulfuric acid.")
            player.print("[img=item/vtk-deepcore-mining-ore-chunk] DeepCore ore is now refined in [img=item/chemical-plant] chemical plant with [img=fluid/sulfuric-acid] sulfuric acid like other Deep Core ore chunks and no longer in centrifuge.")
            player.print("Even if it may be frustrating to fix an existing factory I feel this makes the mod better overall. Please give it a chance and don't hesitate to provide feedback ! -- VortiK")
        end
    end
end


-- 2.2.0 setup ore patches depending on the drill placed on them for versions before 2.2.0
function upgrade220(data)
    for _, surface in pairs(game.surfaces) do
        for _, drill in ipairs(surface.find_entities_filtered({name={"vtk-deepcore-mining-drill","vtk-deepcore-mining-moho"}})) do
            moho_hot_swapper(drill, "create")
        end
    end
end