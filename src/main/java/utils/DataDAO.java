package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tutorial.DBManager;

import bean.UserAccount;
import config.SecurityConfig;

public class DataDAO {

	// private static final Map<String, UserAccount> mapUsers = new HashMap<String,
	// UserAccount>();

	static {
		initUsers();
	}

	private static void initUsers() {

		/*
		 * This user has a role as EMPLOYEE. UserAccount emp = new
		 * UserAccount("employee1", "123", UserAccount.GENDER_MALE, //
		 * SecurityConfig.ROLE_EDITEUR_JOUEUR);
		 * 
		 * // This user has 2 roles EDITEUR JOUEUR and EDITEUR MATCH. UserAccount mng =
		 * new UserAccount("manager1", "123", UserAccount.GENDER_MALE, //
		 * SecurityConfig.ROLE_EDITEUR_JOUEUR, SecurityConfig.ROLE_EDITEUR_MATCH);
		 * 
		 * mapUsers.put(emp.getUserName(), emp); mapUsers.put(mng.getUserName(), mng);
		 * 
		 * PreparedStatement stmt = null; //try stmt = conn.
		 * prepareStatement("SELECT * FROM info_team03_schema.users WHERE users.nom = "
		 * + userName + " AND users.mdp = " + password + " ;"); stmt.setString(1,
		 * userName); stmt.setString(2, password);
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 */
	}

	// Find a User by userName and password.
	public static UserAccount findUser(String userName, String password) {
		Connection c = DBManager.getInstance().getConnection();
		UserAccount u = null;
		String action = "SELECT * FROM info_team03_schema.users WHERE users.nom = ? AND users.mdp = ?;";
		try (PreparedStatement statement = c.prepareStatement(action)) {
			statement.setString(1, userName);
			statement.setString(2, password);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				String nom = rs.getString("nom");
				String mdp = rs.getString("mdp");
				Integer privilege = Integer.parseInt(rs.getString("privilege"));
				switch (privilege) {
				case 0:
					u = new UserAccount(nom, mdp, SecurityConfig.ROLE_ADMIN, SecurityConfig.ROLE_EDITEUR_JOUEUR,
							SecurityConfig.ROLE_EDITEUR_MATCH);
					break;
				case 1:
					u = new UserAccount(nom, mdp, SecurityConfig.ROLE_EDITEUR_JOUEUR);
					break;
				case 2:
					u = new UserAccount(nom, mdp, SecurityConfig.ROLE_EDITEUR_MATCH);
					break;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (c != null) {
				try {
					c.close();
				} catch (SQLException e) {
				}
			}

		}
		if (u != null && u.getPassword().equals(password)) {
			return u;
		}
		return null;
	}
}
