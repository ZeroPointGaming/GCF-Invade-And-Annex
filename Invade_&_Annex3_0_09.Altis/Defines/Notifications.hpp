/*class Default
	{
		title = ""; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
*/
	class NewMain
	{
		title = "NEW MAIN OBJECTIVE";
		description = "Take %1";
		iconPicture = "media\notificons\main_objective.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9; 
	};

	class CompletedMain
	{
		title = "MAIN OBJECTIVE COMPLETED";
		description = "Taken %1";
		iconPicture = "media\notificons\main_objective_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9;
	};

	class SubAoTask
	{
		title = "NEW SIDE OBJECTVIE";
		description = "Destroy %1";
		iconPicture = "media\notificons\sub_objective.paa";
		color[] = { 1, 0.81, 0.06, 1 };
		priority = 9;
	};
	
	class TownAtkTask
	{
		title = "CSAT TOWN OCCUPATION";
		description = "%1 Has been captured by CSAT forces, go and clear them out!";
		iconPicture = "media\notificons\sub_objective.paa";
		color[] = { 1, 0.81, 0.06, 1 };
		priority = 9;
	};

	class CasNotification
	{
		title = "ENEMY RADIO BROADCAST";
		description = "Enemy Cas Inbound! Destroy the enemy %1";
		iconPicture = "media\notificons\enemyjetinbound.paa";
		color[] = { 1, 0.81, 0.06, 1 };
		priority = 9;
	};
	
	class CompletedSub
	{
		title = "SIDE OBJECTIVE COMPLETED";
		description = "Destroy %1";
		iconPicture = "media\notificons\sub_objective_completed.paa";
		color[] = { 1, 0.81, 0.06, 1 };
		priority = 9;
	};
	
	class NewSideMission
	{
		title = "SIDE MISSION ASSIGNED";
		description = "%1";
		iconPicture = "media\notificons\sub_objective.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9;
	};

	class NewMainDefend
	{
		title = "DEFEND OBJECTIVE";
		description = "Defend %1";
		iconPicture = "media\notificons\defendtarget.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9;
	};

	class CompletedMainDefended
	{
		title = "OBJECTIVE DEFENDED";
		description = "Defended %1";
		iconPicture = "media\notificons\main_objective_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9;
	};

	class FailedMainDefended
	{
		title = "OBJECTIVE LOST";
		description = "Lost Control of %1";
		iconPicture = "media\notificons\main_objective_completed.paa";
		color[] = {1, 0.81, 0.06, 1};
		priority = 9;
	};
	
	class secureInfantryTask
	{
		title = "ELIMINATE HOSTILES";
		description = "Mission Successful!";
		iconPicture = "media\notificons\sub_objective.paa";
		color[] = { 1, 0.81, 0.06, 1 };
		priority = 10;
	};
	
	class NewPriorityTarget
	{
		title = "NEW PRIORITY TARGET";
		iconPicture = "media\notificons\priority_target.paa";
		description = "%1";
		color[] = {0.8, 0.13, 0.14, 1};
		priority = 10;
	};

	class CompletedPriorityTarget
	{
		title = "PRIORITY TARGET DOWN";
		iconPicture = "media\notificons\priority_target_neutralised.paa";
		description = "%1";
		color[] = {0.8, 0.13, 0.14, 1};
		priority = 10;
	};

	class Reward
	{
		title = "TEAM REWARD";
		description = "%1";
		iconPicture = "media\notificons\reward.paa";
		color[] = {0.38, 0.81, 0.16, 1};
		priority = 6;
	};

	class ScoreBonus
	{
		title = "SCORE BONUS";
		description = "%1";
		iconPicture = "media\notificons\score_bonus.paa";
		iconText = "+%2";
		color[] = {0.38, 0.81, 0.16, 1};
		priority = 5;
	};

	class baseTaken
	{
		title = "NEW BASE CAPTURED";
		description = "%1";
		iconPicture = "media\notificons\main_objective.paa";
		iconText = "+%2";
		color[] = {0.38, 0.81, 0.16, 1};
		priority = 9;
	};

	class baseLost
	{
		title = "BASE LOST";
		description = "%1";
		iconPicture = "media\notificons\main_objective.paa";
		iconText = "+%2";
		color[] = {0.38, 0.81, 0.16, 1};
		priority = 9;
	};
