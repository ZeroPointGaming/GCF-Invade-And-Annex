if (alive radioTower) then {
				while {(alive radioTower)} do {
					if (jetCounter < 3) then {
						/* My cas spawning function
						#define CAS_PLANE_TYPE "O_Plane_CAS_02_F","I_Plane_Fighter_03_AA_F","I_Plane_Fighter_04_F","O_Plane_Fighter_02_F"
						_TargetPlane = [CAS_PLANE_TYPE] call BIS_fnc_selectRandom;
						_TargetPlane1 = [CAS_PLANE_TYPE] call BIS_fnc_selectRandom;
						
						// Spawn a CAS jet to patrol the AO at close range.
						_plane = createVehicle [_TargetPlane, getMarkerPos("plane"), [], 0, "FLY"];
						_pilotguy = [[26761.4,24593.4,0.000909805], EAST, ["O_Pilot_F"],[],[],[],[],[],232] call BIS_fnc_spawnGroup;
						((units _pilotguy) select 0) moveInDriver _plane;
						_wpcas = _pilotguy addWaypoint [getMarkerPos("radioMarker"), 0];
						_wpcas setWaypointBehaviour "SAFE";
						_wpcas setWaypointCombatMode "RED";
						_wpcas setWaypointCompletionRadius 2000;
						
						// Spawn a CAS jet to patrol the AO at long range.
						_plane1 = createVehicle [_TargetPlane, getMarkerPos("plane"), [], 0, "FLY"];
						_pilotguy1 = [[26761.4,24593.4,0.000909805], EAST, ["O_Pilot_F"],[],[],[],[],[],232] call BIS_fnc_spawnGroup;
						((units _pilotguy1) select 0) moveInDriver _plane1;
						_wpcas1 = _pilotguy1 addWaypoint [getMarkerPos("radioMarker"), 0];
						_wpcas1 setWaypointBehaviour "SAFE";
						_wpcas1 setWaypointCombatMode "RED";
						_wpcas1 setWaypointCompletionRadius 7500;
						
						//Add spawned planes to zues
						{
							_x addCuratorEditableObjects [[_plane],true ];
							_x addCuratorEditableObjects [[_plane1],true ];
						} foreach adminCurators;
						
						systemChat "Enemy air assets detected.";
						PAPABEAR=[West,"HQ"]; PAPABEAR SideChat 'Enemy Cas Inbound!';
						*/
						
						execVM "Missions\Main\CAS.sqf";
					sleep (300 + (random 480));
					};
				};
			};