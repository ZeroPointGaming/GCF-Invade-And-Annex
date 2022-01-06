/* ==== Init.sqf ==== */					

//=========================== client executions
_null = [] execvm "scripts\vehicle\crew\crew.sqf";
_null = [] execVM "scripts\misc\QS_icons.sqf";
_null = [] execVM "scripts\misc\diary.sqf";
_null = [] execVM "scripts\pilotCheck.sqf";
_null = [] execVM "scripts\misc\earplugs.sqf";	
_null = [] execVM "scripts\welcome.sqf";

//=========================== Temp fix to stop base from raping you
player addRating 999999;

//=========================== Chat Command System
waitUntil {!isNull (findDisplay 46)};
rwt_chatcom_main_eh = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RWT_fnc_chatcomVerify"];

//=========================== Mission starting parameters
enableSaving false;
artySorcher allowDamage False;
artyMLRS allowDamage False;

//=========================== Restrictions and arsenal
#include "defines\arsenalDefines.hpp"
if ("ArsenalFilter" call BIS_fnc_getParamValue == 1) then {
        player addEventHandler ["Take", {
            params ["_unit", "_container", "_item"];

            [_unit, 1, _item, _container] call derp_fnc_gearLimitations;
        }];
        player addEventHandler ["InventoryClosed", {
            params ["_unit"];

            [_unit, 0] call derp_fnc_gearLimitations;
        }];
    };
[{[_this select 0, ("ArsenalFilter" call BIS_fnc_getParamValue)] call derp_fnc_VA_filter}, [ArsenalBoxes], 3] call derp_fnc_waitAndExecute; // Init arsenal boxes.
    {
    _x addAction [
        "<t color='#006bb3'>Save gear</t>",
        {
            player setVariable ["derp_savedGear", (getUnitLoadout player)];
            systemChat "";
        }
    ];
    } foreach ArsenalBoxes;

//=========================== SafeZone
player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "respawn_west") < 300) then {
		deleteVehicle _projectile;
		hintC "Do not fire, throw or place anything inside the base!";
	}}];
player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "safeZoneHill") < 300) then {
		deleteVehicle _projectile;
		hintC "Do not fire, throw or place anything inside the base!";
	}}];

//=========================== BIS groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//=========================== Respawn
if ("derp_revive" in (getMissionConfigValue "respawnTemplates")) then {
    if (getMissionConfigValue "derp_revive_everyoneCanRevive" == 0) then {
        if (player getUnitTrait "medic") then {
            call derp_revive_fnc_drawDowned;
        };
    } else {
        call derp_revive_fnc_drawDowned;
    };
    call derp_revive_fnc_handleDamage;
    call derp_revive_fnc_diaryEntries;
    if (getMissionConfigValue "respawnOnStart" == -1) then {[player] call derp_revive_fnc_reviveActions};
};
waitUntil {!isNull (findDisplay 46)};
player disableConversation true;[player ,"NoVoice"] remoteExec ["setSpeaker",0,true];

//=========================== Includes
#include "\a3\functions_f_mp_mark\Revive\defines.hpp"

//=========================== Save Inventory
[ player, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_saveInventory;

//=========================== Save Inventory Upon Arsenal Exit
[ missionNamespace, "arsenalClosed", {
	systemChat "Arsenal Closed Gear Saved";
	[ player, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_saveInventory;
}] call BIS_fnc_addScriptedEventHandler;

//=========================== Save Backpack Items when player dies
player addEventHandler [ "Killed", {
	params[
		"_unit",
		"_killer"
	];
	//systemChat "Killed";
	if ( GET_STATE( _unit ) isEqualTo STATE_DOWNED ) then {
		//systemChat "Downed - saving backpack and contents";
		_unit setVariable [ "backpack", backpack _unit ];
		_unit setVariable [ "backpack_items", backpackItems _unit ];
	};
}];
[ missionNamespace, "reviveRevived", {
	_unit = _this select 0;
	_revivor = _this select 1;
	addToScore = [_revivor, 2]; publicVariable "addToScore";
	["ScoreBonus", ["Revived a fellow soldier.", "2"]] call bis_fnc_showNotification;
	
} ] call BIS_fnc_addScriptedEventHandler;

player addEventHandler [ "Respawn", {
	params[
		"_unit",
		"_corpse"
	];
	//systemChat "Respawning";
	//systemChat format[ "state %1", GET_STATE_STR(GET_STATE( _unit )) ];
	switch ( GET_STATE( _unit ) ) do {
		case STATE_INCAPACITATED : {
			//systemChat "Incapacitated";
			_backpack = _corpse getVariable [ "backpack", "" ];
			if !( _backpack isEqualTo "" ) then {
				//systemChat "Fixing units backpack and items";
				removeBackpackGlobal _unit;
				_unit addBackpackGlobal _backpack;
				_items = _corpse getVariable [ "backpack_items", [] ];
				{
					_unit addItemToBackpack _x;
				}forEach _items;
			};
		};
		case STATE_RESPAWNED : {
			h = _unit spawn {
				params[ "_unit" ];
				//systemChat "Died or Respawned via menu";
				_templates = [];
				{
					{
						_nul = _templates pushBackUnique _x;
					}forEach ( getMissionConfigValue [ _x, [] ] );
				}forEach [ "respawntemplates", format[ "respawntemplates%1", str playerSide ] ];
				sleep playerRespawnTime;
				if ( { "menuInventory" == _x }count _templates > 0 ) then {
					//systemChat "Respawning - saving menu inventory";
					[ _unit, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_saveInventory;
				}else{
					//systemChat "Respawning - loading last saved";
					[ _unit, [ missionNamespace, "currentInventory" ] ] call BIS_fnc_loadInventory;
				};
				_unit setVariable [ "backpack", nil ];
				_unit setVariable [ "backpack_items", nil ];
			};
		};
	};
}];