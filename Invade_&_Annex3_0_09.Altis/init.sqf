/*
@filename: init.sqf
Author:
	Scooterman

Last modified:
	8/17/17 - Scooterman

Description:
	Main initilization script
	
Changelog:
	*added changelog and author and filename and modified date to header
	*organized all functions and cleaned up and orgainized file
______________________________________________________*/

//=========================== Chat Commands System
[] execVM "module_chatIntercept\init.sqf";

//=========================== RestartWarnings
[] ExecVM "restartWarnings\sqf\initLocal.sqf";

//============================ Sit down script
MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;
    _object switchMove _anim;
};

//=========================== Only pilots in bobcat script
RunwayBobcat addEventHandler ["GetIn", {
       _vehicle = _this select 0;
       _seat = _this select 1;
       _unit = _this select 2;

	_pilotSeats = [ "driver", "gunner" ];

	if (_uid in _whitelist) exitWith {};

	if( ( _seat in _pilotSeats ) ) then {
		if( !( _unit getVariable [ "PilotCanFly", false ] ) ) then {
			_unit action [ "eject", _vehicle ];
			player customChat [1, "You must be a pilot, uav operator or HQ to use this vehicle!"];
		};
	};
   }
];
RunwayBobcat setObjectTexture [2, ""];
RunwayBobcat lockTurret [[0],true];

//========================== Restrict artyMLRS
artyMLRS addEventHandler ["GetIn", {
       _vehicle = _this select 0;
       _seat = _this select 1;
       _unit = _this select 2;

	_pilotSeats = [ "driver", "gunner" ];

	if (_uid in _whitelist) exitWith {};

	if( ( _seat in _pilotSeats ) ) then {
		if( !( _unit getVariable [ "PilotCanFly", false ] ) ) then {
			_unit action [ "eject", _vehicle ];
			player customChat [1, "You must be a pilot, uav operator or HQ to use this vehicle!"];
		};
	};
   }
];

//========================== Restrict artySorcher
artySorcher artyMLRS ["GetIn", {
       _vehicle = _this select 0;
       _seat = _this select 1;
       _unit = _this select 2;

	_pilotSeats = [ "driver", "gunner" ];

	if (_uid in _whitelist) exitWith {};

	if( ( _seat in _pilotSeats ) ) then {
		if( !( _unit getVariable [ "PilotCanFly", false ] ) ) then {
			_unit action [ "eject", _vehicle ];
			player customChat [1, "You must be a pilot, uav operator or HQ to use this vehicle!"];
		};
	};
   }
];


//=========================== Mission starting parameters
missionActive = true;
enableSaving false;
artySorcher allowDamage False;
artyMLRS allowDamage False;

//=========================== Safezone executions
["respawn_west",1000,"You Have Entered The Central Safe Zone","You Have Left The Central Safe Zone",1] exec "NoKillZone.Sqs";

//=========================== Mission starting parameters Mission vars (for all clients)
derp_PARAM_AOSizeInfantry = "AOSizeInfantry" call BIS_fnc_getParamValue;
derp_PARAM_InfantryGroupsAmountInfantry = "InfantryGroupsAmountInfantry" call BIS_fnc_getParamValue;
derp_PARAM_AAGroupsAmountInfantry = "AAGroupsAmountInfantry" call BIS_fnc_getParamValue;
derp_PARAM_ATGroupsAmountInfantry = "ATGroupsAmountInfantry" call BIS_fnc_getParamValue;
derp_PARAM_AOSize = "AOSize" call BIS_fnc_getParamValue;
derp_PARAM_AntiAirAmount = "AntiAirAmount" call BIS_fnc_getParamValue;
derp_PARAM_MRAPAmount = "MRAPAmount" call BIS_fnc_getParamValue;
derp_PARAM_InfantryGroupsAmount = "InfantryGroupsAmount" call BIS_fnc_getParamValue;
derp_PARAM_AAGroupsAmount = "AAGroupsAmount" call BIS_fnc_getParamValue;
derp_PARAM_ATGroupsAmount = "ATGroupsAmount" call BIS_fnc_getParamValue;
derp_PARAM_RandomVehcsAmount = "RandomVehcsAmount" call BIS_fnc_getParamValue;
derp_PARAM_AIAimingAccuracy = "AIAimingAccuracy" call BIS_fnc_getParamValue;
derp_PARAM_AIAimingShake = "AIAimingShake" call BIS_fnc_getParamValue;
derp_PARAM_AIAimingSpeed = "AIAimingSpeed" call BIS_fnc_getParamValue;
derp_PARAM_AISpotingDistance = "AISpotingDistance" call BIS_fnc_getParamValue;
derp_PARAM_AISpottingSpeed = "AISpottingSpeed" call BIS_fnc_getParamValue;
derp_PARAM_AICourage = "AICourage" call BIS_fnc_getParamValue;
derp_PARAM_AIReloadSpeed = "AIReloadSpeed" call BIS_fnc_getParamValue;
derp_PARAM_AICommandingSkill = "AICommandingSkill" call BIS_fnc_getParamValue;
derp_PARAM_AIGeneralSkill = "AIGeneralSkill" call BIS_fnc_getParamValue;

//=========================== Dynamic Groups Initilization Script
["Initialize"] call BIS_fnc_dynamicGroups;
for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

//============================ Random Weather Execution
execVM "Scripts\randomweather.sqf";

//============================ Random Time Script
if (isServer) then {
	myNewTime = random 24;
	publicVariable "myNewTime";
};
waitUntil{not isNil "myNewTime"};
skipTime myNewTime;

//============================ Reset arty timer
Cooldown = 0;

//============================ Keypress handlers
keyPressFncGCF = {
	switch (_this) do {

		//Turret Control Bound to the home key
		case 199: {
			//=========================== Pilot turret control
			if (player getUnitTrait "derp_pilot") then {
				if (PARAMS_UH80TurretControl != 0) then {
						nul = [] execVM "gcfTurretControl\functions\syslock.sqf";
					};
					
					if (_uid in _whitelist) then {
						nul = [] execVM "gcfTurretControl\functions\syslock.sqf";
					};
				};
		};
		
		//Artillery Computer Bound to the insert key
		case 210: {
			//=========================== Add arty support for squad leaders
			if (player getUnitTrait "derp_squadleader") then {
				if (Cooldown < 1) then {execVM "gcfArtyComputer\init_artycpu.sqf";};
				if (Cooldown == 1) then {systemChat "Error: Artillery unavailable!";};
			};
		};
		
		//Server Admin Menu Bound to the NumpadAsterisk key
		case 55: {
			_uid = getPlayerUID player;
			_whitelist = ["76561198303697461","76561198069238455","76561198009649645","76561198008331739","76561198063345202","76561198093235994"];

			if (_uid in _whitelist) then {
				nul = [] execVM "gcfAdminMenu\initAdminMenu.sqf";
			};
		};

		//Holster Weapon Bound to the 5 key
		case 6: {
			if (vehicle player == player && currentWeapon player != "") then
			{
				curWep_h = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
			}
			else
			{
				if (curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then
				{
					player selectWeapon curWep_h;
				};
			};
		};
	};
};

//Add an EventHandler to the main display
waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call keyPressFncGCF;false;"];

//Loadout Handling

//=========================== DLC UNLOCKER
[] execVM "Scripts\dlc_unlocker.sqf";

//=========================== Welcome Message
[] execVM "Scripts\welcome.sqf";