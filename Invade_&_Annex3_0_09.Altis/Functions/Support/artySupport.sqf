/*fnc_artySupport

FEATURE
Creates Ordnance over the given area

USAGE
if (player getUnitTrait "squadleader") then {
	player addAction ["[Request 82mm HE Mortar Barrage]", "Functions\Support\artySupport.sqf", [0]];
	player addAction ["[Request 230mm Rocket Barrage]", "Functions\Support\artySupport.sqf", "Sh_82mm_AMOS"];
	player addAction ["[Request 155mm Howitzer Barrage]", "Functions\Support\artySupport.sqf", "Sh_155mm_AMOS"];
};

PARAMETERS
1. Center of ordnance strike (any position)  | MANDATORY
2. Class of ordnance - any type of artillery ammo               | MANDATORY

AMMO TYPES (examples):
0 | "Sh_82mm_AMOS" - HE mortar
1 | "Sh_155mm_AMOS" - 155mm artillery
2 | "R_230mm_HE" - 230mm HE rocket
3 | "R_80mm_HE" - Skyfire 80mm Rocket
4 | "M_Scalpel_AT" - Scalpel AT Missiles
5 | "M_Titan_AT" - Titan AT Missiles
6 | "Sh_120mm_HE" - 120 MM HE Shells
7 | "Bo_GBU12_LGB" - GBU 12 Bombs
8 | "Bo_Mk82" - Mk 82 Bombs

RETURNS
true
*/

private ["_pos","_ammotype","_delay","_height","_amount","_spread","_Strike","_escapeFn"];
_escapeFn = false; //Variable for script exiting


//Returns position of the players laser designator target 
_pos = position laserTarget player;

	
if ((getPos player) distance (getPos Quartermaster) < 2000)  then {
	sideChat "Dont request Artillery at base!;
	_escapeFn = true;
	};

if (_escapeFn) exitwith {}; //If your in base cancle script execution
	
//Alert others of artillerys position
gridPos = mapGridPosition player;
publicVariable "gridPos";
parseText format ["<t size='1.2' align='center' color='#113DDD'>All units be advised artillery has been fired at Grid:%1 ETA 10 Seconds.", gridPos] remoteExec ["hint"];
	
_ammotype  = _this select 3;//ARTY_Sh_122_HE    type of ammo to be used
_delay     = 2; //0.8 delay between each shell
_height    = 220; //220 height shells will fall from
_amount    = 2; //4 total shells fired
_spread    = 50; //50 how close they will be to the target


sleep 10;

for "_x" from 1 to _amount do {
	_Strike = createVehicle [_ammotype, _pos, [], _spread, "NONE"];
	_Strike  allowdamage false;
	_Strike  setvectorup [0,9,0.1];
	_Strike setvelocity [0,0,-200];
	sleep _delay;
	}; 
	
	
true  