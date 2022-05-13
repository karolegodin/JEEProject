package org.tutorial;

import java.util.ArrayList;
import java.util.List;

public class PlayerServiceImpl implements PlayerService {

	private PlayerDAO playerDao = new PlayerDAOMockImpl();
	
	public ArrayList<Player> getAllPlayers() {
		ArrayList<Player> listeJoueurs = null;
		listeJoueurs.add( new Player(1, "Mark", "Hamil",  false,  "UK",  69,  false, 10) );
		listeJoueurs.add( new Player(2, "Stephen", "Hawking",  false,  "UK",  72,  true, 42) );
		listeJoueurs.add( new Player(3, "Blackout", "DeathFlake",  true,  "FR",  24,  true, 1239) );
		return listeJoueurs;
	}
	
}
