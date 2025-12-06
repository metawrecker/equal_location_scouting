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

    q.onUpdate = @(__original) function()
    {
        __original();

        local locationMatch = locs.find(this.getName());

        if (locationMatch != null && locationMatch >= 0) {
            local visibility = this.getVisibilityMult();
            //skip hidden locations like the Hunting Grounds and Artifact Reliquery until they're enabled by other, vanilla code
            if (visibility > 0.0 && visibility < 1.0) {
                this.setVisibility(1.0);
                ::logInfo("Set " + this.getName() + " to 100% visibility");
            }
        }
    }

    // q.getVisionRadius = @(__original) function()
    // {
    //     local result = __original();

    //     ::logWarning("Calculated VisionRadius is " + result + " with setting Using Global Vision " + this.m.IsUsingGlobalVision);
    // }
});

