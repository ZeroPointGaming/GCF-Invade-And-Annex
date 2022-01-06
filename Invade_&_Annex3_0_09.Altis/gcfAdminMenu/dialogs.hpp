class AdminMainMenu_dialog
{
	idd=-1;
	movingenable=true;
		
	class controls 
	{
		class adminMainMenuFrame: GCFFrame
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919809 * safezoneH + safezoneY;
			w = 0.621156 * safezoneW;
			h = 0.816037 * safezoneH;
		};
		class adminMainMenuBox: BOX
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919809 * safezoneH + safezoneY;
			w = 0.621156 * safezoneW;
			h = 0.816037 * safezoneH;
		};
		class adminMainMenuSpawnText: GCFText
		{
			idc = 1000;
			text = "Spawn Menus"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.108982 * safezoneH + safezoneY;
			w = 0.0875989 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
		class adminMainMenuSpawnVehiclesBtn: GCFButton
		{
			idc = 1600;
			text = "Spawn Vehicles Menu"; //--- ToDo: Localize;
			x = 0.205349 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.159271 * safezoneW;
			h = 0.0850039 * safezoneH;
			tooltip = "Vehicles Spawn Menu"; //--- ToDo: Localize;
			action = "closeDialog 0;_handle=createdialog 'AdminSpawnMenu_dialog';";
		};
		class adminMainMenuSpawnUnitsBtn: GCFButton
		{
			idc = 1601;
			text = "Spawn Units Menu"; //--- ToDo: Localize;
			x = 0.205349 * safezoneW + safezoneX;
			y = 0.27899 * safezoneH + safezoneY;
			w = 0.159271 * safezoneW;
			h = 0.0850039 * safezoneH;
			tooltip = "Units Spawn Menu"; //--- ToDo: Localize;
			action = "closeDialog 0;_handle=createdialog 'AdminSpawnMenuUnits_dialog';";
		};
		class adminMainMenuPlayerMenuTxt: GCFText
		{
			idc = 1001;
			text = "Player Menu"; //--- ToDo: Localize;
			x = 0.404438 * safezoneW + safezoneX;
			y = 0.108982 * safezoneH + safezoneY;
			w = 0.0875989 * safezoneW;
			h = 0.0510023 * safezoneH;
		};
		class adminMainMenuPlayerMenuBtn: GCFButton
		{
			idc = 1602;
			text = "Player Customization Menu"; //--- ToDo: Localize;
			x = 0.412401 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.167234 * safezoneW;
			h = 0.0850039 * safezoneH;
			tooltip = "Player editing menu"; //--- ToDo: Localize;
			action = "closeDialog 0;_handle=createdialog 'AdminPlayerEditor_dialog';";
		};
	};
};

//Player Editing Menu
class AdminPlayerEditor_dialog
{
	idd=-1;
	movingenable=true;
		
	class controls 
	{
		class adminMainMenuFrame: GCFFrame
		{
			idc = 1800;
			x = -11 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
		};
		class adminMainMenuBOX: BOX
		{
			idc = 1800;
			x = -11 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 10.5 * GUI_GRID_H;
		};
		class PlayerGodOnBtn: GCFButton
		{
			idc = 1600;
			text = "Player Godmode On"; //--- ToDo: Localize;
			x = 0.0140574 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.183224 * safezoneW;
			h = 0.068 * safezoneH;
			tooltip = "Enable godmode for your player"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\enablePlayerGod.sqf""";

		};
		class PlayerGodOffBtn: GCFButton
		{
			idc = 1601;
			text = "Player Godmode Off"; //--- ToDo: Localize;
			x = 0.0140574 * safezoneW + safezoneX;
			y = 0.177 * safezoneH + safezoneY;
			w = 0.183224 * safezoneW;
			h = 0.068 * safezoneH;
			tooltip = "Disable godmode for your player"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\disablePlayerGod.sqf""";
		};
		class VehicleGodOnBtn: GCFButton
		{
			idc = 1602;
			text = "Vehicle Godmode On"; //--- ToDo: Localize;
			x = 0.0140574 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.183224 * safezoneW;
			h = 0.068 * safezoneH;
			tooltip = "Enable godmode for the vehicle you are currently in"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\enableCarGod.sqf""";
		};
		class VehicleGodOffBtn: GCFButton
		{
			idc = 1603;
			text = "Vehicle Godmode Off"; //--- ToDo: Localize;
			x = 0.0140574 * safezoneW + safezoneX;
			y = 0.347 * safezoneH + safezoneY;
			w = 0.183224 * safezoneW;
			h = 0.068 * safezoneH;
			tooltip = "Disable godmode for the vehicle your are currently in"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\disableCarGod.sqf""";
		};
	};
};

