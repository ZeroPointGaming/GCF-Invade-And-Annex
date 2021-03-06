#include "unitDefines.hpp"
/*
* Author: alganthe
* Handles creating the AI
*
* Arguments:
* 0: Position of the mission <POSITION>
* 1: <ARRAY>
*    1: Place AA vehicles <BOOL>
*    2: Place  MRAPS <BOOL>
*    3: Place random vehcs <BOOL>
*    4: Place infantry groups <BOOL>
*    5: Place AA groups <BOOL>
*    6: Place AT groups <BOOL>
*    7: Place urban groups <BOOL>
*    8: Place infantry in milbuildings <BOOL>
* 2: AA vehicles amount <SCALAR> (OPTIONNAL)
* 3: MRAPs amount <SCALAR> (OPTIONNAL)
* 4: Random vehcs amount <SCALAR> (OPTIONNAL)
* 5: Infantry groups amount <SCALAR> (OPTIONNAL)
* 6: AA groups amount <SCALAR> (OPTIONNAL)
* 7: AT groups amount <SCALAR> (OPTIONNAL)
* 8: Urban groups amount <SCALAR> (OPTIONNAL)
*
* Return Value:
* Array of units created if executed on the server
* Nothing if executed anywhere else (it publicVarServer the array of spawned units instead)
*
* Example:
*
*[_pos, [true, true, false, true, true, true, true, false], 2, 1, 3, 5, 1, 1, 3] call derp_fnc_mainAOSpawnHandler;
*/
params ["_AOpos", "_settingsArray", ["_radiusSize", derp_PARAM_AOSizeInfantry], ["_AAAVehcAmount", derp_PARAM_AntiAirAmount], ["_MRAPAmount", derp_PARAM_MRAPAmount], ["_randomVehcsAmount", derp_PARAM_RandomVehcsAmount], ["_infantryGroupsAmountInfantry", derp_PARAM_InfantryGroupsAmountInfantry], ["_AAGroupsAmountInfantry", derp_PARAM_AAGroupsAmountInfantry], ["_ATGroupsAmountInfantry", derp_PARAM_ATGroupsAmountInfantry], ["_urbanInfantryAmount", 2]];

_settingsArray params [["_AAAVehcSetting", false], ["_MRAPSetting", false], ["_randomVehcsSetting", false], ["_infantryGroupsSetting", false], ["_AAGroupsSetting", false], ["_ATGroupsSetting", false], ["_urbanInfantrySetting", false], ["_milbuildingInfantry", false]];

private _spawnedUnits = [];
private _AISkillUnitsArray = [];

//-------------------------------------------------- main infantry groups
if (_infantryGroupsSetting) then {
    for "_x" from 1 to _infantryGroupsAmountInfantry do {
        private _randomPos = [[[_AOpos, _radiusSize * 1.2], []], ["water", "out"]] call BIS_fnc_randomPos;
		private _infantryGroup = createGroup EAST;
		for "_x" from 1 to 8 do {
			private _squadPos = [[[_randomPos, 10], []], ["water", "out"]] call BIS_fnc_randomPos;
			_unitArray = (missionconfigfile >> "unitList" >> MainFaction >> "units") call BIS_fnc_getCfgData;
			_unit = _unitArray call BIS_fnc_selectRandom;
			_grpMember = _infantryGroup createUnit [_unit, _squadPos, [], 0, "FORM"];
		};

        [_infantryGroup, _AOpos, _radiusSize / 1.6] call AW_FNC_taskPatrol;

        {
            _spawnedUnits pushBack _x;
            _AISkillUnitsArray pushBack _x;
			
        } foreach (units _infantryGroup);
    };
};

//-------------------------------------------------- AA groups
if (_AAGroupsSetting) then {
    for "_x" from 1 to _AAGroupsAmountInfantry do {
        private _randomPos = [[[_AOpos, _radiusSize], []], ["water", "out"]] call BIS_fnc_randomPos;
        private _infantryGroup = [_randomPos, EAST, (configfile InfantryGroupsCFGPATH (selectRandom AAGroupsList))] call BIS_fnc_spawnGroup;

        [_infantryGroup, _AOpos, _radiusSize / 1.6] call AW_FNC_taskPatrol;

        {
            _spawnedUnits pushBack _x;
            _AISkillUnitsArray pushBack _x;
        } foreach (units _infantryGroup);
    };
};

//-------------------------------------------------- AT groups
if (_ATGroupsSetting) then {
    for "_x" from 1 to _ATGroupsAmountInfantry do {
        private _randomPos = [[[_AOpos, _radiusSize], []], ["water", "out"]] call BIS_fnc_randomPos;
        private _infantryGroup = [_randomPos, EAST, (configfile InfantryGroupsCFGPATH (selectRandom ATGroupsList))] call BIS_fnc_spawnGroup;

        [_infantryGroup, _AOpos, _radiusSize / 1.6] call AW_FNC_taskPatrol;

        {
            _spawnedUnits pushBack _x;
            _AISkillUnitsArray pushBack _x;
        } foreach (units _infantryGroup);
    };
};

//-------------------------------------------------- Indoors infantry
if (_urbanInfantrySetting) then {
    for "_x" from 1 to _urbanInfantryAmount do {


		private _group = createGroup EAST;
		for "_x" from 1 to 8 do {
			_unitArray = (missionconfigfile >> "unitList" >> MainFaction >> "units") call BIS_fnc_getCfgData;
			_unit = _unitArray call BIS_fnc_selectRandom;
			_grpMember = _group createUnit [_unit, _AOpos, [], 0, "FORM"];
		};
        private _returnedUnits = [_AOpos, nil, (units _group), (_radiusSize / 3), 2, false] call derp_fnc_AIOccupyBuilding;

        { deleteVehicle _x } foreach _returnedUnits;

        {
            _spawnedUnits pushBack _x;
            _AISkillUnitsArray pushBack _x;
        } foreach (units _group);
    };
};

//-------------------------------------------------- Military area
if (_milbuildingInfantry) then {
    private _milBuildings = nearestObjects [_AOpos, MilitaryBuildings, (_radiusSize + 100)];

    _milBuildingCount = count _milBuildings;
    if (_milBuildingCount > 0 ) then {

        for "_x" from 1 to 3 do {

			private _group = createGroup EAST;
			for "_x" from 1 to 8 do {
				_unitArray = (missionconfigfile >> "unitList" >> MainFaction >> "units") call BIS_fnc_getCfgData;
				_unit = _unitArray call BIS_fnc_selectRandom;
				_grpMember = _group createUnit [_unit, _AOpos, [], 0, "FORM"];
			};
            private _returnedUnits= [_AOpos, MilitaryBuildings, (units _group), (_radiusSize + 100), 2, false] call derp_fnc_AIOccupyBuilding;

            { deleteVehicle _x } foreach _returnedUnits;

            {
                _spawnedUnits pushBack _x;
                _AISkillUnitsArray pushBack _x;
            } foreach (units _group);
        };
    };
};

//-------------------------------------------------- SetSkill + network operations
[_AISkillUnitsArray] call derp_fnc_AISkill;

if (isServer) then {
    {
        _x addCuratorEditableObjects [_spawnedUnits, true];
    } foreach allCurators;
    _spawnedUnits
} else {
    [_spawnedUnits, true] remoteExec ["derp_fnc_remoteAddCuratorEditableObjects", 2];
    spawnedUnits = _spawnedUnits;
    publicVariableServer "spawnedUnits";
    spawnedUnits = nil;
};
