private ["_pos","_ammotype","_delay","_height","_amount","_spread","_Strike","_escapeFn"];
_escapeFn = false; //Variable for script exiting

//Returns position of the players laser designator target 
_pos = position laserTarget player;

//Alert others of artillerys position
gridPos = mapGridPosition player;
publicVariable "gridPos";
parseText format ["<t size='1.2' align='center' color='#113DDD'>All units be advised artillery has been fired at Grid:%1 ETA 10 Seconds.", gridPos] remoteExec ["hint"];
	
_ammotype  = "B_20mm_Tracer_Red";
_delay     = 0.01;
_height    = 220;
_amount    = 128;
_spread    = 10;

sleep 10;

for "_x" from 1 to _amount do {
	_Strike = createVehicle [_ammotype, _pos, [], _spread, "NONE"];
	_Strike  allowdamage false;
	_Strike  setvectorup [0,9,0.1];
	_Strike setvelocity [0,0,-200];
	sleep _delay;
	}; 
true  