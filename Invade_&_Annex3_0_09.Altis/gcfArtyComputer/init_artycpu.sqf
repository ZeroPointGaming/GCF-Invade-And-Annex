_handle=createdialog "ARTYCPU_dialog";
Cooldown = 1;
sleep 3;
hint "Artillery unavailable for 5 minutes while reloading!";
sleep 300; //5 minute cooldown
Cooldown = 0;
hint "Artillery is now available!";