package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.tutorial.DBManager;

import bean.UserAccount;
import config.SecurityConfig;

public class DataDAO {

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
				default:
					u = new UserAccount(nom, mdp, SecurityConfig.ROLE_VISITEUR);
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
