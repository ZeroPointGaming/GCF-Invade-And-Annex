// The base weather template information is listed below:
 
// Weather Types        (#)             [Can Move From/To]      	[Settings: Overcast, Rain/Snow, Fog, WindEW, WindNS]
// Clear                (0)             [0,1,5]                     [0.30,0,0,1,1]
// Overcast             (1)             [0,1,2]                   [0.50,0,0,2,2]
// Light Rain           (2)             [1,2,3,5]                 [0.60,0.3,0.05,3,3]
// Medium Rain          (3)             [2,3,4]                     [0.70,0.5,0.05,4,4]
// Rainstorm            (4)             [3]                         [0.80,0.9,0.1,5,5]
// Light Fog            (5)             [0,2,5,6]                   [0.40,0,[0.2,0.01,15],0,0]
// Medium fog           (6)             [5,6,7]                     [0.40,0,[0.4,0.005,30],0,0]
// Dense Fog            (7)             [6]                         [0.40,0,[0.6,0.0025,45],0,0]

rw2Debug = 0;
rw2Param = 0;

// Setup Weather Types Array [Weather Name, Possible Weather Forecasts, Weather Settings] - Suggested that they are left as is.
weatherTemplates = [
        ["Clear",[0,1,5],[0.30,0,0,1,1]],
        ["Overcast",[0,1,2],[0.50,0,0,2,2]],
        ["Light Rain",[1,2,3,5],[0.60,0.3,0.05,3,3]],
        ["Medium Rain",[2,3,4],[0.70,0.5,0.05,4,4]],
        ["Rainstorm",[3],[0.80,0.9,0.1,5,5]],
        ["Light Fog",[0,2,5,6],[0.4,0,[0.1,0.01,10],0,0]]
	];
	
// Setup Initial Weather Function
mb_fnc_InitialWeather = {
	private["_weatherInitialArray","_weatherInitialSettings","_weatherInitialOvercast","_weatherInitialRainSnow","_weatherInitialFog","_weatherInitialWindEW","_weatherInitialWindNS"];
	
	waitUntil {!isNil "rw2_Current_Weather"};
	_weatherInitialArray = weatherTemplates select rw2_Current_Weather;
    weatherCurrentName = _weatherInitialArray select 0;
    _weatherInitialSettings = _weatherInitialArray select 2;

    _weatherInitialOvercast = _weatherInitialSettings select 0;
    _weatherInitialRainSnow = _weatherInitialSettings select 1;
    _weatherInitialFog = _weatherInitialSettings select 2;
    _weatherInitialWindEW = _weatherInitialSettings select 3;
    _weatherInitialWindNS = _weatherInitialSettings select 4;	

		skipTime -24;
        86400 setOvercast _weatherInitialOvercast;
        0 setRain _weatherInitialRainSnow;
        86400 setFog _weatherInitialFog;
        setWind [_weatherInitialWindEW,_weatherInitialWindNS,true];
		skipTime 24;
		sleep 1;
	    simulWeatherSync;
			
		if (rw2Debug == 1) then {hint format ["Debug Initialized Weather - %1\nOvercast: %2\nRain/Snow: %3\nFog: %4\nWind EW|NS: %5|%6",weatherCurrentName,_weatherInitialOvercast,_weatherInitialRainSnow,_weatherInitialFog,_weatherInitialWindEW,_weatherInitialWindNS];};
};

// Setup Update Weather Function
mb_fnc_UpdateWeather = {
	private ["_weatherCurrentArray","_weatherNextArray","_weatherNextSettings","_weatherNextOvercast","_weatherNextRainSnow","_weatherNextFog","_weatherNextWindEW","_weatherNextWindNS"];
    
	_weatherCurrentArray = weatherTemplates select rw2_Current_Weather;
	weatherCurrentName = _weatherCurrentArray select 0;
	_weatherNextArray = weatherTemplates select rw2_Next_Weather;
	weatherNextName = _weatherNextArray select 0;
	_weatherNextSettings = _weatherNextArray select 2;

	_weatherNextOvercast = _weatherNextSettings select 0;
	_weatherNextRainSnow = _weatherNextSettings select 1;
	_weatherNextFog = _weatherNextSettings select 2;
	_weatherNextWindEW = _weatherNextSettings select 3;
	_weatherNextWindNS = _weatherNextSettings select 4;	

	if (overcast < _weatherNextOvercast) then {0 setOvercast 1;} else {0 setOvercast 0;};
    1200 setRain _weatherNextRainSnow;
    1200 setFog _weatherNextFog;
    setWind [_weatherNextWindEW,_weatherNextWindNS,true];
	
	if (rw2Debug == 1) then {hint format ["Debug Updating Weather - %1\nOvercast: %2\nRain/Snow: %3\nFog: %4\nWind EW/NS: %5|%6",weatherNextName,_weatherNextOvercast,_weatherNextRainSnow,_weatherNextFog,_weatherNextWindEW,_weatherNextWindNS];};
};

if (isServer) then {
private ["_weatherUpdateArray","_weatherUpdateForecasts"];
// Check if there is no ParamsArray, and pick random if so, otherwise pick from paramsArray.
      if(isNil('paramsArray')) then {
        rw2_Current_Weather = floor(random(count(weatherTemplates)));
		} else {
        initialWeatherParam = (paramsArray select rw2Param);
		switch (initialWeatherParam) do{
			case 0: {rw2_Current_Weather = 0;};    										// Clear
            case 1: {rw2_Current_Weather = 1;};    										// Overcast
            case 2: {rw2_Current_Weather = 2 + (floor (random 3));};  					// Rain
            case 3: {rw2_Current_Weather = 5 + (floor (random 3));};  				 	// Fog
            case 4: {rw2_Current_Weather = floor(random(count(weatherTemplates)));};	// Random
        };
	};
	// Send out Initial Weather Variable
	publicVariable "rw2_Current_Weather";
	[] spawn mb_fnc_InitialWeather;
   // Start recurring weather loop.
    while {true} do {
		// Pick weather template from possible forecasts for next weather update
		sleep 10;
		_weatherUpdateArray = weatherTemplates select rw2_Current_Weather;
		_weatherUpdateForecasts = _weatherUpdateArray select 1;
		rw2_Next_Weather = _weatherUpdateForecasts select floor(random(count(_weatherUpdateForecasts)));
		publicVariable "rw2_Next_Weather";
		sleep 1190;
        [[],"mb_fnc_UpdateWeather",true] spawn Bis_fnc_MP;
		rw2_Current_Weather = rw2_Next_Weather;
		publicVariable "rw2_Current_Weather";
	};
};

// Run Initial Weather Function for all.
[] spawn mb_fnc_InitialWeather;