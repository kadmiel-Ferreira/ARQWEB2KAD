package br.edu.ifsp.arq.tsi.arqweb1.ifitness.servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.Activity;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.ActivityType;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.activities.ActivitiesReader;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.activities.ActivitiesWriter;

@WebServlet("/activityRegister")
public class ActivityRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ActivityRegisterServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long id = Long.parseLong(req.getParameter("id"));
		ActivityType type = ActivityType.valueOf(req.getParameter("type"));
		LocalDate date = LocalDate.parse(req.getParameter("date"));
		Double distance = Double.parseDouble(req.getParameter("distance"));
		Double duration = Double.parseDouble(req.getParameter("duration"));
		String url;
		HttpSession session = req.getSession(false);

		User user = (User) session.getAttribute("user");
		Activity activity = new Activity();
		activity.setType(type);
		activity.setDate(date);
		activity.setDistance(distance);
		activity.setDuration(duration);
		activity.setUser(user);
		if (id == 0) {
			if (ActivitiesWriter.write(activity)) {
				req.setAttribute("result", "registered");
			}
		} else {
			activity.setId(id);
			if (ActivitiesWriter.update(activity)) {
				req.setAttribute("result", "registered");
			}
		}
		url = "/activity-register.jsp";

		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		Long id = Long.parseLong(req.getParameter("activity-id"));
		String url = null;

		Activity activity = ActivitiesReader.findById(id);
		RequestDispatcher dispatcher = null;
		if(activity != null) {
			if(action.equals("update")) {
				req.setAttribute("activity", activity);
				url = "/activity-register.jsp";
				dispatcher = req.getRequestDispatcher(url);
				dispatcher.forward(req, resp);
			}
			if(action.equals("remove")) {
				Boolean response = ActivitiesWriter.delete(activity);
				Gson gson = new Gson();
				String json = gson.toJson(response);
				resp.setContentType("application/json");
				resp.getWriter().write(json.toString());
			}
		}else {
			url = "/homeServlet";
			dispatcher = req.getRequestDispatcher(url);
			dispatcher.forward(req, resp);
		}

		
	}

}
