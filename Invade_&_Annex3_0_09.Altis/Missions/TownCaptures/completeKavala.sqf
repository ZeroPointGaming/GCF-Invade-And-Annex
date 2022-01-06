//Display mission complete notification
showNotification = ["TownCap", "CSAT Forces have captured Kavala!"]; publicVariable "showNotification";
_priorityMsgTownKavala = "<t align='center' size='2.2'>Priority Target</t><br/><t size='1.5' color='#00ff00'>Kavala</t><br/>____________________<br/>CSAT Forces have have been eliminated in the town of Rodopoli, good work guys!";
GlobalHint = _priorityMsgTownKavala; publicVariable "GlobalHint"; hint parseText _priorityMsgTownKavala;

"CheckpointKavalaMkr" setMarkerAlpha 0;
	
//Complete the task
_task = ["TownAtkTask", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;