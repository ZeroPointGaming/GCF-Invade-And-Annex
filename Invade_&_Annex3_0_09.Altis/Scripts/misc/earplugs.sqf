////////////////////////////////////////
//    Simple Keypress Earplugs v1.0   //
//      scripts\misc\arplugs.sqf      //
//          Sgt Justin [GCF]          //
////////////////////////////////////////

//(findDisplay 46) displayRemoveEventHandler ["KeyDown", MEP_KD];  //Prevent doubleUp of eventHandlers - Not sure these actually stack so just incase.
sleep 1;

_PlugsTakenHint  = "<t color='#ff9d00' size='1.2' shadow='1' shadowColor='#000000' align='center'>-= Global Coalition Force Earplugs =-</t><br /><br />";   //Item taken hint.     
_howtoHint = "<t  size='1' shadow='1' shadowColor='#000000' align='center'>Our earplug system uses a keypress function handler to bind the earplugs to a keypress.</t><br /><br />";          //Instructions hint.
_hintparttwo = "<t  size='1' shadow='1' shadowColor='#000000' align='center'>To activate the ear plugs use the [END] key.</t><br />";   
hint parseText (_PlugsTakenHint + _howtoHint + _hintparttwo);

PlugsIN = 2;

//Add keybind to player [End] key - US keyboard.
MEP_KD = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (_this select 1 == 207) then {         
 switch (PlugsIN) do {
     case 1: { PlugsIN = 2; 2 fadeSound 1; player groupChat 'EARPLUGS REMOVED'; };
	 case 2: { PlugsIN = 1; 2 fadeSound 0.2; player groupChat 'EARPLUGS FITTED';  };
	 default { };
	 };
}"];