//Vehicle Spawn Menu
class AdminSpawnMenu_dialog
{
	idd=-1;
	movingenable=true;
		
	class controls 
	{
		class adminMainMenuFrame: GCFFrame
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
		class adminMainMenuBox: BOX
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
		class RscButton_1600: GCFButton
		{
			idc = 1600;
			text = "BLUEFOR"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.108982 * safezoneH + safezoneY;
			w = 0.111489 * safezoneW;
			h = 0.0850039 * safezoneH;
			tooltip = "BLUEFOR Vehicle Spawn Menu"; //--- ToDo: Localize;
			action = "closeDialog 0;_handle=createdialog 'BLUEFORSpawnMenu_dialog';";
		};
		class RscButton_1601: GCFButton
		{
			idc = 1601;
			text = "OPFOR"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.111489 * safezoneW;
			h = 0.0850039 * safezoneH;
			tooltip = "Opfor Vehicle Spawn Menu"; //--- ToDo: Localize;
			action = "closeDialog 0;_handle=createdialog 'OPFORSpawnMenu_dialog';";
		};
		class RscButton_1602: GCFButton
		{
			idc = 1602;
			text = "INDEPENDANT"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.312991 * safezoneH + safezoneY;
			w = 0.111489 * safezoneW;
			h = 0.0850039 * safezoneH;
			tooltip = "Independant Vehicle Spawn Menu"; //--- ToDo: Localize;
			action = "closeDialog 0;_handle=createdialog 'INDEPSpawnMenu_dialog';";
		};
		class RscButton_1603: GCFButton
		{
			idc = 1603;
			text = "CIVILIAN"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.414996 * safezoneH + safezoneY;
			w = 0.111489 * safezoneW;
			h = 0.0850039 * safezoneH;
			tooltip = "Civilan Vehicle Spawn Menu"; //--- ToDo: Localize;
			action = "closeDialog 0;_handle=createdialog 'CIVpawnMenu_dialog';";
		};
	};
};

//BLUEFOR Vehicle Menu	
class BLUEFORSpawnMenu_dialog
{
	idd=-1;
	movingenable=true;
		
