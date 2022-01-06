pvpfw_chatIntercept_allCommands = [
	[
		"help",
		{
			_commands = "";
			{
				_commands = _commands + (pvpfw_chatIntercept_commandMarker + (_x select 0)) + ", ";
			}forEach pvpfw_chatIntercept_allCommands;
			systemChat format["Available Commands: %1",_commands];
		}
	],
	[
		"teamspeak",
		{
		_tshint = "<t align='center' size='1.5'>Join Our Teamspeak</t><br/><t size='1.5' color='#b60000'>85.236.100.121:10247</t>";
		hint parseText _tshint;
		}
	],
	[
		"community",
		{
		_steamhint = "<t align='center' size='1.5'>Join Our Steam Group</t><br/><t size='1.5' color='#b60000'>https://goo.gl/CP9vi8</t>";
		hint parseText _steamhint;
		}
	],
	[
		"welcome",
		{
		execVM "Scripts\welcome.sqf";
		}
	]
];