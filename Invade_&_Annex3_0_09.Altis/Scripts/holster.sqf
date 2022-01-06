if (vehicle player == player && currentWeapon player != "") then
		{
			curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
		}
		else
		{
			if (curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then
			{
				player selectWeapon curWep_h;
			};
		};