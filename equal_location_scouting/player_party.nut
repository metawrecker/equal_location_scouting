// ::EqualLocationScouting.HooksMod.hook("scripts/entity/world/player_party", function(q) {
// 	q.onInit = @(__original) function()
//     {
//         __original();

// 		::logWarning("Initialized player party.");
// 		::logWarning("VisonRadius is: " + this.Const.World.Settings.Vision);
// 		::logWarning("World vision radius is " + this.World.getPlayerVisionRadius());
// 	}

// 	q.onUpdate = @(__original) function()
// 	{
// 		__original();

// 		::logWarning("VisionRadius on update is: " + this.World.getPlayerVisionRadius());
// 	}

// 	q.getVisionRadius = @(__original) function()
// 	{
// 		local ret = __original();

// 		::logWarning("getVisionRadius: " + ret);

// 		return ret;
// 	}
// });