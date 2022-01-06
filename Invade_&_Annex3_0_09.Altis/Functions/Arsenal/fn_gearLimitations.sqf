#include "arsenalDefines.hpp"

params ["_unit", ["_mode", 0], ["_item", objNull], ["_container", objNull]];

private _unitClass = typeof _unit;

//Define items that will be fully removed from the arsenals when the server starts
private _ArsenalItemFilter = [
    //Weapons
	"srifle_DMR_01_SOS_F",
    "srifle_EBR_SOS_F",
    "srifle_GM6_SOS_F",
    "srifle_GM6_LRPS_F",
    "srifle_LRR_SOS_F",
    "srifle_LRR_LRPS_F",
    "arifle_Katiba_GL_Nstalker_pointer_F",
    "arifle_MXC_SOS_point_snds_F",
    "arifle_MXM_SOS_pointer_F",
    "srifle_GM6_camo_SOS_F",
    "srifle_GM6_camo_LRPS_F",
    "srifle_LRR_camo_SOS_F",
    "srifle_LRR_camo_LRPS_F",
    "srifle_DMR_02_SOS_F",
    "srifle_DMR_03_SOS_F",
    "srifle_DMR_04_SOS_F",
    "srifle_DMR_04_NS_LP_F",
    "srifle_DMR_05_SOS_F",
	"srifle_DMR_07_blk_F",
	"srifle_DMR_07_hex_F",
	"srifle_DMR_07_ghex_F",
	"MMG_01_hex_F",
	"MMG_01_tan_F",
	"MMG_02_camo_F",
	"MMG_02_black_F",
	
	//Magazines
	"10Rnd_50BW_Mag_F",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",
	"B_IR_Grenade",
	"O_IR_Grenade",
	"I_IR_Grenade",
	"5Rnd_127x108_APDS_Mag",
	"10Rnd_127x54_Mag",
	"7Rnd_408_Mag",
	
	//Optics
	"optic_tws",
	"optic_tws_mg",
	"optic_Nightstalker",
	"optic_LRPS",
	"optic_SOS",
	"optic_KHS_blk",
	"optic_KHS_hex",
	"optic_KHS_old",
	"optic_KHS_tan",
	"optic_SOS_khk_F",
	"optic_LRPS_tna_F",
	"optic_LRPS_ghex_F",
	"optic_AMS",
	"optic_AMS_khk",
	"optic_AMS_snd",
	
	//Items
	"O_UavTerminal",
	"I_UavTerminal",
	"O_NVGoggles_ghex_F",
	"O_NVGoggles_hex_F",
	"O_NVGoggles_urb_F",
	"NVGogglesB_blk_F",
	"NVGogglesB_grn_F",
	"NVGogglesB_gry_F",
	
	//Uniforms
	"U_I_C_Soldier_Bandit_1_F",
	"U_I_C_Soldier_Bandit_2_F",
	"U_I_C_Soldier_Bandit_3_F",
	"U_I_C_Soldier_Bandit_4_F",
	"U_I_C_Soldier_Bandit_5_F",
	"U_O_CombatUniform_ocamo",
    "U_O_CombatUniform_oucamo",
    "U_O_OfficerUniform_ocamo",
    "U_O_SpecopsUniform_ocamo",
    "U_O_T_Soldier_F",
    "U_B_GEN_Commander_F",
    "U_B_GEN_Soldier_F",
    "U_O_T_Officer_F",
    "U_O_V_Soldier_Viper_F",
    "U_O_V_Soldier_Viper_hex_F",
    "U_I_C_Soldier_Camo_F",
    "U_I_CombatUniform",
    "U_I_CombatUniform_shortsleeve",
    "U_I_OfficerUniform",
    "U_O_PilotCoveralls",
    "U_I_pilotCoveralls",
    "U_I_HeliPilotCoveralls",
    "U_I_FullGhillie_sard",
    "U_O_FullGhillie_sard",
    "U_I_FullGhillie_ard",
    "U_O_FullGhillie_ard",
    "U_I_FullGhillie_lsh",
    "U_O_FullGhillie_lsh",
    "U_I_GhillieSuit",
    "U_O_GhillieSuit",
    "U_O_T_FullGhillie_tna_F",
	"U_B_FullGhillie_ard",
	"U_B_T_FullGhillie_tna_F",
	"U_B_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_B_T_Sniper_F",
	"U_B_GhillieSuit",
    "U_O_T_Sniper_F",
    "U_O_Wetsuit",
    "U_I_Wetsuit",
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_redwhite",
    "U_C_Man_casual_2_F",
    "U_C_Man_casual_3_F",
    "U_C_Man_casual_1_F",
    "U_C_man_sport_1_F",
    "U_C_man_sport_3_F",
    "U_C_man_sport_2_F",
    "U_C_Man_casual_6_F",
    "U_C_Man_casual_4_F",
    "U_C_Man_casual_5_F",
    "U_C_Driver_1_black",
    "U_C_Driver_1_blue",
    "U_C_Driver_2",
    "U_C_Driver_1",
    "U_C_Driver_1_green",
    "U_C_Driver_1_orange",
    "U_C_Driver_1_red",
    "U_C_Driver_3",
    "U_C_Driver_4",
    "U_C_Driver_1_white",
    "U_C_Driver_1_yellow",
    "U_C_HunterBody_grn",
    "U_OrestesBody",
    "U_C_Journalist",
    "U_Marshal",
    "U_C_Scientist",
    "U_C_WorkerCoveralls",
    "U_C_Poor_1",
    "U_Competitor",
    "U_Rangemaster",
    "U_B_Protagonist_VR",
    "U_O_Protagonist_VR",
    "U_I_Protagonist_VR",
	
	//Helmets
	"H_HelmetSpecO_blk",
    "H_HelmetO_ocamo",
    "H_HelmetO_oucamo",
    "H_HelmetSpecO_ocamo",
    "H_HelmetLeaderO_ocamo",
    "H_HelmetLeaderO_oucamo",
    "H_HelmetIA",
    "H_PilotHelmetFighter_O",
    "H_PilotHelmetFighter_I",
    "H_PilotHelmetHeli_O",
    "H_PilotHelmetHeli_I",
    "H_CrewHelmetHeli_O",
    "H_CrewHelmetHeli_I",
    "H_HelmetCrew_I",
    "H_HelmetCrew_O",
    "H_RacingHelmet_1_F",
    "H_RacingHelmet_2_F",
    "H_RacingHelmet_3_F",
    "H_RacingHelmet_4_F",
    "H_RacingHelmet_1_black_F",
    "H_RacingHelmet_1_blue_F",
    "H_RacingHelmet_1_green_F",
    "H_RacingHelmet_1_red_F",
    "H_RacingHelmet_1_white_F",
    "H_RacingHelmet_1_yellow_F",
    "H_RacingHelmet_1_orange_F",
    "H_Cap_marshal",
    "H_StrawHat",
    "H_StrawHat_dark",
    "H_Hat_blue",
    "H_Hat_brown",
    "H_Hat_camo",
    "H_Hat_grey",
    "H_Hat_checker",
    "H_Hat_tan",
    "H_Helmet_Skate",
    "H_MilCap_ocamo",
    "H_MilCap_dgtl",
    "H_HelmetSpecO_ghex_F",
    "H_Booniehat_dgtl",
    "H_Cap_blk_Raven",
    "H_Cap_brn_SPECOPS",
    "H_HelmetCrew_O_ghex_F",
    "H_HelmetLeaderO_ghex_F",
    "H_MilCap_ghex_F",
    "H_HelmetO_ghex_F",
    "H_HelmetO_ViperSP_ghex_F",
    "H_HelmetO_ViperSP_hex_F",
	
	//Backpacks
	"O_Mortar_01_weapon_F",
    "O_Mortar_01_support_F",
    "I_Mortar_01_weapon_F",
    "I_Mortar_01_support_F",
    "B_GMG_01_A_weapon_F",
    "B_GMG_01_high_F",
    "B_GMG_01_high_weapon_F",
    "B_GMG_01_weapon_F",
    "O_GMG_01_A_weapon_F",
    "O_GMG_01_high_F",
    "O_GMG_01_high_weapon_F",
    "O_GMG_01_weapon_F",
    "I_GMG_01_A_weapon_F",
    "I_GMG_01_high_F",
    "I_GMG_01_high_weapon_F",
    "I_GMG_01_weapon_F",
    "B_HMG_01_A_weapon_F",
    "B_HMG_01_high_weapon_F",
    "B_HMG_01_support_F",
    "B_HMG_01_support_high_F",
    "B_HMG_01_weapon_F",
    "O_HMG_01_A_weapon_F",
    "O_HMG_01_high_weapon_F",
    "O_HMG_01_support_F",
    "O_HMG_01_support_high_F",
    "O_HMG_01_weapon_F",
    "I_HMG_01_A_weapon_F",
    "I_HMG_01_high_weapon_F",
    "I_HMG_01_support_F",
    "I_HMG_01_support_high_F",
    "I_HMG_01_weapon_F",
    "B_AA_01_weapon_F",
    "O_AA_01_weapon_F",
    "I_AA_01_weapon_F",
    "B_AT_01_weapon_F",
    "O_AT_01_weapon_F",
    "I_AT_01_weapon_F",
    "B_Respawn_Sleeping_bag_blue_F",
    "B_Respawn_Sleeping_bag_brown_F",
    "B_Respawn_Sleeping_bag_F",
    "B_Respawn_TentA_F",
    "B_Respawn_TentDome_F",
    "O_Static_Designator_02_weapon_F",
    "B_AssaultPack_dgtl",
    "B_AssaultPack_ocamo",
    "B_Carryall_ocamo",
    "B_Carryall_oucamo",
    "B_FieldPack_ocamo",
    "B_FieldPack_oucamo",
    "B_TacticalPack_ocamo",
    "I_UAV_01_backpack_F",
    "O_UAV_01_backpack_F",
    "B_Carryall_ghex_F",
    "B_FieldPack_ghex_F",
    "B_ViperHarness_ghex_F",
    "B_ViperHarness_hex_F",
    "B_ViperLightHarness_ghex_F",
    "B_ViperLightHarness_hex_F",
	"B_Bergen_mcamo_F",
	"B_Bergen_dgtl_F",
	"B_Bergen_hex_F",
	"B_Bergen_tna_F",
	
	//Goggles
	"G_Goggles_VR",
    "G_Lady_Blue",
    "G_Spectacles",
    "G_Spectacles_Tinted",
    "G_I_Diving",
    "G_O_Diving",
	
	//Vests
	 "V_Press_F",
    "V_HarnessO_brn",
    "V_HarnessOGL_brn",
    "V_HarnessO_gry",
    "V_HarnessOGL_gry",
    "V_HarnessOSpec_brn",
    "V_HarnessOSpec_gry",
    "V_RebreatherIR",
    "V_RebreatherIA",
    "V_PlateCarrierIA1_dgtl",
    "V_PlateCarrierIA2_dgtl",
    "V_TacVest_gen_F",
    "V_HarnessOGL_ghex_F",
    "V_HarnessO_ghex_F",
    "V_BandollierB_ghex_F",
	"v_i_g_resistanceLeader_f"
];

