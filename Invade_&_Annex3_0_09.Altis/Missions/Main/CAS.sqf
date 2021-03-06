			//Select a random plane from the CAS array
			#define CAS_PLANE_TYPE "O_Plane_CAS_02_F","I_Plane_Fighter_03_AA_F","I_Plane_Fighter_04_F","O_Plane_Fighter_02_F"
			AIR_TYPE = [CAS_PLANE_TYPE] call BIS_fnc_selectRandom;
			
			#define SPAWN_LIMIT 4
			#define FIXED_TIME 480 		// default 480
			#define RANDOM_TIME 300 	// default 300

			waitUntil {sleep 0.5; !(isNil "currentAOUp")};
			private ["_priorityMessageJet"];

			while {true} do {
				sleep (FIXED_TIME + (random RANDOM_TIME));
				if ((radioTowerAlive) && (({(typeOf _x == AIR_TYPE) && (side _x == east)} count vehicles) < SPAWN_LIMIT)) then {

					_helo_Patrol = createGroup EAST;
					_patrolPos = getMarkerPos currentAO;
					//_jtacPos = [_patrolPos, 1000, 50, 10] call BIS_fnc_findOverwatch;
					_helo_Array = [[15000, _patrolPos select 1, 2000], 20, [AIR_TYPE] call BIS_fnc_selectRandom, east] call BIS_fnc_spawnVehicle;
					//"O_recon_JTAC_F" createUnit [_jtacPos,_helo_Patrol];
					_helo_Patrol = _helo_Array select 0;
					_helo_crew = _helo_Array select 1;
					[_helo_Array select 2, _patrolPos] call BIS_fnc_taskAttack;
					
					[(units _helo_Patrol)] call QS_fnc_setSkill4;
					
					showNotification = ["EnemyJet", "Enemy jet approaching the AO!"]; publicVariable "showNotification";
					_priorityMessageJet = "<t align='center' size='2.2'>Priority Target</t><br/><t size='1.5' color='#b60000'>Enemy Jet Inbound</t><br/>____________________<br/>OPFOR are inbound with CAS to support their infantry forces!<br/><br/>This is a priority target!";
					GlobalHint = _priorityMessageJet; publicVariable "GlobalHint"; hint parseText _priorityMessageJet;
					
					waitUntil {
						sleep 5;
						_helo_Patrol setVehicleAmmo 1;
						!alive _helo_Patrol || {!canMove _helo_Patrol}
					};

					[] call QS_fnc_rewardPlusHintJet;

					sleep 5;
					_helo_Patrol setDamage 1;
					sleep 5;
					deleteVehicle _helo_Patrol;

					{
						_x setDamage 1;
						sleep 5;
						deleteVehicle _x;
					} foreach _helo_crew;
					
					{
						_x addCuratorEditableObjects [[_helo_Patrol],true ];
					} foreach adminCurators;
				};
				sleep 10;
			};
			// END CAS SCRIPT