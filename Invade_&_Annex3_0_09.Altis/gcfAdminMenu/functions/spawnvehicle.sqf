////////////////////////////////////////
//    Simple Keypress Turret Locking  //
//        functions\syslock.sqf       //
//          Sgt Justin [GCF]          //
////////////////////////////////////////

//Vehicle to be spawned
_v = "B_APC_Wheeled_01_cannon_F";

//Get current position of the player
_pos = getPos player;

//Spawn the vehicle at the player
_vehicle = _v createVehicle _pos;

//Move the player into the drivers seat of the vehicle
player MoveInCargo [_vehicle, 1];