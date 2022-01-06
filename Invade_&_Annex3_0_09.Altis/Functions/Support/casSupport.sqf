/* fnc_casSupport

FEATURE
Creates a CAS run at the given location

USAGE
if (player getUnitTrait "squadleader") then {
	player addAction ["[Request CAS Gun Run]", "Functions\Support\casSupport.sqf", 0, 0];
	player addAction ["[Request CAS Missile Strike]", "Functions\Support\casSupport.sqf", 1, 1];
	player addAction ["[Request CAS Gun and Missle Strike]", "Functions\Support\casSupport.sqf", 2, 2];
};

PARAMETERS
select 3 < Type of CAS run. 0: Guns only. 1: Rockets only. 2: Both. | Default = 0

RETURNS
true


To DO:
	- Figure out type number for bombing run with GUB's
	- Figure out a system to let the user decide the attack direction of the strike
*/

private ["_pos","_class","_type","_dir","_dummy","_lasertargets", "_errormsg"];

_errormsg = "Dont Call CAS at base!";

//Position of the laser target for the cas strike
_pos = position laserTarget player; 

//Directional heading of the cas strike
_dir = getDir player; //random 360 for random atk direction.

//Cas Array for potential cas vehicles
_CasArray = ["B_Plane_CAS_01_F","B_Plane_Fighter_01_F"]; //Bluefor cas class array
_CasVehicleType = _CasArray call BIS_fnc_selectRandom; //Select random cas vehicle
_class = _CasVehicleType;


_type = _this select 3 select 0; //Cas strike type variable


//Alert others of artillerys position
gridPos = mapGridPosition player;
publicVariable "gridPos";
parseText format ["<t size='1.2' align='center' color='#113DDD'>All units be advised a CAS strike is inbound to Grid:%1 ETA 10 Seconds.", gridPos] remoteExec ["hint"];
	
//Create the target and initialize the strike
	_dummy = "LaserTargetCBase" createVehicle _pos;
	_dummy enableSimulation false; _dummy hideObject true;
	_dummy setVariable ["vehicle",_class];
	_dummy setVariable ["type",_type];
	_dummy setDir _dir;
	[_dummy,nil,true] call BIS_fnc_moduleCAS;
	
	[_dummy] spawn {
		sleep 10;
		deleteVehicle (_this select 0);
	};
true