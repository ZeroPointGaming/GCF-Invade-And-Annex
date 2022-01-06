class SA
{
	class AdvancedSlingLoading
	{
		file = "Functions\Sling";
		class advancedSlingLoadingInit{postInit=1;};
	};
};
	
class AW
{
	tag = "AW";
	class functions
	{
		file = "functions";
	};

	class vehicleFunctions
	{
		file = "functions\Vehicle";
		class vsetup02 {};
		class vmonitor {};
		class vBasemonitor {};
		class baseHunter {};
		class SMhintSUCCESS {};
        class createCrew {};
	};

	class unitFunctions
	{
		file = "functions\Units";
		class setskill1 {};
		class setskill2 {};
		class setskill3 {};
		class setskill4 {};
        class buildingDefenders {};
        class underwaterBuildingDefenders {};
        class cqbPlacement {};
		class underwaterTangos {};
		class ai_spawn {};
		class smenemyeast {};
		class smenemyeastintel {};
		class airCav {};
		class factionDefine {};
        class sideMissionEnemy {};
	};

	class locationFunctions
	{
		file = "functions\Location";
		class findWaterLocation {};
		class getAo {};
		class getDefAO {};
		class getDefFrom {};
		class getEnemyAO {};
		class getTowns {};
	};

	class messageFunctions
	{
		file = "functions\Messages";
		class globalHint {};
		class globalnotification {};
		class killMessage {};
	};

	class cleanupFunctions
	{
		file = "functions\Cleanup";
		class smdelete {};
		class aodelete {};
	};

	class baseFunctions
	{
		file = "functions\Base";
		class BaseManager {};
        class baseTeleport {};
	};

	class miscFunctions
	{
		file = "functions\Misc";
		class aoenemy {};
		class aaCampPlacement {};
		class objGrabber {};
		class sideMissionCamp {};
		class addScore {};
		class addaction {};
		class addactiongetintel {};
		class addactionsurrender {};
		class taskPatrol {};
        class smSucSwitch {};
        class billBoardTex {};
	};
};

class derp
{
	tag = "derp";
	class arsenalFunctions
	{
		file = "functions\Arsenal";
		class findItemList {};
		class gearLimitations {};
		class VA_filter {};
	};

    class CBA {
        file = "functions\portedFuncs\cba";
        class pfhPreInit { preInit = 1; };
        class addPerFrameHandler {};
        class removePerFrameHandler {};
        class execNextFrame {};
        class waitAndExecute {};
        class waitUntilAndExecute {};
        class pfhPostInit { postInit = 1; };
        class getTurret {};
        class directCall {};
    };

	class AI {
        file = "functions\AI";
        class mainAOSpawnHandler {};
		class infantryAOSpawnHandler {};
        class AISkill {};
        class AIOccupyBuilding {};
		class arrayShuffle {};
    };

	class Revive {
        file = "functions\revive";
        class syncAnim {};
    };
};

class derp_revive {

    class Revive {
        file = "functions\revive";
        class onPlayerKilled {};
        class onPlayerRespawn {};
        class executeTemplates {};
        class switchState {};
        class reviveTimer {};
        class reviveActions {};
        class startDragging {};
        class startCarrying {};
        class dragging {};
        class carrying {};
        class dropPerson {};
        class hotkeyHandler {};
        class uiElements {};
        class animChanged {};
        class drawDowned {};
        class handleDamage {};
        class ace3Check {};
        class diaryEntries {};
        class adjustForTerrain {};
        class syncAnim {};
        class heartBeatPFH {};
    };
};

class CHVD
{
	tag = "CHVD";
	class functions
	{
		file = "functions\CHVD";
		class onCheckedChanged {};
		class onSliderChange {};
		class onLBSelChanged {};
		class onEBinput {};
		class onEBterrainInput {};
		class selTerrainQuality {};
		class updateTerrain {};
		class updateSettings {};		
		class openDialog {};
		class init {postInit = 1;};
	};
};