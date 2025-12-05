::EqualLocationScouting.HooksMod.hook("scripts/entity/world/player_party", function(q) {
	q.onInit = @(__original) function()
    {
        __original();

		::logWarning("Initialized player party.");
		::logWarning("VisonRadius is: " + this.Const.World.Settings.Vision);
		::logWarning("World vision radius is " + this.getPlayerVisionRadius());
	}

	q.onupdate = @(__original) function()
	{
		__original();

		::logWarning("VisionRadius on update is: " + this.getPlayerVisionRadius());
	}
});