	class controls 
	{
		class adminMainMenuFrame: GCFFrame
		{
			idc = 1800;
			x = 0.189315 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.621369 * safezoneW;
			h = 0.816 * safezoneH;
		};
		class adminMainMenuBox: BOX
		{
			idc = 1800;
			x = 0.189315 * safezoneW + safezoneX;
			y = 0.092 * safezoneH + safezoneY;
			w = 0.621369 * safezoneW;
			h = 0.816 * safezoneH;
		};
		class GCFButton_Marshall: GCFButton
		{
			idc = 1600;
			text = "Marshall"; //--- ToDo: Localize;
			x = 0.197282 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "AMV-7 Marshall"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnMarshall.sqf""";
		};
		class GCFText_APC: GCFText
		{
			idc = 1000;
			text = "APC's"; //--- ToDo: Localize;
			x = 0.197282 * safezoneW + safezoneX;
			y = 0.109 * safezoneH + safezoneY;
			w = 0.0637302 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GCFButton_TepestAmmo: GCFButton
		{
			idc = 1601;
			text = "Tempest - Ammo"; //--- ToDo: Localize;
			x = 0.324742 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Tempest - Ammo"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnTempestAmmo.sqf""";
		};
		class GCFText_UTILITY: GCFText
		{
			idc = 1001;
			text = "Utility"; //--- ToDo: Localize;
			x = 0.324742 * safezoneW + safezoneX;
			y = 0.109 * safezoneH + safezoneY;
			w = 0.0637302 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GCFButton_TempestFuel: GCFButton
		{
			idc = 1602;
			text = "Tempest - Fuel"; //--- ToDo: Localize;
			x = 0.324742 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Tempest - Fuel"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnTempestFuel.sqf""";
		};
		class GCFButton_Repair: GCFButton
		{
			idc = 1603;
			text = "Tempest - Repair"; //--- ToDo: Localize;
			x = 0.324742 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Tempest - Repair"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnTempestRepair.sqf"""
		};
		class GCFButton_TempestTransport: GCFButton
		{
			idc = 1604;
			text = "Tempest - Transport"; //--- ToDo: Localize;
			x = 0.324742 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Tempest - Transport"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnTempestTransport.sqf"""
		};
		class GCFText_TANKS: GCFText
		{
			idc = 1002;
			text = "Tanks"; //--- ToDo: Localize;
			x = 0.452202 * safezoneW + safezoneX;
			y = 0.109 * safezoneH + safezoneY;
			w = 0.0637302 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GCFButton_Slammer: GCFButton
		{
			idc = 1605;
			text = "Slammer"; //--- ToDo: Localize;
			x = 0.460169 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Slammer"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnSlammer.sqf"""
		};
		class GCFText_MRAP: GCFText
		{
			idc = 1003;
			text = "MRAP's"; //--- ToDo: Localize;
			x = 0.587629 * safezoneW + safezoneX;
			y = 0.109 * safezoneH + safezoneY;
			w = 0.0637302 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GCFButton_Hunter: GCFButton
		{
			idc = 1606;
			text = "Hunter"; //--- ToDo: Localize;
			x = 0.595595 * safezoneW + safezoneX;
			y = 0.16 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Hunter"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnHunter.sqf"""
		};
		class GCFButton_Hunter_Hmg: GCFButton
		{
			idc = 1607;
			text = "Hunter - HMG"; //--- ToDo: Localize;
			x = 0.595595 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Hunter - HMG"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnHunterHMG.sqf"""
		};
		class GCFButton_Hunter_Gmg: GCFButton
		{
			idc = 1608;
			text = "Hunter - GMG"; //--- ToDo: Localize;
			x = 0.595595 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Hunter - GMG"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnHunterGMG.sqf"""
		};
		class GCFButton_Scorcher: GCFButton
		{
			idc = 1609;
			text = "Scorcher"; //--- ToDo: Localize;
			x = 0.460169 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Scorcher"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnScorcher.sqf"""
		};
		class GCFButton_MLRS: GCFButton
		{
			idc = 1610;
			text = "MLRS"; //--- ToDo: Localize;
			x = 0.460169 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "MLRS"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnMLRS.sqf"""
		};
		class RscButton_1611: GCFButton
		{
			idc = 1611;
			text = "Bobcat"; //--- ToDo: Localize;
			x = 0.198251 * safezoneW + safezoneX;
			y = 0.208 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Bobcat"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnBobcat.sqf"""
		};
		class RscButton_1612: GCFButton
		{
			idc = 1612;
			text = "Panther"; //--- ToDo: Localize;
			x = 0.197282 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Panther"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnPanther.sqf"""
		};
		class GCFText_HELICOPTERS: GCFText
		{
			idc = 1004;
			text = "Helicopters"; //--- ToDo: Localize;
			x = 0.197282 * safezoneW + safezoneX;
			y = 0.449 * safezoneH + safezoneY;
			w = 0.0796627 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GCFText_PLANES: GCFText
		{
			idc = 1005;
			text = "Planes"; //--- ToDo: Localize;
			x = 0.37254 * safezoneW + safezoneX;
			y = 0.449 * safezoneH + safezoneY;
			w = 0.0716964 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GCFButton_Ghosthawk: GCFButton
		{
			idc = 1613;
			text = "Ghosthawk"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Ghosthawk"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnGhosthawk.sqf"""
		};
		class GCFButton_Ghosthawk_Sand: GCFButton
		{
			idc = 1614;
			text = "Ghosthawk - Sand"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Ghosthawk - Sand"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnGhosthawkSand.sqf"""
		};
		class GCFButton_Blackfoot: GCFButton
		{
			idc = 1615;
			text = "Blackfoot"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Blackfoot"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnBlackfoot.sqf"""
		};
		class GCFButton_Ghosthawk_Tropic: GCFButton
		{
			idc = 1616;
			text = "Ghosthawk - Tropic"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Ghosthawk - Tropic"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnGhosthawkTropic.sqf"""
		};
		class GCFButton_Kajimin_Black: GCFButton
		{
			idc = 1617;
			text = "Kajimin Black"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.704 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Kajimin Black"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnKajiminBlack.sqf"""
		};
		class GCFButton_Pawnee: GCFButton
		{
			idc = 1618;
			text = "Pawnee"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.755 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Pawnee"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnPawnee.sqf"""
		};
		class GCFButton_Hummingbird: GCFButton
		{
			idc = 1619;
			text = "Hummingbird"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.806 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Hummingbird"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnHummingbird.sqf"""
		};
		class GCFText_UAVs: GCFText
		{
			idc = 1006;
			text = "UAV's"; //--- ToDo: Localize;
			x = 0.547798 * safezoneW + safezoneX;
			y = 0.449 * safezoneH + safezoneY;
			w = 0.0716964 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class GCFButton_Wipeout_CAS: GCFButton
		{
			idc = 1620;
			text = "Wipeout CAS"; //--- ToDo: Localize;
			x = 0.380506 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Wipeout CAS"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnWipeoutCAS.sqf"""
		};
		class GCFButton_Greyhawk_CAS: GCFButton
		{
			idc = 1621;
			text = "Greyhawk CAS"; //--- ToDo: Localize;
			x = 0.555764 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Greyhawk CAS"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnGreyhawkCAS.sqf"""
		};
		class GCFButton_Greyhawk: GCFButton
		{
			idc = 1622;
			text = "Greyhawk"; //--- ToDo: Localize;
			x = 0.555764 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Greyhawk"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnGreyhawk.sqf"""
		};
		class GCFButton_Stomper: GCFButton
		{
			idc = 1623;
			text = "Stomper"; //--- ToDo: Localize;
			x = 0.555764 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Stomper"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnStomper.sqf"""
		};
		class GCFButton_Stomper_RCWS: GCFButton
		{
			idc = 1624;
			text = "Stomper RCWS"; //--- ToDo: Localize;
			x = 0.555764 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Stomper RCWS"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnStomperRCWS.sqf"""
		};
		class GCFButton_Huron_UNARMED: GCFButton
		{
			idc = 1625;
			text = "Huron Unarmed"; //--- ToDo: Localize;
			x = 0.205248 * safezoneW + safezoneX;
			y = 0.857 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Huron Unarmed"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnHuronUnarmed.sqf"""
		};
		class GCFButton_Blackfish_Vehicle: GCFButton
		{
			idc = 1626;
			text = "Blackfish Vehicle"; //--- ToDo: Localize;
			x = 0.380506 * safezoneW + safezoneX;
			y = 0.551 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Blackfish Vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnBlackfishVehicle.sqf"""
		};
		class GCFButton_Blackfish_Infantry: GCFButton
		{
			idc = 1627;
			text = "Blackfish Infantry"; //--- ToDo: Localize;
			x = 0.380506 * safezoneW + safezoneX;
			y = 0.602 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Blackfish Infantry"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnBlackfishInfantry.sqf"""
		};
		class GCFButton_Blackfish_Armed: GCFButton
		{
			idc = 1628;
			text = "Blackfish Armed"; //--- ToDo: Localize;
			x = 0.380506 * safezoneW + safezoneX;
			y = 0.653 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Blackfish Armed"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnBlackfishArmed.sqf"""
		};
		class GCFButton_BlackWasp: GCFButton
		{
			idc = 1629;
			text = "Black Wasp"; //--- ToDo: Localize;
			x = 0.380506 * safezoneW + safezoneX;
			y = 0.704 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Black Wasp"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnBlackWasp.sqf"""
		};
		class GCFButton_BlackWasp_Stealth: GCFButton
		{
			idc = 1630;
			text = "Black Wasp Stealth"; //--- ToDo: Localize;
			x = 0.380506 * safezoneW + safezoneX;
			y = 0.755 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Black Wasp Stealth"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnBlackWaspStealth.sqf"""
		};
		class GCFButton_Sentinel: GCFButton
		{
			idc = 1631;
			text = "Sentinel"; //--- ToDo: Localize;
			x = 0.555764 * safezoneW + safezoneX;
			y = 0.704 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Sentinel"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnSentinel.sqf"""
		};
		class RscButton_1632: GCFButton
		{
			idc = 1632;
			text = "Cheetah"; //--- ToDo: Localize;
			x = 0.197282 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.119494 * safezoneW;
			h = 0.034 * safezoneH;
			tooltip = "Cheetah"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfAdminMenu\functions\spawnCheetah.sqf"""
		};
	};
};

/* /OPFOR
class OPFORSpawnMenu_dialog
{
	idd=-1;
	movingenable=true;
		
	class controls 
	{
		class adminMainMenuFrame: GCFFrame
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
		class adminMainMenuBox: BOX
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
	};
};

//INDEP
class INDEPSpawnMenu_dialog
{
	idd=-1;
	movingenable=true;
		
	class controls 
	{
		class adminMainMenuFrame: GCFFrame
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
		class adminMainMenuBox: BOX
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
	};
};

//CIV
class CIVpawnMenu_dialog
{
	idd=-1;
	movingenable=true;
		
	class controls 
	{
		class adminMainMenuFrame: GCFFrame
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
		class adminMainMenuBox: BOX
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.127417 * safezoneW;
			h = 0.42502 * safezoneH;
		};
	};
};
*/