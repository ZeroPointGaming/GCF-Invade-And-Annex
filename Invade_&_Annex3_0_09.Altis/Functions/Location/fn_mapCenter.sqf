/*
    Author: Pfc.Christiansen
*/
_mapSize = [configfile >> "cfgworlds" >> "Altis","mapSize"] call bis_fnc_returnConfigEntry;
_mapHalf = _mapSize / 2;
mapCent = [_mapHalf,_mapHalf,0];
publicVariable "mapCent";
