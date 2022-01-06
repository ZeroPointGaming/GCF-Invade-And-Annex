/*
| Author: 
|
|	Sgt. Justin
|_____
|
| Description: 
|	
|	Created: 26/11/2013.
|	Last modified:29/10/2014.
|_____
|
| Usage: 
|	
|	DiarySubjects appear in descending order when player map is open.
|	DiaryRecords appear in ascending order when selected.
|_____
|
| Credit:
|
|	Invade & Annex 3.0.0.9 was developed by Rarek and Quicksilver
|	Contributors: Justin [GCF], Train [GCF], Chance [GCF], Banshee [GCF]
|	
|	Please be respectful and do not remove credit.
|______________________________________________________________*/

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

//-------------------------------------------------- Subjects
player createDiarySubject ["rules", "Rules"];
player createDiarySubject ["mods", "Mods"];
player createDiarySubject ["teamspeak", "Teamspeak"];
player createDiarySubject ["faq", "FAQ"];
player createDiarySubject ["credits", "Credits"];

//-------------------------------------------------- Rules
player createDiaryRecord ["rules",
[
"Enforcement",
"
<br />The purpose of the above rules are to ensure a fun and relaxing environment for public players.
<br />
<br />Server rules are in place merely as a means to that end.
<br />
<br />Guideline for enforcement:
<br />
<br />-	Innocent rule violation and disruptive behavior: 
<br />
<br />		= Verbal / Written request to cease, or warning.
<br /> 
<br />-	Minor or first-time rule violation:
<br />
<br />		= Kick, or 0 - 3 day ban.
<br />
<br />-	Serious or repetitive rule violation: 
<br />
<br />		= 3 - 7 day ban.
<br />
<br />-	Administrative ban (hack/exploit/verbal abuse/serious offense):
<br />
<br />		= permanent or 30 day.
<br />
<br />
<br />The above is subject to discretion.
"
]];
player createDiaryRecord ["rules",
[
"General",
"
<br />1. Hacking and mission exploitation will not be tolerated.
<br />2. Intentional team-killing will not be tolerated.
<br />3. Excessive, unintentional team-killing may result in a Kick/Temp ban.
<br />4. Unnecessary destruction of BLUFOR vehicles will not be tolerated.
<br />5. Verbal abuse and bullying will not be tolerated. 
<br />6. Firing a weapon on base excessively will result in a warning.
<br />7. Griefing and obstructive play will not be tolerated.
<br />8. Excessive mic spamming, especially of Side and Global channels, will not be tolerated.
<br />10. Landing inside of the main spawn may result in a warning or kick.
<br />
<br />If you see a player in violation of the above, contact a moderator or admin (teamspeak).
"
]];

//-------------------------------------------------- Mods
player createDiaryRecord ["mods",
[
"Serverside",
"
<br /> Mods currently running on server (subject to change without notice):<br /><br />

<br />- None at this time. 
"
]];

player createDiaryRecord ["mods",
[
"Mods Allowed",
"
<br /> Mods currently allowed (subject to change without notice):<br /><br />
		
<br />- JSRS - 2.0 and 2.1 - Enhanced sounds and audio.
		http://www.armaholic.com/page.php?id=22150<br /><br />
		
<br />- Blastcore - R3 - Enhanced visual effects.
		http://www.armaholic.com/page.php?id=23899<br /><br />
		
<br />- ShackTac Fireteam HUD - v140302 - Situational awareness HUD
		http://www.armaholic.com/page.php?id=9936<br /><br />
"
]];

//-------------------------------------------------- Teamspeak
player createDiaryRecord ["teamspeak",
[
"TS3",
"
<br /> Teamspeak:<br /><br />
<br /> http://www.teamspeak.com/?page=downloads
"
]];

player createDiaryRecord ["teamspeak",
[
"Global Coalition Force",
"
<br /> Teamspeak Address: 85.236.100.121:10247
<br />
<br /> Visitors and guests welcome!
"
]];

