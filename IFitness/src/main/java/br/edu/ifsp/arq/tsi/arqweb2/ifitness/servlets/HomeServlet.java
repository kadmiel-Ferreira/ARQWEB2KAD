package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import java.io.IOException;
import java.util.List;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.Activity;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dao.ActivityDao;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/homeServlet")
public class HomeServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public HomeServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url;
		HttpSession session = req.getSession(false);
		
		User user = (User)session.getAttribute("user");
		// listar atividades do usuário logado
		ActivityDao activityDao = 
				new ActivityDao(DataSourceSearcher.getInstance().getDataSource());
		List<Activity> userActivities = 
				activityDao.getActivitiesByUser(user);
		req.setAttribute("userActivities", userActivities);
		url = "/home.jsp";
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}




