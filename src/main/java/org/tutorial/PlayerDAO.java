package org.tutorial;

import java.util.ArrayList;

public interface PlayerDAO {
	ArrayList<Player> findByAll();
	ArrayList<Match> findAllMatches();
}
