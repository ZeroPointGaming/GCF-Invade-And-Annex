/*
    Author: Sgt Justin
	This file depicts the items that can be kept and those that will be removed after exiting the arsenal.
*/
#define ArsenalBoxes [Quartermaster,Quartermaster_1,Quartermaster_2,Quartermaster_3,Quartermaster_4,Quartermaster_5] // Vars of the arsenal boxes

//Gear limitations for unit classes
#define GearLimitationMarksman [{_unit getUnitTrait 'derp_marksman'}, [ \
	"optic_DMS", \
	"optic_DMS_ghex_F", \
	"srifle_DMR_01_F", \
	"srifle_DMR_01_ACO_F", \
	"srifle_DMR_01_MRCO_F", \
	"srifle_DMR_01_DMS_F", \
	"srifle_DMR_01_DMS_snds_F", \
	"srifle_DMR_01_ARCO_F", \
	"srifle_EBR_ACO_F", \
	"srifle_EBR_MRCO_pointer_F", \
	"srifle_EBR_ARCO_pointer_F", \
	"srifle_EBR_ARCO_pointer_snds_F", \
	"srifle_EBR_DMS_F", \
	"srifle_EBR_Hamr_pointer_F", \
	"srifle_EBR_DMS_pointer_snds_F", \
	"srifle_DMR_01_DMS_BI_F", \
	"srifle_DMR_01_DMS_snds_BI_F", \
	"srifle_EBR_MRCO_LP_BI_F", \
	"srifle_DMR_03_F", \
	"srifle_DMR_03_khaki_F", \
	"srifle_DMR_03_tan_F", \
	"srifle_DMR_03_multicam_F", \
	"srifle_DMR_03_woodland_F", \
	"srifle_DMR_03_spotter_F", \
	"srifle_DMR_03_ACO_F", \
	"srifle_DMR_03_MRCO_F", \
	"srifle_DMR_03_DMS_F", \
	"srifle_DMR_03_tan_AMS_LP_F", \
	"srifle_DMR_03_DMS_snds_F", \
	"srifle_DMR_03_ARCO_F", \
	"srifle_DMR_03_AMS_F", \
	"srifle_DMR_04_F", \
	"srifle_DMR_04_Tan_F", \
	"srifle_DMR_04_ACO_F", \
	"srifle_DMR_04_MRCO_F", \
	"srifle_DMR_04_DMS_F", \
	"srifle_DMR_04_ARCO_F",	\
	"srifle_DMR_04_NS_LP_F", \
	"srifle_DMR_06_camo_F", \
	"srifle_DMR_06_olive_F", \
	"srifle_DMR_06_camo_khs_F", \
	"srifle_DMR_02_F", \
	"srifle_DMR_02_camo_F", \
	"srifle_DMR_02_sniper_F", \
	"srifle_DMR_02_ACO_F", \
	"srifle_DMR_02_MRCO_F", \
	"srifle_DMR_02_DMS_F", \
	"srifle_DMR_02_sniper_AMS_LP_S_F", \
	"srifle_DMR_02_camo_AMS_LP_F", \
	"srifle_DMR_02_ARCO_F", \
	"srifle_DMR_05_blk_F", \
	"srifle_DMR_05_hex_F", \
	"srifle_DMR_05_tan_f", \
	"srifle_DMR_05_ACO_F", \
	"srifle_DMR_05_MRCO_F", \
	"srifle_DMR_05_DMS_F", \
	"srifle_DMR_05_DMS_snds_F", \
	"srifle_DMR_05_ARCO_F", \
	"srifle_DMR_07_blk_DMS_F", \
	"srifle_DMR_07_blk_DMS_Snds_F", \
	"srifle_DMR_07_blk_F", \
	"srifle_DMR_07_ghex_F", \
	"srifle_DMR_07_hex_F", \
	"arifle_MXM_Black_F", \
	"arifle_MXM_DMS_F", \
	"arifle_MXM_DMS_LP_BI_snds_F", \
	"arifle_MXM_F", \
	"arifle_MXM_Hamr_LP_BI_F", \
	"arifle_MXM_Hamr_pointer_F", \
	"arifle_MXM_khk_F", \
	"arifle_MXM_RCO_pointer_snds_F", \
	"arifle_SPAR_03_blk_F", \
	"arifle_SPAR_03_khk_F", \
	"arifle_SPAR_03_snd_F" \
], "Marksman"]

