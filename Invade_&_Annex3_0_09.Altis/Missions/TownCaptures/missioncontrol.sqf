/*
Author:
	Sgt Justin

Last modified:
	26/08/2017

Description:
	Mission control

To do:
	Town missions
______________________________________________*/
private ["_mission","_missionList","_currentMission","_nextMission","_delay","_loopTimeout"];
_delay = 300 + (random 600);
_loopTimeout = 10 + (random 10);

//Mission list array
_missionList = [
	"Rodopoli",
	"Paros",
	"Kavala",
	"Negades",
	"Athira",
	"MainAirfield",
	"Dorida"
];

TWN_SWITCH = true; publicVariable "TWN_SWITCH";

//While mission is active code
while {missionActive} do {
	if (TWN_SWITCH) then {
		sleep 3;
		
		//Select a random mission from the mission list array
		_mission = _missionList call BIS_fnc_selectRandom;
		
		//Execute the mission sqf file
		_currentMission = execVM format ["Missions\TownCaptures\%1.sqf", _mission];
		
		//Wait until the mission is finished
		waitUntil {
			sleep 3;
			scriptDone _currentMission
		};
		sleep _delay;
		
		//Set swich variable to true
		TWN_SWITCH = true; publicVariable "TWN_SWITCH";
	};
	sleep _loopTimeout;
};
