package org.tutorial;

import java.util.ArrayList;
import java.util.Date;

public class PlayerDAOMockImpl implements PlayerDAO {

	//private List<Book> liste;

	@Override
	public ArrayList<Player> findByAll() {
		
		ArrayList<Player> listeJoueurs = new ArrayList<Player>();
		
		listeJoueurs.add( new Player("Mark", "Hamil",  "Droitier",  "UK",  69,  "Féminin", 10) );
		listeJoueurs.add( new Player("Stephen", "Hawking",  "Droitier",  "UK",  72,  "Masculin", 42) );
		listeJoueurs.add( new Player("Blackout", "DeathFlake",  "Gaucher",  "FR",  24,  "Féminin", 1239) );
		
		return listeJoueurs;
	}

	public ArrayList<Match> findAllMatches() {
		
		ArrayList<Match> listeMatchs = new ArrayList<Match>();
		
		Date dateMatch = new Date();
		
		listeMatchs.add( new Match(1, "Mark", "Hawking",  dateMatch, "/",  "15:30", 11, "/","A jouer") );
		listeMatchs.add( new Match(1, "Blackout", "Hawking",  dateMatch, "/",  "15:30", 11, "/", "En cours") );
		listeMatchs.add( new Match(1, "Hamil", "Blackout",  dateMatch, "/", "17:45",  11, "/", "En cours") );
		
		return listeMatchs;
	}
}
