// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver.

_pilots = ["B_Helipilot_F"];
_aircraft_nocopilot = ["B_Heli_Transport_01_camo_F", "B_Heli_Transport_01_F", "I_Heli_Transport_02_F", "O_Heli_Light_02_F", "O_Heli_Light_02_unarmed_F", "B_Heli_Light_01_armed_F","B_Heli_Transport_03_F"];

waitUntil {player == player};

_iampilot = ({typeOf player == _x} count _pilots) > 0;

_uid = getPlayerUID player;
_whitelist = ["76561198303697461","76561198069238455","76561198009649645","76561198008331739","76561198063345202","76561198093235994"];

if (_uid in _whitelist) exitWith {};


while { true } do {
	_oldvehicle = vehicle player;
	waitUntil {vehicle player != _oldvehicle};

	if(vehicle player != player) then {
		_veh = vehicle player;

		//------------------------------ pilot can be pilot seat only
		
		if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
			if(({typeOf _veh == _x} count _aircraft_nocopilot) > 0) then {
				_forbidden = [_veh turretUnit [0]];
				if(player in _forbidden) then {
					if (!_iampilot) then {
						systemChat "Co-pilot is disabled on this vehicle";
						player action ["getOut",_veh];
					};
				};
			};
			if(!_iampilot) then {
				_forbidden = [driver _veh];
				if (player in _forbidden) then {
					systemChat "You must be a pilot to fly this aircraft";
					player action ["getOut", _veh];
				};
			};
		};
	};
};

