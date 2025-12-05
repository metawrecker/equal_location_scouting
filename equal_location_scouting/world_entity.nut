::EqualLocationScouting.HooksMod.hook("scripts/entity/world/world_entity", function(q) {
    local locs = [
        "Abandoned Village",
        "Ancient Statue",
        "Ancient Temple",
        "Ancient Spire",
        "Artifact Reliquary",
        "Black Monolith",
        "Grotesque Tree",
        "Icy Cave",
        "Stone Pillars",
        "Curious Ship Wreck",
        "The Fallen Star",
        "The Oracle",
        "Sunken Library",
        "Hunting Ground",
        "Unhold Graveyard",
        "Rul\'gazhix",
        "The Ancient City",
        "Watermill",
        "Witch Hut"
    ];

    //thanks to Darxo for his help initialing creating this part of the code
    q.onUpdate = @(__original) function()
    {
        __original();

        // local legendaryLocations = [
        //     "location.abandoned_village",
        //     "location.ancient_statue",
        //     "location.ancient_temple",
        //     "location.ancient_watchtower",
        //     "location.artifact_reliquary",
        //     "location.black_monolith",
        //     "location.fountain_of_youth",
        //     "location.icy_cave_location",
        //     "location.kraken_cult",
        //     "location.land_ship",
        //     "location.holy_site.meteorite",
        //     "location.holy_site.oracle",
        //     "location.sunken_library",
        //     "location.tundra_elk_location",
        //     "location.unhold_graveyard",
        //     "location.goblin_city",
        //     "location.holy_site.vulcano",
        //     "location.waterwheel",
        //     "location.witch_hut"
        // ];



		//this.setVisibility(this.getVisibilityMult() * this.Const.World.TerrainTypeVisibilityMult[this.getTile().Type]);

        // try {
        //     local mult = this.getVisibilityMult();
        //     local terrainVis = this.Const.World.TerrainTypeVisibilityMult[this.getTile().Type];

        //     ::logWarning("Entity " + this.getName() + " has visibility mult of " + mult + " and terrain vis mult of " + terrainVis + " found in arr? " + );
        // } catch (exception){
        //     ::logError(exception);
        // }

        local locationMatch = locs.find(this.getName());

        if (locationMatch != null && locationMatch >= 0) {
            //::logWarning("Matched location");

            if (this.getVisibilityMult() > 0.0) //skip hidden locations like the Hunting Grounds and Artifact Reliquery
            {
                if (::BalancedLocationScouting.userGivesPermission("SetVisibility100")) {
                    this.setVisibility(1.0);
                }

                // try {
                //     logWarning("Entity " + this.getName() + " has visibility of " + this.getVisibility());
                // } catch (exception){
                //     ::logError(exception);
                // }
            }
        }
    }


    q.getVisionRadius = @(__original) function()
    {
        local result = __original();

        ::logWarning("Calculated VisionRadius is " + result + " with setting Using Global Vision " + this.m.IsUsingGlobalVision);
    }
});

