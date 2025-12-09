::EqualLocationScouting <- {
	ID = "mod_equal_location_scouting",
	Name = "Full Unique Location Visibility",
	Version = "1.0.2"
}

local requiredMods = [
	"vanilla >= 1.5.1-6",
	"mod_msu >= 1.2.0",
	"mod_modern_hooks >= 0.4.10"
];

::EqualLocationScouting.HooksMod <- ::Hooks.register(::EqualLocationScouting.ID, ::EqualLocationScouting.Version, ::EqualLocationScouting.Name);
::EqualLocationScouting.HooksMod.require(requiredMods);

local modLoadOrder = [];
foreach (mod in requiredMods) {
	local idx = mod.find(" ");
	modLoadOrder.push(">" + (idx == null ? mod : mod.slice(0, idx)));
}

::EqualLocationScouting.HooksMod.queue(modLoadOrder, function() {
 	local mod = ::MSU.Class.Mod(::EqualLocationScouting.ID, ::EqualLocationScouting.Version, ::EqualLocationScouting.Name);
	::EqualLocationScouting.Mod	<- mod;

	// mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/metawrecker/equal_location_scouting");
	// mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);
	mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.NexusMods, "https://www.nexusmods.com/battlebrothers/mods/937");

	::include("equal_location_scouting/location");
});