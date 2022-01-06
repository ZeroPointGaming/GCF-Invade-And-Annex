//  ZeusPlayerUpdate Loop     //
//scripts\misc\zeusupdater.sqf//
//      MykeyRM [AW]          //
////////////////////////////////

//zeusupdater.sqf

waitUntil {time > 3};
call {while {true} do {objectsToAdd = (entities "AllVehicles" - entities "Animal" - entities "RoadCone_L_F" - [Quartermaster,Quartermaster_1,Quartermaster_2,Quartermaster_3,Quartermaster_4,Quartermaster_5,artyMLRS,artySorcher]); publicVariable "objectsToAdd";{_x addCuratorEditableObjects [(objectsToAdd), true]; } foreach allCurators; sleep 180;};};

systemChat = "Zeus update system loaded!";