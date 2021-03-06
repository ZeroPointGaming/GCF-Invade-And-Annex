/*
Author:

	Quiksilver

Last modified:

	25/04/2014

Description:

	Rescue POW
____________________________________*/

#define OFFICER_TYPE "B_officer_F","B_T_Officer_F","B_G_officer_F"
private ["_objPos","_flatPos","_accepted","_position","_randomDir","_hangar","_x","_enemiesArray","_briefing","_fuzzyPos","_unitsArray","_dummy","_object"];
_c4Message = ["The officer has been rescued! Great Work!","You have rescued the officer, proceed to extraction!","Opfor forces defeated, officer rescued! Great work!"] call BIS_fnc_selectRandom;


//-------------------- FIND SAFE POSITION FOR OBJECTIVE

	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5,0,0.2,sizeOf "Land_TentHangar_V1_F",0,false];

		while {(count _flatPos) < 2} do {
			_position = [] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [5,0,0.2,sizeOf "Land_TentHangar_V1_F",0,false];
		};

		if ((_flatPos distance (getMarkerPos "respawn_west")) > 1000 && (_flatPos distance (getMarkerPos currentAO)) > 500) then
		{
			_accepted = true;
		};
	};

	_objPos = [_flatPos, 25, 35, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;

//-------------------- SPAWN OBJECTIVE

	_randomDir = (random 360);
	_hangar = "Land_Cargo_House_V3_F" createVehicle _flatPos;
	waitUntil {!isNull _hangar};
	_hangar setPos [(getPos _hangar select 0), (getPos _hangar select 1), ((getPos _hangar select 2) - 1)];
	
	//Spawn the officer to rescue
	sideObjUnit = [OFFICER_TYPE] call BIS_fnc_selectRandom;
	sideObj = [_flatPos, WEST, [sideObjUnit],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	
	waitUntil {!isNull sideObj};
	{_x setDir _randomDir} forEach [sideObj,_hangar];
	
	//Remove POW Items
	removeallweapons sideObj;
	removeallitems sideObj;
	removeheadgear sideObj;
	removevest sideObj;
	
	//Set POW as captive
	sideObj disableai "move";
	sideObj setcaptive true;
	
	//Add secure hostage function
	sideObj addAction ["Secure Hostage!", "Scripts\secure.sqf",[],1,true,true,"","leader group _target == _target"]; sideObj disableai "move";

	house = "Land_Cargo_House_V3_F" createVehicle _objPos;
	house setDir random 360;
	house allowDamage false;

	_object = [research1,research2] call BIS_fnc_selectRandom;
	sleep 0.3;
	_dummy = [explosivesDummy1,explosivesDummy2] call BIS_fnc_selectRandom;
	sleep 0.3;
	{ _x enableSimulation true } forEach [researchTable,_object];
	sleep 0.3;
	researchTable setPos [(getPos house select 0), (getPos house select 1), ((getPos house select 2) + 1)];
	sleep 1;
	[researchTable,_object,[0,0,0.82]] call BIS_fnc_relPosObject;

	
//-------------------- SPAWN FORCE PROTECTION
	_enemiesArray = [sideObj] call AW_fnc_SMenemyEAST;


//-------------------- BRIEF
	_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];

	{ _x setMarkerPos _fuzzyPos; } forEach ["sideMarker", "sideCircle"];
	sideMarkerText = "Secure Chopper";
	"sideMarker" setMarkerText "Side Mission: Rescue POW";
	sideMarkerText = "Secure Enemy Chopper";
    [west,["securePOWTask"],["OPFOR forces have captured a high ranking bluefor official and are keeping him hostage somewhere on the island. The location has been marked on your map, proceed to the AO and clear the enemy units and save the officer!","Side Mission: Rescue POW","sideCircle"],(getMarkerPos "sideCircle"),0,0,true,"interact",true] call BIS_fnc_taskCreate;

	sideMissionUp = true;
	SM_SUCCESS = false;


while { sideMissionUp } do {

	if (!alive sideObj) exitWith {

		//-------------------- DE-BRIEFING

        ["securePOWTask", "Failed",true] call BIS_fnc_taskSetState;
        sleep 5;
        ["securePOWTask",west] call bis_fnc_deleteTask;
		remoteExec ["AW_fnc_SMhintFAIL",0,false];
		{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];
		sideMissionUp = false;

		//-------------------- DELETE

		{ _x setPos [-10000,-10000,0]; } forEach [_object,researchTable,_dummy];			// hide objective pieces
		sleep 120;
		{ deleteVehicle _x } forEach [sideObj,house];
		deleteVehicle nearestObject [getPos sideObj,"Land_TentHangar_V1_ruins_F"];
		[_enemiesArray] spawn AW_fnc_SMdelete;
	};

	if (SM_SUCCESS) exitWith {



		//-------------------- BOOM!

		_dummy setPos [(getPos sideObj select 0), ((getPos sideObj select 1) +3), ((getPos sideObj select 2) + 0.5)];
		sleep 0.1;
		_object setPos [-10000,-10000,0];					// hide objective
		sleep 30;											// ghetto bomb timer
		"Bo_GBU12_LGB" createVehicle getPos _dummy; 		// default "Bo_Mk82"
		_dummy setPos [-10000,-10000,1];					// hide dummy
		researchTable setPos [-10000,-10000,1];				// hide research table
		sleep 0.1;

		//-------------------- DE-BRIEFING

		[] call AW_fnc_SMhintSUCCESS;
        ["securePOWTask", "SUCCEEDED",true] call BIS_fnc_taskSetState;
        sleep 5;
        ["securePOWTask",west] call bis_fnc_deleteTask;
		{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];
		sideMissionUp = false;

		//--------------------- DELETE
		sleep 120;
		{ deleteVehicle _x } forEach [sideObj,house];
		deleteVehicle nearestObject [getPos sideObj,"Land_Cargo_House_V3_F"];
		[_enemiesArray] spawn AW_fnc_SMdelete;
	};
};
