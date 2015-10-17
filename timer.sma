#include <amxmodx>
#include <amxmisc>

#define PLUGIN "Display timer for spectators and dead people only"
#define VERSION "1.0"
#define AUTHOR "Jaason"

public plugin_init() {
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_event("DeathMsg", "PlayerDies", "a");
	register_event("HLTV", "NewRound", "a", "1=0", "2=0")
}


public PlayerDies() {

	if( task_exists(652450) ) {
		remove_task(652450)
	}
	set_task(1.0,"timer",652450,_,_,"b")
	
}
public NewRound() {
	if( task_exists(652450) ) {
		remove_task(652450)
	}
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
		
			set_hudmessage(255, 0, 0, 0.025, 0.15, 0, 6.0, 1.0, 0.0, 0.0)
			ShowSyncHudMsg(0,CreateHudSyncObj(),"%s",Time)
			
		}
		
	}
}