private _ArsenalOptics = [	
	//Optics
	"optic_tws",
	"optic_tws_mg",
	"optic_Nightstalker",
	"optic_LRPS",
	"optic_SOS",
	"optic_KHS_blk",
	"optic_KHS_hex",
	"optic_KHS_old",
	"optic_KHS_tan",
	"optic_SOS_khk_F",
	"optic_LRPS_tna_F",
	"optic_LRPS_ghex_F",
	"optic_AMS",
	"optic_AMS_khk",
	"optic_AMS_snd",
];

private _ArsenalMagazines = [	
	//Magazines
	"10Rnd_50BW_Mag_F",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",
	"B_IR_Grenade",
	"O_IR_Grenade",
	"I_IR_Grenade",
	"5Rnd_127x108_APDS_Mag",
	"10Rnd_127x54_Mag",
	"7Rnd_408_Mag",
];

private _restrictedItems = [];
_restrictedItems pushBack GearLimitationMarksman;
_restrictedItems pushBack GearLimitationAT;
_restrictedItems pushBack GearLimitationMMG;
_restrictedItems pushBack GearLimitationUAVOperator;
_restrictedItems pushBack GearLimitationGrenadier;
_restrictedItems pushBack GearLimitationEngineer;
_restrictedItems pushBack GearLimitationMedic;
_restrictedItems pushBack [{_unit getUnitTrait 'gud'}, (_ArsenalRestrictedItems + _ArsenalMagazines + _ArsenalOptics), "Restricted Items"];

