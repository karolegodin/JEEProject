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

@WebServlet("/editMatchs")
public class EditeurMatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditeurMatchServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher //
				= this.getServletContext()//
						.getRequestDispatcher("/views/editMatchs.jsp");

		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String http_method = request.getParameter("Http_method");
		if (http_method.equals("DELETE")) {

			String id = request.getParameter("id");
			Connection c = DBManager.getInstance().getConnection();

			String action = "DELETE FROM info_team03_schema.matches where id ='" + id + "';";
			try (PreparedStatement statement = c.prepareStatement(action)) {
				statement.execute();
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
			String id = request.getParameter("id");
			String J1 = request.getParameter("J1");
			String J2 = request.getParameter("J2");
			String date = request.getParameter("date");
			String heure = request.getParameter("heure");
			String categ = request.getParameter("Categ");
			String score = request.getParameter("Score");
			String court = request.getParameter("court");

			Connection c = DBManager.getInstance().getConnection();

			String action = "INSERT INTO info_team03_schema.matches VALUES ('" + id + "','" + J1 + "','" + J2 + "','"
					+ court + "','" + date + "','" + heure + "','" + " '' " + "','" + score + "','" + categ + "','"
					+ "'' " + "','" + "'' " + "' );";
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