package filter;

import java.io.IOException;
import java.util.List;

import bean.UserAccount;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import request.UserRoleRequestWrapper;
import utils.AppUtils;
import utils.SecurityUtils;

@WebFilter("/*")
public class SecurityFilter implements Filter {

	public SecurityFilter() {
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		String servletPath = request.getServletPath();

		// L'information d'utilisateur est stockée dans Session
		// (Après l'achèvement de connexion).
		UserAccount loginedUser = AppUtils.getLoginedUser(request.getSession());

		if (servletPath.equals("/login")) {
			chain.doFilter(request, response);
			return;
		}
		HttpServletRequest wrapRequest = request;

		if (loginedUser != null) {
			// User Name
			String userName = loginedUser.getUserName();

			// Des rôles (Role).
			List<String> roles = loginedUser.getRoles();

			// Envelopper l'ancienne demande (request) par une nouvelle demande avec les
			// informations userName et Roles.
			wrapRequest = new UserRoleRequestWrapper(userName, roles, request);
		}

		// Les pages doivent être connectées.
		if (SecurityUtils.isSecurityPage(request)) {

			// Si l'utilisateur n'est pas connecté,
			// Redirect (redirigez) vers la page de connexion
			if (loginedUser == null) {

				String requestUri = request.getRequestURI();

				// Stockez la page en cours à rediriger après l'achèvement de la connexion.
				int redirectId = AppUtils.storeRedirectAfterLoginUrl(request.getSession(), requestUri);

				response.sendRedirect(wrapRequest.getContextPath() + "/login?redirectId=" + redirectId);
				return;
			}

			// Vérifiez si l'utilisateur a un rôle valide?
			boolean hasPermission = SecurityUtils.hasPermission(wrapRequest);
			if (!hasPermission) {

				RequestDispatcher dispatcher //
						= request.getServletContext().getRequestDispatcher("/views/accessDeniedView.jsp");

				dispatcher.forward(request, response);
				return;
			}
		}

		chain.doFilter(wrapRequest, response);
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {

	}

}