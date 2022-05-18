package config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {

	public static final String ROLE_EDITEUR_MATCH = "EDIT_MATCH";
	public static final String ROLE_EDITEUR_JOUEUR = "EDIT_JOUEUR";
	public static final String ROLE_ADMIN = "ADMIN";
	public static final String ROLE_VISITEUR = "VISITEUR";
	// String: Role
	// List<String>: urlPatterns.
	private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();

	static {
		init();
	}

	private static void init() {

		// Configurez pour le rôle "Editeur de Match".
		List<String> urlPatterns1 = new ArrayList<String>();

		urlPatterns1.add("/editMatch");

		mapConfig.put(ROLE_EDITEUR_MATCH, urlPatterns1);

		// Configurez pour le rôle "Editeur de Joueur".
		List<String> urlPatterns2 = new ArrayList<String>();

		urlPatterns2.add("/editJoueur");

		mapConfig.put(ROLE_EDITEUR_JOUEUR, urlPatterns2);

		// Configurez pour le rôle "Admin".
		List<String> urlPatterns3 = new ArrayList<String>();

		mapConfig.put(ROLE_ADMIN, urlPatterns3);

		// Configurez pour le rôle "Admin".
		List<String> urlPatterns4 = new ArrayList<String>();

		mapConfig.put(ROLE_VISITEUR, urlPatterns4);
	}

	public static Set<String> getAllAppRoles() {
		return mapConfig.keySet();
	}

	public static List<String> getUrlPatternsForRole(String role) {
		return mapConfig.get(role);
	}

}