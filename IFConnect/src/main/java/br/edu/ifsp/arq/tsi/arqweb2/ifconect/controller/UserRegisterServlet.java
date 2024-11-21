package br.edu.ifsp.arq.tsi.arqweb2.ifconect.controller;

import java.io.IOException;
import java.time.LocalDate;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.User;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao.UserDAO;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Gender;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.utils.DataSourceSearcher;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.utils.PasswordEncoder;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 

@WebServlet("/userRegister")
public class UserRegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public UserRegisterServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String dateOfBirth = req.getParameter("dateOfBirth");
		String gender = req.getParameter("gender");
		
		User user = new User();
		user.setName(name); 
		user.setEmail(email);
		user.setPassword(PasswordEncoder.encode(password));
		user.setDateOfBirth(LocalDate.parse(dateOfBirth));
		user.setGender(Gender.valueOf(gender));
		
		UserDAO userDao = new UserDAO(DataSourceSearcher.getInstance().getDataSource());
		
		RequestDispatcher dispatcher = null;
		
		if(userDao.save(user)) {
			req.setAttribute("result", "registered");
			dispatcher = req.getRequestDispatcher("/login.jsp");
		}else {
			req.setAttribute("result", "notRegistered");
			dispatcher = req.getRequestDispatcher("user-register.jsp");
		}
		
		dispatcher.forward(req, resp);
	}

}