disableSerialization;
[
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

//Message Defines
_message = ""; 
_message = _message + "<t align='left' size='8' shadow='0'></t><br />"; 
_message = _message + "<t align='left' size='2' shadow='0'>Welcome to <a color='#ff9900'>Global Coalition Force's</a> Invade and Annex!</t><br />"; 

_message = _message + "<t align='left'>______________________________________________________________________________________</t><br /><br />"; 

_message = _message + "<t align='left' size='1.5' shadow='0'><a color='#ff9900'>Join us on teamSpeak</a>: 85.236.100.121:10247</t><br /><br />"; 
_message = _message + "<t align='left' size='1.5' shadow='0'><a color='#ff9900'>Join our steam group</a>: https://goo.gl/CP9vi8</t><br />"; 

_message = _message + "<t align='left' color='#ffffff'>______________________________________________________________________________________</t><br /><br />"; 

_message = _message + "<t align='left' size='1' shadow='0'><t color='#ff9900'>Features:</t><br />"; 
_message = _message + "<t color='#ff9900'> Checkpoint Missions<br />"; 
_message = _message + "<t color='#ff9900'> Side Missions<br />"; 
_message = _message + "<t color='#ff9900'> Main Missions<br />"; 
_message = _message + "<t color='#ff9900'> Infantry Only Missions<br />"; 
_message = _message + "<t color='#ff9900'> Squad Leader Artillery Computers<br />"; 
_message = _message + "<t color='#ff9900'> Custom Pilot Turret Control System<br />"; 
_message = _message + "<t color='#ff9900'> View Distance Settings at Arsenals<br />"; 
_message = _message + "<t color='#ff9900'> Spawn safezone protection<br />"; 
_message = _message + "<t color='#ff9900'> Earplugs can be accessed with the [END] key on a US keyboard.<br />"; 
_message = _message + "<t color='#ff9900'> You can holster your weapons using the [5] key on a US keyboard.<br />"; 
_message = _message + "<t color='#ff9900'> Squad leaders can laser designated targets and call artillery using the [Insert] key on a US keyboard.<br />"; 
_message = _message + "<t color='#ff9900'> Pilots can access our custom turret control system using the [Home] key on a US keyboard.<br />"; 

_message = _message + "<t align='left' color='#ffffff'>______________________________________________________________________________________</t><br /><br />"; 

_message = _message + "<t align='left' size='2' shadow='0'><t color='#ff9900'>Server Rules:</t></t><br />"; 
_message = _message + "<t color='#ff9900'> 1. Hacking and mission exploitation will not be tolerated.<br />"; 
_message = _message + "<t color='#ff9900'> 2. Intentional team-killing will not be tolerated.<br />"; 
_message = _message + "<t color='#ff9900'> 3. Excessive, unintentional team-killing may result in a Kick/Temp ban.<br />"; 
_message = _message + "<t color='#ff9900'> 4. Unnecessary destruction of BLUFOR vehicles will not be tolerated.<br />"; 
_message = _message + "<t color='#ff9900'> 5. Verbal abuse and bullying will not be tolerated. <br />"; 
_message = _message + "<t color='#ff9900'> 6. Firing a weapon on base excessively will result in a warning.<br />"; 
_message = _message + "<t color='#ff9900'> 7. Griefing and obstructive play will not be tolerated.<br />"; 
_message = _message + "<t color='#ff9900'> 8. Excessive mic spamming, especially of Side and Global channels, will not be tolerated.<br />"; 
_message = _message + "<t color='#ff9900'> 9. Landing inside of the main spawn may result in a warning or kick.<br /><br />"; 

_message = _message + "<t color='#ff9900'> If you see a player in violation of the above, contact a community staff member.<br /><br />"; 

_message = _message + "<t align='left' size='1.0' shadow='0'><t color='#ff9900'>By Clicking Continue you agree you have read the rules, or will read them at the nearest possible opportunity</t></t><br />"; 

_message = _message + "<t align='left' color='#ffffff'>______________________________________________________________________________________</t><br /><br />"; 

_message = _message + "- <a color='#ff9900'> Want to help us out?, To Donate Hop on the teamspeak and speak with an admin. </a></t><br /><br />"; 
_message = _message + "Sincerely, <a color='#ff9900'>[GCF] Staff</a><br /><br />"; 

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;