/* ==== onPlayerRespawn.sqf ==== */

//=========================== Admin UID List
_uid = getPlayerUID player;
_whitelist = ["76561198303697461","76561198069238455","76561198009649645","76561198008331739","76561198063345202","76561198093235994"];

//=========================== Lock unlock vehicles script for admins only
if (_uid in _whitelist) then {
	player addAction ["[Unlock\Lock]", "execVM 'Scripts\unlock.sqf'", [], 1, false, false, "", "count nearestObjects [player, ['Armored','Car','Support','Submarine','LandVehicle', 'Ship', 'Air'], 5] > 0"],
};


/* /=========================== Allow only certain units to use side and command chats.
if (player getUnitTrait "derp_squadleader") then {
	disableChannels[] = {{0,false,true},{1,true,true},{2,true,true},{6,true,true}};	
};
*/

//=========================== Check if player is pilot
private ["_iampilot"];

//=========================== Disable AI Random callouts over voice
player disableConversation true;[player ,"NoVoice"] remoteExec ["setSpeaker",0,true];

//=========================== Fatigue setting
if (PARAMS_Fatigue == 1) then {player enableFatigue FALSE;};

//=========================== Respawn Gear
if !(player getVariable ["derp_revive_downed", false]) then {
    if (!isNil {player getVariable "derp_savedGear"}) then {
        player setUnitLoadout [(player getVariable "derp_savedGear"), true];
    } else {
        if (!isNil {player getVariable "derp_revive_loadout"}) then {
            player setUnitLoadout [(player getVariable "derp_revive_loadout"), true];
        };
    };
};

//====================== Refueling with Repair spec and Engineer
FUELFUNC = {
	ADDFUEL = player addAction ["<t color='#99ffc6'>Refuel Aircraft</t>",{
	RF_BIRD = cursorTarget; publicVariable "RF_BIRD";
	Current_fuel = fuel RF_BIRD; if (Current_fuel <= 0.5) then { Fuel_to_ADD = Current_fuel + 0.5; publicVariable "Fuel_to_ADD";
	Send_Com = {RF_BIRD setFuel Fuel_to_ADD}; publicVariable "Send_Com";
	remoteExecCall ["Send_Com",2]; cutText['Aircraft refuelled', 'PLAIN']; } else { cutText['Fuel not required', 'PLAIN'];  };
  },[],1,false,true,""," ((vehicle player) == player) && (CursorTarget isKindOf ""Air"" ) && ((player distance cursorTarget) < 10) "];
};
if (player getUnitTrait "derp_engineer") then {player call FUELFUNC;};

//======================= Add players to Zeus
{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;