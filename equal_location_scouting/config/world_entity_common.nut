::EqualLocationScouting.HooksMod.hook("scripts/config/world_entity_common", function(q) {
	q.assignTroops = @(__original) function( _party, _partyList, _resources, _minibossify = 0, _weightMode = 1 )
    {
        __original(_party, _partyList, _resources, _minibossify, _weightMode);

		::logWarning("Assigned troops.");
		::logWarning("VisonRadius is: " + this.Const.World.Settings.Vision);
	}
});