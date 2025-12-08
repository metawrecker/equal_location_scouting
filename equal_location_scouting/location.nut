::EqualLocationScouting.HooksMod.hook("scripts/entity/world/location", function(q) {
    q.onUpdate = @(__original) function()
    {
        __original();

		// world is still initializing or this is a fragment of a location, not the unique locations we're interested in. Skip..
		if (this.getName() == "") {
			return;
		}

		if (this.isLocationType(this.Const.World.LocationType.Unique)) {
			local visibility = this.getVisibilityMult();

			//skip hidden locations like the Hunting Grounds and Artifact Reliquery until they're enabled via vanilla gameplay
			if (visibility > 0.0 && visibility <= 1.0) {
				this.setVisibility(1.0);

				local vanillaVisibility = (this.getVisibilityMult() * this.Const.World.TerrainTypeVisibilityMult[this.getTile().Type]) * 100;

				::logInfo(this.m.Name + " set to 100% visibility. Vanilla visibility was " + vanillaVisibility + "%.");
			}
		}
    }
});