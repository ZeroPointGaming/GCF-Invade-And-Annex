/*
@filename: initServer.sqf
Author:
	Scooterman

Last modified:
	8/17/17 - Scooterman

Description:
	Scripts to initialize on the server side client
	
Changelog:
	*added changelog and author and filename and modified date to header
	*organized all functions and cleaned up and orgainized file
______________________________________________________*/

//=========================== Mission starting parameters
missionActive = true;
enableSaving false;
artySorcher allowDamage False;
artyMLRS allowDamage False;
controlledZones = [];
publicVariable "controlledZones";
jetCounter = 0;

//=========================== 
for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

//=========================== Mission File Parameters
AW_PARAM_MainEnemyFaction = "MainEnemyFaction" call BIS_fnc_getParamValue;
AW_PARAM_SecondaryEnemyFaction = "SecondaryEnemyFaction" call BIS_fnc_getParamValue;
[] call AW_fnc_factionDefine;
_mapSize = [configfile >> "cfgworlds" >> "Tanoa","mapSize"] call bis_fnc_returnConfigEntry;
_mapHalf = _mapSize / 2;
mapCent = [_mapHalf,_mapHalf,0];
publicVariable "mapCent";
artySorcher allowFleeing 0;
artyMLRS allowFleeing 0;
addMissionEventHandler ["HandleDisconnect", {
    _this params ["_unit", "", "", "_name"];
    if ("derp_revive" in (getMissionConfigValue "respawnTemplates")) then {
        _unit setVariable ["derp_revive_downed", false, true];
    };
}];
sleep 10;

//=========================== Script Executions
mainObjScript = [] execVM "Missions\Main\Main_Machine.sqf";
//execVM "Missions\Priority\MissionControl.sqf";
execVM "Missions\Side\MissionControl.sqf";
execVM "Missions\Infantry\MissionControl.sqf";
execVM "scripts\misc\airbaseDefense.sqf";
execVM "scripts\misc\cleanup.sqf";
execVM "scripts\misc\zeusupdater.sqf";														
[] execVM "CP\CheckpointA.sqf";
[] execVM "CP\CheckpointB.sqf";
[] execVM "CP\CheckpointC.sqf";
[] execVM "CP\CheckpointD.sqf";
[] execVM "CP\CheckpointE.sqf";

//execVM "Missions\TownCaptures\MissionControl.sqf"; //In house town capture missions for small squads
execVM "Missions\TownCaptures\HideMarkers.sqf"; //Hide markers on mission load for town capture missions

//=========================== Script Executions
masterClassArray = ["B_MBT_01_mlrs_F","O_Plane_CAS_02_F","O_Heli_Attack_02_black_F"]; //whitelist vehicles
publicVariable "masterClassArray";

//=========================== Script Executions
adminCurators = allCurators;
enableEnvironment FALSE;

//=========================== Includes for arsenal restrictions and arsenal box initilizations
#include "defines\arsenalDefines.hpp"
[ArsenalBoxes, ("ArsenalFilter" call BIS_fnc_getParamValue)] call derp_fnc_VA_filter; // Init arsenal boxes.
