
class ARTYCPU_dialog
{
	idd=-1;
	movingenable=true;
	
	class controls 
	{
		class artycpuframe: GCFFrame
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.199088 * safezoneW;
			h = 0.374017 * safezoneH;
		};
		class artycpubox1: BOX
		{
			idc = 1800;
			x = 0.189422 * safezoneW + safezoneX;
			y = 0.0919813 * safezoneH + safezoneY;
			w = 0.199088 * safezoneW;
			h = 0.374017 * safezoneH;

		};
		class btn01: GCFButton
		{
			idc = 1600;
			text = "80mm HE Mortar Barrage"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.108982 * safezoneH + safezoneY;
			w = 0.183161 * safezoneW;
			h = 0.0340016 * safezoneH;
			tooltip = "4 80 mm HE Mortar Rounds"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfArtyComputer\functions\80mmhe.sqf""";
		};
		class btn02: GCFButton
		{
			idc = 1601;
			text = "155mm HE Howitzer Barrage"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.159984 * safezoneH + safezoneY;
			w = 0.183161 * safezoneW;
			h = 0.0340016 * safezoneH;
			tooltip = "3 155mm Howitzer Shells"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfArtyComputer\functions\155mmhe.sqf""";
		};
		class btn03: GCFButton
		{
			idc = 1602;
			text = "230mm HE Rocket Barrage"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.183161 * safezoneW;
			h = 0.0340016 * safezoneH;
			tooltip = "1 230 mm  Cluster Rocket Barrage"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfArtyComputer\functions\230mmhe.sqf""";
		};
		class btn04: GCFButton
		{
			idc = 1603;
			text = "125mm HE Barrage"; //--- ToDo: Localize;
			x = 1 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			tooltip = "3 125mm HE Mortar Rounds"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfArtyComputer\functions\125mmheshells.sqf""";
		};
		class btn05: GCFButton
		{
			idc = 1604;
			text = "120mm HE Barrage"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.312991 * safezoneH + safezoneY;
			w = 0.183161 * safezoneW;
			h = 0.0340016 * safezoneH;
			tooltip = "4 125mm HE Shells"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfArtyComputer\functions\120mmhe.sqf""";
		};
		class btn06: GCFButton
		{
			idc = 1605;
			text = "80mm Rocket Barrage"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.183161 * safezoneW;
			h = 0.0340016 * safezoneH;
			tooltip = "4 80mm HE Rockets"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfArtyComputer\functions\80mmrkt.sqf""";
		};
		class btn07: GCFButton
		{
			idc = 1606;
			text = "Cancle Strike"; //--- ToDo: Localize;
			x = 0.197386 * safezoneW + safezoneX;
			y = 0.414996 * safezoneH + safezoneY;
			w = 0.183161 * safezoneW;
			h = 0.0340016 * safezoneH;
			tooltip = "Cancle arty strike"; //--- ToDo: Localize;
			action = "closeDialog 0;_nil=[]ExecVM ""gcfArtyComputer\functions\cancel.sqf""";
		};
	};
};