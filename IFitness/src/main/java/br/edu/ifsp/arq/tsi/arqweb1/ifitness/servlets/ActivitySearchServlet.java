package br.edu.ifsp.arq.tsi.arqweb1.ifitness.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.Activity;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.ActivityType;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.activities.ActivitiesReader;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.activities.ActivityFilter;

@WebServlet("/activitySearch")
public class ActivitySearchServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ActivitySearchServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		ActivityType activityType = null;
		if(!type.isEmpty()) {
			activityType = ActivityType.valueOf(type);
		}
		String date = req.getParameter("initial-date");
		LocalDate initialDate = null;
		if(!date.isEmpty()) {
			initialDate = LocalDate.parse(date);
		}
		date = req.getParameter("final-date");
		LocalDate finalDate = null;
		if(!date.isEmpty()) {
			finalDate = LocalDate.parse(date);
		}
		
		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		
		ActivityFilter filter = new ActivityFilter();
		filter.setUser(user);
		filter.setType(activityType);
		filter.setInitialDate(initialDate);
		filter.setFinalDate(finalDate);
		List<Activity> userActivities = null;
		userActivities = ActivitiesReader.getActivitiesByFilter(filter);
		req.setAttribute("userActivities", userActivities);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/home.jsp");
		dispatcher.forward(req, resp);
	}
	
}