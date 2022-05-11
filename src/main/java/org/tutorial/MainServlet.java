package org.tutorial;
import org.tutorial.*;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet ("/index")
public class MainServlet extends HttpServlet {
	
	private void doProcess (HttpServletRequest request, HttpServletResponse response) {
        String pageName="/index.jsp";
        String pageToGo="/listeJoueurs.jsp";
        
        PlayerService playerService = new PlayerServiceImpl();
        java.util.ArrayList<Player> listePlayer = playerService.getAllPlayers();
        System.out.println("Liste des joueurs : création dans le servlet :");
        System.out.println(listePlayer);
        
        request.setAttribute("listeJoueurs", listePlayer);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher(pageToGo);
        try {
              rd.forward(request, response);
        } catch (ServletException e) {
              e.printStackTrace();
        } catch (IOException e) {
              e.printStackTrace();
        }
        
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
        //resp.setContentType("text/html");

        //PrintWriter out = resp.getWriter();

        //out.println("Hello World !");
        
        //resp.sendRedirect(req.getContextPath() + "/index.jsp");
        
        //aller sur la page localhost:8080/JEEProject/

  }
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
}