private _assignedItems = assignedItems _unit;
private _weapons = [];
_weapons pushBack (primaryWeapon _unit);
_weapons pushBack (secondaryWeapon _unit);
{_weapons pushBack _x} foreach (primaryWeaponItems _unit);

private _items = [];
_items = (_items + (uniformItems _unit) + (vestItems _unit) + (backpackItems _unit) + _assignedItems + _weapons + [uniform _unit] + [vest _unit] + [backpack _unit] + [headgear _unit]);
{_items pushBack _x} foreach _primaryWeaponItems;

_ITEM_MACRO_assignedItem = {
    params ["_unit", "_item", "_testedClass", "_container"];
    _unit unlinkItem _item;
    systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];

    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

//Wrote a fix to determin whether the item is restricted or blacklisted and display a correct chat message
_ITEM_MACRO_weapon = {
    params ["_unit", "_item", "_testedClass", "_container"];
    _unit removeWeapon _item;
	
	if (_item in _ArsenalRestrictedItems) then {		
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	};
	
	if !(_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];
	};

    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

//Wrote a fix to determin whether the item is restricted or blacklisted and display a correct chat message
_ITEM_MACRO_weaponItem = {
    params ["_unit", "_item", "_testedClass", "_container"];
    _unit removePrimaryWeaponItem _item;
	
	if (_item in _ArsenalOptics) then {
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	};
	
	if !(_item in _ArsenalOptics) then {
		systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];
	};
	
    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

