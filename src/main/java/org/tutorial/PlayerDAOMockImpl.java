package org.tutorial;

import java.util.ArrayList;

public class PlayerDAOMockImpl implements PlayerDAO {

	//private List<Book> liste;

	@Override
	public ArrayList<Player> findByAll() {
		
		ArrayList<Player> listeJoueurs = new ArrayList<Player>();
		
		listeJoueurs.add( new Player(1, "Mark", "Hamil",  false,  "UK",  69,  false, 10) );
		listeJoueurs.add( new Player(2, "Stephen", "Hawking",  false,  "UK",  72,  true, 42) );
		listeJoueurs.add( new Player(3, "Blackout", "DeathFlake",  true,  "FR",  24,  true, 1239) );
		
		return listeJoueurs;
	}

}
