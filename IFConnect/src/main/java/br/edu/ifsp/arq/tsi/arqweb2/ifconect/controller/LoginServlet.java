package br.edu.ifsp.arq.tsi.arqweb2.ifconect.controller;

import java.io.IOException;
import java.util.Optional;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao.UserDAO;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.User;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public LoginServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		String url;
		
		UserDAO userDao = new UserDAO(DataSourceSearcher.getInstance().getDataSource());
		
		Optional<User> optional = userDao.getUserByEmailAndPassword(email, password);
		if(optional.isPresent()) {
			User user = optional.get();
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(600);
			session.setAttribute("user", user);
			url = "/listarOrdens";
		}else {
			req.setAttribute("result", "loginError");
			url = "/login.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}

}