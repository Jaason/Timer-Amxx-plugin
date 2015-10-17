#include <amxmodx>
#include <amxmisc>

#define PLUGIN "Display timer for spectators and dead people only"
#define VERSION "1.1"
#define AUTHOR "Jaason"

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_event("DeathMsg", "initTask", "b"); // on player death
	register_event("HLTV", "initTask", "a", "1=0", "2=0"); //on new round
}


public initTask() {
	if( task_exists(652450) ) {
		remove_task(652450);
	}
	set_task(1.0,"timer",652450,_,_,"b");
}

public timer()
{	
	new plist[32], playernum, player;
	new Time[9]
	get_time("%H:%M:%S",Time,8)
	get_players(plist, playernum, "c");
	
	for(new i = 0; i < playernum; i++) {
		player = plist[i];
            
		if( !is_user_alive( player ) || get_user_team( player ) == 3 ) {

			set_hudmessage(255, 105, 180, 0.025, 0.15, 0, 6.0, 1.0, 0.0, 0.0)
			ShowSyncHudMsg(player,CreateHudSyncObj(),"%s",Time)
			
		}
		
	}
}

