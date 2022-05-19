package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.tutorial.DBManager;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editJoueur")
public class EditeurJoueurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditeurJoueurServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher //
				= this.getServletContext()//
						.getRequestDispatcher("/views/editJoueur.jsp");

		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String http_method = request.getParameter("Http_method");
		if (http_method.equals("DELETE")) {

			String prenom = request.getParameter("Prenom_id");
			String nom = request.getParameter("Nom_id");
			System.out.println("prenom :" + prenom);
			System.out.println("nom :" + nom);
			Connection c = DBManager.getInstance().getConnection();

			String action = "DELETE FROM info_team03_schema.joueurs where joueurs.prénom = ? and joueurs.nom = ?;";
			try (PreparedStatement statement = c.prepareStatement(action)) {
				statement.setString(1, prenom);
				statement.setString(2, nom);
				statement.executeUpdate();
			} catch (SQLException e) {
			} finally {
				if (c != null) {
					try {
						c.close();
					} catch (SQLException e) {
					}
				}
			}
		}
		if (http_method.equals("POST")) {
			String prenom_id = request.getParameter("Prenom_id");
			String nom_id = request.getParameter("Nom_id");
			String prenom = request.getParameter("Prenom");
			String nom = request.getParameter("Nom");
			String pays = request.getParameter("Pays");
			String age = request.getParameter("Age");
			String categ = request.getParameter("Categ");
			String main = request.getParameter("Main");
			String classement = request.getParameter("Classement");

			Connection c = DBManager.getInstance().getConnection();

			String action = "update info_team03_schema.joueurs set prénom ='" + prenom + "', nom = '" + nom
					+ "', pays = '" + pays + "', catégorie = '" + categ + "', classementMondial = '" + classement
					+ "', main = '" + main + "', age = '" + age

					+ "' where prénom = '" + prenom_id + "' and nom = '" + nom_id + "';";
			try (PreparedStatement statement = c.prepareStatement(action)) {

				statement.executeUpdate();
			} catch (SQLException e) {
			} finally {
				if (c != null) {
					try {
						c.close();
					} catch (SQLException e) {
					}
				}
			}
		}
		if (http_method.equals("NEW")) {
			String prenom = request.getParameter("Prenom");
			String nom = request.getParameter("Nom");
			String pays = request.getParameter("Pays");
			String age = request.getParameter("Age");
			String categ = request.getParameter("Categ");
			String main = request.getParameter("Main");
			String classement = request.getParameter("Classement");

			System.out.println(prenom + nom + pays + age + categ + main + classement);
			Connection c = DBManager.getInstance().getConnection();

			String action = "insert INTO info_team03_schema.joueurs VALUES ('" + prenom + "','" + nom + "','" + pays
					+ "','" + categ + "','" + classement + "','" + main + "','" + age + "');";
			try (PreparedStatement Stmt = c.prepareStatement(action)) {
				Stmt.execute();

			} catch (SQLException e) {
			} finally {
				if (c != null) {
					try {
						c.close();
					} catch (SQLException e) {
					}
				}
			}

		}

		doGet(request, response);
	}
}