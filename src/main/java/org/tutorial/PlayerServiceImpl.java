package org.tutorial;

import java.util.ArrayList;
import java.util.List;

public class PlayerServiceImpl implements PlayerService {

	private PlayerDAO playerDao = new PlayerDAOMockImpl();
	
	public ArrayList<Player> getAllPlayers() {
		return (ArrayList<Player>) playerDao.findByAll();
	}
	
}
