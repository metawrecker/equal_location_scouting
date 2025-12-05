::EqualLocationScouting <- {
	ID = "mod_equal_location_scouting",
	Name = "Equal Location Scouting",
	Version = "1.0.0"
}

local requiredMods = [
	"vanilla >= 1.5.1-6",
	"mod_msu >= 1.2.0",
	"mod_modern_hooks >= 0.4.10"
];

	// "dlc_lindwurm",
	// "dlc_unhold",
	// "dlc_wildmen",
	// "dlc_desert",
	// "dlc_paladins"

::EqualLocationScouting.HooksMod <- ::Hooks.register(::EqualLocationScouting.ID, ::EqualLocationScouting.Version, ::EqualLocationScouting.Name);
::EqualLocationScouting.HooksMod.require(requiredMods);

::EqualLocationScouting.userGivesPermission <- function (settingName)
{
	// if (::EqualLocationScouting.Mod.ModSettings.getSetting(settingName) == null) {
	// 	return false;
	// }

	return ::EqualLocationScouting.Mod.ModSettings.getSetting(settingName).getValue();
}

local modLoadOrder = [];
foreach (mod in requiredMods) {
	local idx = mod.find(" ");
	modLoadOrder.push(">" + (idx == null ? mod : mod.slice(0, idx)));
}

::EqualLocationScouting.HooksMod.queue(modLoadOrder, function() {
	::EqualLocationScouting.Mod <- ::MSU.Class.Mod(::EqualLocationScouting.ID, ::EqualLocationScouting.Version, ::EqualLocationScouting.Name);

	local generalPage = ::EqualLocationScouting.Mod.ModSettings.addPage("Page", "General");
	local useModdedVisibilitySetting = generalPage.addBooleanSetting("SetVisibility100", true, "Set legendary loc visibility to 100%");
	//80 - 100 multiply by 5 to be a range of 400 - vanillas 500
	local visibilityRadiusSetting = generalPage.addRangeSetting("VisibilityRadius", 80, 80, 100, 1, "World map vision radius (view only)");
	visibilityRadiusSetting.lock();

	::include("equal_location_scouting/config/world");
	::include("equal_location_scouting/player_party");
	::include("equal_location_scouting/config/world_entity_common");
	::include("equal_location_scouting/world_entity");
});