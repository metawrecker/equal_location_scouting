::EqualLocationScouting.HooksMod.hook("scripts/entity/world/location", function(q) {
    q.onUpdate = @(__original) function()
    {
        __original();

		// world is still initializing or this is a fragment of a location, not the unique locations we're interested in. Skip..
		if (this.getName() == "") {
			return;
		}

		local acceptableLocationTypes = [
			this.Const.World.LocationType.Unique,
			this.Const.World.LocationType.Unique | this.Const.World.LocationType.Lair
		];

		local locationMatch = acceptableLocationTypes.find(this.getLocationType());

		if (locationMatch == null) {
			return;
		}

		local visibility = this.getVisibilityMult();

		//skip hidden locations like the Hunting Grounds and Artifact Reliquery until they're enabled via vanilla gameplay
		if (visibility > 0.0) {
			this.setVisibility(1.0);
			::logInfo("Set " + this.m.Name + " to 100% visibility");
		}
    }
});