//Needs to be converted to a config array to search all 3 item locations to return the correct names
_ITEM_MACRO_item = {
    params ["_unit", "_item", "_testedClass", "_container"];
    _unit removeItem _item;
   
    //Fix for CfgMagazines
	if (_item in _ArsenalMagazines) then {
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgMagazines" >> _item >> "displayName")];
	};
	
	if (_item in _ArsenalRestrictedItems) then {		
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	};
	
	if !(_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];
	};
	
	//systemChat format ["%1 was removed.", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];

    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

//Wrote a fix to determin whether the item is restricted or blacklisted and display a correct chat message
_ITEM_MACRO_helmet = {
    params ["_unit", "_item", "_testedClass", "_container"];
    removeHeadgear _unit;
	
    if (_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	};
	
	if !(_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];
	};
	
    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

//Wrote a fix to determin whether the item is restricted or blacklisted and display a correct chat message
_ITEM_MACRO_backpack = {
    params ["_unit", "_item", "_testedClass", "_container"];
    removeBackpack _unit;
    
	if (_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	};
	
	if !(_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];
	};
	
    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

//Wrote a fix to determin whether the item is restricted or blacklisted and display a correct chat message
_ITEM_MACRO_uniform = {
    params ["_unit", "_item", "_testedClass", "_container"];
    removeUniform _unit;
    
	if (_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	};
	
	if !(_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];
	};
	
    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

_ITEM_MACRO_vest = {
    params ["_unit", "_item", "_testedClass", "_container"];
    removeVest _unit;
    
	if (_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, This item is restricted!!", getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
	};
	
	if !(_item in _ArsenalRestrictedItems) then {
		systemChat format ["%1 was removed, switch to %2 to use it.", getText (configFile >> "CfgWeapons" >> _item >> "displayName"), _testedClass];
	};
	
    if (_mode == 1) then {
        _container addItemCargoGlobal [_item, 1];
    };
};

{
    _x params ["_classCode", "_testedArray", "_testedClass"];

    if !(call _classCode) then {
        {
            if (_x in _testedArray) then {
                if (_x in _assignedItems) then {
                    [_unit, _x, _testedClass, _container] call _ITEM_MACRO_assignedItem;
                } else {
                    if (_x in _weapons) then {

                            if (_x == (primaryWeapon _unit) || {_x == (secondaryWeapon _unit)}) then {
                                [_unit, _x, _testedClass, _container] call _ITEM_MACRO_weapon;
                            } else {
                                if (_x in (primaryWeaponItems _unit)) then {
                                    [_unit, _x, _testedClass, _container] call _ITEM_MACRO_weaponItem;
                                };
                            };

                    } else {
                        if (_x == headgear _unit) then {
                            [_unit, _x, _testedClass, _container] call _ITEM_MACRO_helmet;
                        } else {
                            if (_x == backpack _unit) then {
                                [_unit, _x, _testedClass, _container] call _ITEM_MACRO_backpack;
                            } else {
                                if (_x == uniform _unit) then {
                                    [_unit, _x, _testedClass, _container] call _ITEM_MACRO_uniform;
                                } else {
                                    if (_x == vest _unit) then {
                                        [_unit, _x, _testedClass, _container] call _ITEM_MACRO_vest;
                                    } else {
                                        [_unit, _x, _testedClass, _container] call _ITEM_MACRO_item;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        } foreach _items;
    };
} foreach _restrictedItems;
