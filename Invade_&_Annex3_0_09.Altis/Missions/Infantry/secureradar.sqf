/*
@file: destroyRadar.sqf
Author:

	Quiksilver

Last modified:

	25/04/2014

Description:

	Get radar telemetry from enemy radar site, then destroy it.
_________________________________________________________________________*/

private ["_objPosInfantry","_flatPos","_accepted","_position","_randomDirInfantry","_hangarInfantry","_x","_enemiesArrayInfantry","_briefingInfantry","_fuzzyPosInfantry","_unitsArrayInfantry","_dummyInfantry","_objectInfantry","_tower1Infantry","_tower2Infantry","_tower3Infantry"];


//-------------------- FIND SAFE POSITION FOR OBJECTIVE

	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5,0,0.1,sizeOf "Land_Radar_Small_F",0,false];

		while {(count _flatPos) < 2} do {
			_position = [] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [5,0,0.1,sizeOf "Land_Radar_Small_F",0,false];
		};

		if ((_flatPos distance (getMarkerPos "respawn_west")) > 1000 && (_flatPos distance (getMarkerPos currentAO)) > 500 && (_flatPos distance (getMarkerPos "Airbase_CAS_Spawn")) > 1500) then
		{
			_accepted = true;
		};
	};

	_objPosInfantry = [_flatPos, 15, 30, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;


//-------------------- SPAWN FORCE PROTECTION

	//_enemiesArrayInfantry = [sideObjInfantry] call AW_fnc_SMenemyEAST;
	
//-------------------- BRIEF

	_fuzzyPos = [((_flatPos select 0) - 0) + (random 0),((_flatPos select 1) - 0) + (random 0),0];

	{ _x setMarkerPos _fuzzyPos; } forEach ["infantryMarker", "infantryCircle"];
	infantryMarkerText = "Infantry Only"; publicVariable "infantryMarkerText";
	"infantryMarker" setMarkerText "Side Objective: Eliminate Hostile Forces";
	infantryMarkerText = "Infantry Only";
    [west,["secureInfantryTask"],["OPFOR have captured a small area on the island. We've marked the position on your map; head over there and secure the site.","Secondary Objective: Eliminate Hostile Forces","infantryCircle"],(getMarkerPos "infantryCircle"),0,0,true,"search",true] call BIS_fnc_taskCreate;

	
//-------------------- SPAWN OBJECTIVE

	_tower1Infantry = [getMarkerPos "infantryMarker", 50, 0] call BIS_fnc_relPos;
	_tower2Infantry = [getMarkerPos "infantryMarker", 50, 120] call BIS_fnc_relPos;
	_tower3Infantry = [getMarkerPos "infantryMarker", 50, 240] call BIS_fnc_relPos;
	sleep 0.3;
	tower1Infantry = "Land_Cargo_Patrol_V3_F" createVehicle _tower1Infantry;
	tower2Infantry = "Land_Cargo_Patrol_V3_F" createVehicle _tower2Infantry;
	tower3Infantry = "Land_Cargo_Patrol_V3_F" createVehicle _tower3Infantry;
	sleep 0.3;
	tower1Infantry setDir 180;
	tower2Infantry setDir 300;
	tower3Infantry setDir 60;

	{ _x allowDamage false } forEach [tower1Infantry,tower2Infantry,tower3Infantry];
	sleep 0.3;
	
//Spawn Enemies -----------------------------------------
	
	_posInfantry = getMarkerPos "infantryMarker";
	_mainAOUnitsInfantry = [_posInfantry, [true, true, true, true, true, true, true, true]] call derp_fnc_infantryAOSpawnHandler;
	
	sideMissionUpInfantry = true;
	SM_SUCCESSInfantry = false;
	
	//Checks for Ao still Active ----------------------------
	switch(mainSide) do{
		case "east":{
			mainMissionTresholdInfantry = createTrigger ["EmptyDetector", getMarkerPos "infantryMarker"];
			mainMissionTresholdInfantry setTriggerArea [500, 500, 0, false];
			mainMissionTresholdInfantry setTriggerActivation ["EAST", "PRESENT", false];
			mainMissionTresholdInfantry setTriggerStatements ["this","",""];
		};
		case "resistance":{
			mainMissionTresholdInfantry = createTrigger ["EmptyDetector", getMarkerPos "infantryMarker"];
			mainMissionTresholdInfantry setTriggerArea [500, 500, 0, false];
			mainMissionTresholdInfantry setTriggerActivation ["GUER", "PRESENT", false];
			mainMissionTresholdInfantry setTriggerStatements ["this","",""];
		};
	};
	
	waitUntil {sleep 5;(count list mainMissionTresholdInfantry < PARAMS_EnemyLeftThreshholdInfantry) || !missionActive;};
	
	SM_SUCCESSInfantry = true;
	
while { sideMissionUpInfantry } do {

	if (SM_SUCCESSInfantry) exitWith {

		//-------------------- DE-BRIEFING

        ["secureInfantryTask", "Succeded",false] call BIS_fnc_taskSetState;
		["secureInfantryTask", "Succeded"] remoteExec ["AW_fnc_globalNotification",0,false];
        sleep 5;
        ["secureInfantryTask",west] call bis_fnc_deleteTask;
		{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["infantryMarker", "infantryCircle"]; publicVariable "infantryMarker";
		sideMissionUpInfantry = false; publicVariable "sideMissionUpInfantry";

		//--------------------- DELETE
		sleep 120;
		{ deleteVehicle _x } forEach [house,tower1Infantry,tower2Infantry,tower3Infantry];
		//[_enemiesArrayInfantry] spawn AW_fnc_SMdelete;
		
		//Delete and Cleanup ------------------------------------

		deleteVehicle mainMissionTresholdInfantry;
	
		{
			if (!(isNull _x) && {alive _x}) then {
				deleteVehicle _x;
			};
		} foreach _mainAOUnitsInfantry;
		{
			if (!(isNull _x) && {!alive _x}) then {
				deleteVehicle _x;
			};
		} foreach _mainAOUnitsInfantry;
	
	};
};