#define GearLimitationAT  [{_unit getUnitTrait 'derp_AT'}, [ \
    "launch_B_Titan_F", \
	"launch_I_Titan_F", \
	"launch_O_Titan_F", \
	"launch_B_Titan_short_F", \
	"launch_I_Titan_short_F", \
	"launch_O_Titan_short_F", \
	"launch_O_Titan_ghex_F", \
	"launch_B_Titan_tna_F", \
	"launch_O_Titan_short_ghex_F", \
	"launch_B_Titan_short_tna_F", \
	"launch_RPG7_F" \
], "AT specialist"]

#define GearLimitationMMG [{_unit getUnitTrait 'derp_machinegunner'}, [ \
    "MMG_01_hex_F", \
	"MMG_01_tan_F", \
	"MMG_01_hex_ARCO_LP_F", \
	"MMG_02_camo_F", \
	"MMG_02_black_F", \
	"MMG_02_sand_F", \
	"MMG_02_sand_RCO_LP_F", \
	"MMG_02_black_RCO_BI_F", \
	"LMG_Mk200_F", \
	"LMG_Mk200_BI_F", \
	"LMG_Mk200_LP_BI_F", \
	"LMG_Zafir_F", \
	"LMG_Zafir_pointer_F", \
	"LMG_Zafir_ARCO_F", \
	"LMG_03_F", \
	"arifle_MX_SW_Black_F", \
	"arifle_MX_SW_Black_Hamr_pointer_F", \
	"arifle_MX_SW_F", \
	"arifle_MX_SW_Hamr_pointer_F", \
	"arifle_MX_SW_khk_F", \
	"arifle_MX_SW_khk_Pointer_F", \
	"arifle_MX_SW_pointer_F", \
	"arifle_SPAR_02_blk_F", \
	"arifle_SPAR_02_blk_Pointer_F", \
	"arifle_SPAR_02_khk_F", \
	"arifle_SPAR_02_snd_F", \
	"arifle_CTARS_ghex_F", \
	"arifle_CTARS_hex_F", \
	"arifle_CTARS_blk_F", \
	"arifle_CTARS_blk_Pointer_F" \
], "Autorifleman"]

#define GearLimitationUAVOperator [{_unit getUnitTrait 'derp_uavOperator'}, [ \
	"B_UavTerminal" \
], "UAV operator"]

