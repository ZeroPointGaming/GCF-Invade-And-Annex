_x = 0;

while {true} do 
	{
	//Area marker functions
	PatrolArea = "CheckpointDoridaMkr";
	
	//Enable the area marker on the map
	PatrolArea setMarkerAlpha 1;
	
	//Create Map marker
	_marker1 = createMarker ["TownAOMarker", getMarkerPos "CheckpointDoridaMkr"];
	_marker1 setMarkerShape "ICON";
	_marker1 setMarkerType "o_unknown";
	
	//Create Global Hint Notification 
	_targetStartText = format ["<t align='center' size='2.2'>Town Assault</t><br/><t size='1.5' align='center' color='#FFCF11'>Captured Town</t><br/>____________________<br/>CSAT Forces have captured a town! Go and take it back quickly!<br/><br/>"];[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];
    
	//Create Task
	[west,["TownAtkTask"],["CSAT Forces have captured a town! Go and take it back quickly!","Dorida is under attack by CSAT","CheckpointDoridaMkr"],(getMarkerPos "CheckpointDoridaMkr"),0,0,true,"destroy",true] call BIS_fnc_taskCreate;
	
	//Assign task to bluefor
	_task = ["TownAtkTask", "ASSIGNED",true] spawn BIS_fnc_taskSetState;
	
	//Create and spawn groups to defend the area
	_grpa = createGroup east;
	_grpaa = createGroup east;
	_grpa = [getMarkerPos "CheckpointDoridaMkr", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	_grpaa = [getMarkerPos "CheckpointDoridaMkr", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
	[_grpa, getMarkerPos "CheckpointDoridaMkr", 10] call BIS_fnc_taskDefend;
	[_grpaa, getMarkerPos "CheckpointDoridaMkr", 10] call BIS_fnc_taskDefend;
	
	//Set patrol initilization scripts
	{nul=[_x,PatrolArea] execVM 'Scripts\patrol.sqf';} foreach units _grpa;
	{nul=[_x,PatrolArea] execVM 'Scripts\patrol.sqf';} foreach units _grpaa;
	
	//Keep the units from fleeing the area of defense
	{_x allowfleeing 0} foreach units _grpa;
	{_x allowfleeing 0} foreach units _grpaa;

	//Add spawned units to zeus
	{_x addCuratorEditableObjects [units _grpa, false];} foreach AllCurators;
	{_x addCuratorEditableObjects [units _grpaa, false];} foreach AllCurators;

	_Array = units _grpa + units _grpaa;
	waitUntil{!({alive _x}foreach _Array)};

	if ((random 1) > 0.50) then
		{
			sleep (60 + (random 120));

			for "_x" from 1 to 1 do {
				_grpar = createGroup east;
				_grpar = [getMarkerPos "CheckpointDoridaMkr", EAST, (configFile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OIA_InfSquad")] call BIS_fnc_spawnGroup;
				[_grpar, getMarkerPos "CheckpointDoridaMkr", 10] call BIS_fnc_taskDefend;
				{_x allowfleeing 0} foreach units _grpar;

				_spawnRandomisationRodopoli=150;
				_spwnposNewRodopoli = [(getMarkerPos "CheckpointDoridaMkr"),random _spawnRandomisationRodopoli,random 360] call BIS_fnc_relPos;
				//_grpar setpos _spwnposNewRodopoli;
				{_x setpos _spwnposNewRodopoli} forEach units _grpar;

				_Posa = getMarkerPos "CheckpointDoridaMkr";
				_grpar addWaypoint [_Posa, 0];
				[_grpar, 0] setWaypointType "MOVE";
				
				//Add spanwed units to zeus
				{_x addCuratorEditableObjects [units _grpar, false];} foreach AllCurators;
				
			};
		};

	while{count _Array > 0}do
	{
		{if(!alive _x)then{_Array = _Array - [_x]}}foreach _Array;
		sleep 1;
	};
	sleep 3600;
};