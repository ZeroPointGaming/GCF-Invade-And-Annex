////////////////////////////////////////
//    Simple Keypress Turret Locking  //
//        functions\syslock.sqf       //
//          Sgt Justin [GCF]          //
////////////////////////////////////////

//Vehicle to be spawned
_v = "B_Heli_Transport_01_F";

//Get current position of the player
_pos = getPos player;

//Spawn the vehicle at the player
_vehicle = _v createVehicle _pos;

//Move the player into the drivers seat of the vehicle
player MoveInCargo [_vehicle, 1];

//Add spawned vehicle to zues
{_x addCuratorEditableObjects [[_vehicle],true ];} foreach adminCurators;