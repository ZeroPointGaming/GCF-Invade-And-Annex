_basePoss = getMarkerPos "respawn_west";
if ((player distance _basePoss) <= 500) then {
		player addEventHandler ["WeaponAssembled",{
if ((_this select 1) isKindOf "StaticWeapon") then
{
deleteVehicle (_this select 1);
hintC "You are discharging your weapon at base without approval.  Cease your actions Immediately!";
}
}];
	} else {

	};