#define GearLimitationGrenadier [{_unit getUnitTrait 'derp_grenadier'}, [ \
    "arifle_Katiba_GL_F", \
	"arifle_Katiba_GL_ACO_F", \
	"arifle_Katiba_GL_ARCO_pointer_F", \
	"arifle_Katiba_GL_ACO_pointer_F", \
	"arifle_Katiba_GL_Nstalker_pointer_F", \
	"arifle_Katiba_GL_ACO_pointer_snds_F", \
	"arifle_Mk20_GL_F", \
	"arifle_Mk20_GL_plain_F", \
	"arifle_Mk20_GL_MRCO_pointer_F", \
	"arifle_Mk20_GL_ACO_F", \
	"arifle_MX_GL_F", \
	"arifle_MX_GL_ACO_F", \
	"arifle_MX_GL_ACO_pointer_F", \
	"arifle_MX_GL_Hamr_pointer_F", \
	"arifle_MX_GL_Holo_pointer_snds_F", \
	"arifle_MX_GL_Black_F", \
	"arifle_MX_GL_Black_Hamr_pointer_F", \
	"arifle_TRG21_GL_F", \
	"arifle_TRG21_GL_MRCO_F", \
	"arifle_TRG21_GL_ACO_pointer_F", \
	"arifle_AK12_GL_F", \
	"arifle_CTAR_GL_blk_ACO_F", \
	"arifle_CTAR_GL_blk_ACO_Pointer_Snds_F", \
	"arifle_CTAR_GL_blk_F", \
	"arifle_MX_GL_khk_ACO_F", \
	"arifle_MX_GL_khk_F", \
	"arifle_MX_GL_khk_Hamr_Pointer_F", \
	"arifle_MX_GL_khk_Holo_Pointer_Snds_F", \
	"arifle_SPAR_01_GL_blk_ACO_Pointer_F", \
	"arifle_SPAR_01_GL_blk_F", \
	"arifle_SPAR_01_GL_khk_F", \
	"arifle_SPAR_01_GL_snd_F", \
	"arifle_CTAR_GL_ghex_F", \
	"arifle_CTAR_GL_hex_F", \
	"V_PlateCarrierIAGL_dgtl", \
	"V_PlateCarrierIAGL_oli", \
	"1Rnd_HE_Grenade_shell", \
	"3Rnd_HE_Grenade_shell", \
	"1Rnd_Smoke_Grenade_shell", \
	"3Rnd_Smoke_Grenade_shell", \
	"1Rnd_SmokeRed_Grenade_shell", \
	"3Rnd_SmokeRed_Grenade_shell", \
	"1Rnd_SmokeGreen_Grenade_shell", \
	"3Rnd_SmokeGreen_Grenade_shell", \
	"1Rnd_SmokeYellow_Grenade_shell", \
	"3Rnd_SmokeYellow_Grenade_shell", \
	"1Rnd_SmokePurple_Grenade_shell", \
	"3Rnd_SmokePurple_Grenade_shell", \
	"1Rnd_SmokeBlue_Grenade_shell", \
	"3Rnd_SmokeBlue_Grenade_shell", \
	"1Rnd_SmokeOrange_Grenade_shell", \
	"3Rnd_SmokeOrange_Grenade_shell", \
	"UGL_FlareWhite_F", \
	"3Rnd_UGL_FlareWhite_F", \
	"UGL_FlareGreen_F", \
	"3Rnd_UGL_FlareGreen_F", \
	"UGL_FlareRed_F", \
	"3Rnd_UGL_FlareRed_F", \
	"UGL_FlareYellow_F", \
	"3Rnd_UGL_FlareYellow_F", \
	"UGL_FlareCIR_F", \
	"3Rnd_UGL_FlareCIR_F", \
	"FlareWhite_F", \
	"FlareGreen_F", \
	"FlareRed_F", \
	"FlareYellow_F", \
	"launch_RPG7_F" \
], "Grenadier"]

#define GearLimitationEngineer [{_unit getUnitTrait 'derp_engineer'}, [ \
	"ToolKit", \
	"MineDetector" \
], "Engineer"]

#define GearLimitationMedic [{_unit getUnitTrait 'derp_medic'}, [ \
	"Medikit" \
], "Medic"]

#define GearLimitationMedic [{_unit getUnitTrait 'derp_pilot'}, [ \
	"U_B_HeliPilotCoveralls", \
	"U_B_PilotCoveralls", \
	"V_DeckCrew_blue_F", \
	"V_DeckCrew_brown_F", \
	"V_DeckCrew_green_F", \
	"V_DeckCrew_red_F", \
	"V_DeckCrew_violet_F", \
	"V_DeckCrew_white_F", \
	"V_DeckCrew_yellow_F", \
	"H_CrewHelmetHeli_B", \
	"H_PilotHelmetHeli_B", \
	"H_PilotHelmetFighter_B" \
], "Pilot"]