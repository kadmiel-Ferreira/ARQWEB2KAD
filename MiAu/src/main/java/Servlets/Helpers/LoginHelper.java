package Servlets.Helpers;

import java.util.Optional;

import dao.UsuarioDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;
import utils.DataSourceSearcher;

public class LoginHelper implements Helper {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		UsuarioDao userDao = new UsuarioDao(DataSourceSearcher.getInstance().getDataSource());
		Optional<Usuario> optional = userDao.getUserByEmailAndPassword(email, password);
		if(optional.isPresent()) {
			Usuario user = optional.get();
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(6000);
			session.setAttribute("user", user);
			return "/index.jsp";
		}else {
			req.setAttribute("result", "loginError");
			return "/login.jsp";
		}
	}

}