//-------------------------------------------------- FAQ
player createDiaryRecord ["faq",
[
"UAVs",
"
<br /><font size='16'>Q:</font> Can I use the UAVs?<br />
<br /><font size='16'>A:</font> Yes, however you must be in the UAV Operator role and you must have a UAV Terminal.
<br />
<br />
<br /><font size='16'>Q:</font> Why do the UAVs keep exploding?<br />
<br /><font size='16'>A:</font> When the bomb-equipped UAVs are first connected to, the Gunner AI fires its weapons. Until it's fixed, here is a guide for you.<br />
<br /> To safely connect to the MQ4A Greyhawk UAV:<br />
<br />	1. Enter action menu (mouse scroll), click 'Open UAV Terminal'.
<br />	2. Right-click on the UAV you wish to control, on the terminal map.
<br />	3. Click 'Connect Terminal to UAV'.
<br /><br /> [IMPORTANT] Do NOT click 'Take Control' button in UAV Terminal.<br />
<br />	4. Esc out of the UAV terminal.
<br />	5. Enter action menu (mouse scroll) again.
<br />	6. [IMPORTANT] Select 'Take UAV TURRET controls'.<br />
<br />
<br />	It is now safe to 'Take Control' of the UAV.
<br />
<br />
<br /><font size='16'>Q:</font> Why can't I connect to the UAV?<br />
<br /><font size='16'>A:</font> Sometimes the UAVs are still connected to the prior Operators Terminal. If he disconnects or dies, sometimes the Terminal does not delete properly. The only solution at this time is to destroy the UAV, and you yourself must respawn.
"
]];
player createDiaryRecord ["faq",
[
"Squads",
"
<br /><font size='16'>Q:</font> How do I join a squad?<br />
<br /><font size='16'>A:</font> 
<br /> 1. Press [U] on US Keyboard
<br /> 2. Either click on the name of the group you want to join or click create.
<br /> 3. You can double click the name at the top right to change it.
<br /> 4. Make sure your squad name is phonetic, this means (alpha,bravo,charlie etc).
<br />
"
]];
player createDiaryRecord ["faq",
[
"Vehicles Crews",
"
<br /><font size='16'>Q:</font> How can i get a tank or vehicle squad.<br />
<br /><font size='16'>A:</font> As a squad leader switch to command chat and ask HQ, if he says yes then continue below.
<br /> 1. Find an engineere to join your squad.
<br /> 2. Find a third person to join your squad.
<br /> 3. Let hq know you have atleast a 3 man squad.
<br /> 4. Choose a vehicle or have hq choose one for you.
<br />
<br /> Enjoy your vehicle crew squad
"
]];
player createDiaryRecord ["faq",
[
"Medics",
"
<br /><font size='16'>Q:</font> Why can't I heal him?<br />
<br /><font size='16'>A:</font> There are three conditions you must pass in order to revive a fallen comrade. 
<br /> 1. You must be in a Medic / Paramedic role.
<br /> 2. You must have a Medkit.
<br /> 3. You must have at least one First Aid Kit.
"
]];
player createDiaryRecord ["faq",
[
"Mortars",
"
<br /><font size='16'>Q:</font> Can I use the Mortars?
<br /><font size='16'>A:</font> Yes, However if you are not in the mortar gunner role you will not have acess to the Artillery Computer.<br />
<br /><font size='16'>Q:</font> How do I use the Mortar without the computer?
<br /><font size='16'>A:</font> You have to manually find the target with the sight. Here are some steps to use the mortar. 
<br /> 1. Press the F key to select the firing distance.
<br /> 2. If you are in line-of-sight just put the cursor on the target and use the page up and page down keys to change the elevation.
<br /> 3. Fire!<br /> 
<br /><font size='16'>Here is a youtube video that can explain in more detail.<br />
<br /> https://www.youtube.com/watch?v=SCCvXfwzeAU
"
]];
player createDiaryRecord ["faq",
[
"Server FAQ",
"
<br /><font size='16'>Q:</font> How can i use the artillery computer.<br />
<br /><font size='16'>A:</font> You must be a squad leader role to be able to access the computer using the [Insert] key on a US Keyboard.<br />
<br />
<br />
<br /><font size='16'>Q:</font> As a helicopter pilot how can i lock my turrets?.<br />
<br /><font size='16'>A:</font> When you are in the pilot seat of a helicopter in the UH80 class range then if you press the [Home] key on a US keyboard the turrets will lock and unlock accordingly.<br />
<br />
<br />
<br /><font size='16'>Q:</font> Checkpoint Missions, how do they work?<br />
<br /><font size='16'>A:</font> Checkpoint missions were designed with a focus on small squad gameplay, When a squad goes to attack a checkpoint the ai's will fight to defend it, once the checkpoint has been captured bluefor forces move into the checkpoint area to capture it.<br />
"
]];

//-------------------------------------------------- Credits
player createDiaryRecord ["credits",
[
"I & A",
"
<br />Mission authors:<br /><br />

		- <font size='16'>Rarek</font> - Ahoy World (ahoyworld.co.uk)<br /><br />
		- <font size='16'>Quiksilver</font><br />
		
<br />Contributors:<br /><br />
		- Jester - Ahoy World (ahoyworld.co.uk)<br />
		- Razgriz33 - Ahoy World (ahoyworld.co.uk)<br />
		- Kamaradski - Ahoy World (ahoyworld.co.uk)<br />
		- BACONMOP - Ahoy World (ahoyworld.co.uk)<br />
		- chucky - All FPS (allfps.com.au)<br />
		- Train - GlobalCoalitionForce<br />
		- Banshee - GlobalCoalitionForce<br />
		- Chance - GlobalCoalitionForce<br /><br /><br />
		
		- Justin - DeadManGaming (jahhd.net)<br />
		Squad Leader Artillery Computer<br />
		Custom turret locking system using keyPress insted of addaction<br />
		Randomized mission starting weather script<br />
		Randomized mission starting time script<br /><br />
		
		- Banshee - GlobalCoalitionForce<br />
		Customized base design<br />
"
]];