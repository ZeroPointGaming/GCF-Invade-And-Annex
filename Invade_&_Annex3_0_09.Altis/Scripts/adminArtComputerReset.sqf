_uid = getPlayerUID player;
_whitelist = ["76561198303697461","76561198069238455","76561198009649645","76561198008331739","76561198063345202","76561198093235994"];

//=========================== Lock unlock vehicles script for admins only
if (_uid in _whitelist) then {
	Cooldown = 0;
	systemChat "Artillery Timer Reset";
};
