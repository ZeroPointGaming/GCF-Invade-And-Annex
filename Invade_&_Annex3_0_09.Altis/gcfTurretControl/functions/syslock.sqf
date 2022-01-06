////////////////////////////////////////
//    Simple Keypress Turret Locking  //
//        functions\syslock.sqf       //
//          Sgt Justin [GCF]          //
////////////////////////////////////////
_v = vehicle player;
if (isnil {_v getvariable "lockstate"}) then {_v setvariable ["lockstate",true]};// check if variable exist if not create it and set to ture 
_lockedTurret = _v getvariable "lockstate";// get current state of turrets

switch (_lockedTurret) do {
	
    case TRUE: {

	systemChat "turrets locked!";
	[_v,["LMG_Minigun_Transport",[1]]] remoteExec ['removeWeaponTurret',0,FALSE];
	[_v,["LMG_Minigun_Transport2",[2]]] remoteExec ['removeWeaponTurret',0,FALSE];
	_v setvariable ["lockstate",FALSE];// set state so on next kepress it will unlock  
	};
	
	case FALSE: {

	systemChat "turrets unlocked!";
	
	[_v,["LMG_Minigun_Transport",[1]]] remoteExec ['addWeaponTurret',0,FALSE];
	[_v,["LMG_Minigun_Transport2",[2]]] remoteExec ['addWeaponTurret',0,FALSE];
	_v setvariable ["lockstate",TRUE];// set state so on next kepress it will  lock  
	};
	
	default { };
};