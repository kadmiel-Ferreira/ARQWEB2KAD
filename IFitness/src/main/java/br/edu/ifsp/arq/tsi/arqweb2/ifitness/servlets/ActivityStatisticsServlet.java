package br.edu.ifsp.arq.tsi.arqweb2.ifitness.servlets;

import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;

import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.dto.ActivityByType;
import br.edu.ifsp.arq.tsi.arqweb2.ifitness.model.util.activities.ActivitiesReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/activityStatistics")
public class ActivityStatisticsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ActivityStatisticsServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String key = req.getParameter("key");
		
		HttpSession session = req.getSession(false);
		User user = (User)session.getAttribute("user");
		
		if(key.equals("type")) {
			List<ActivityByType> activityTypeList = ActivitiesReader.getActivitiesStatisticsByType(user);
			Gson gson = new Gson();
			String json = gson.toJson(activityTypeList);
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			resp.getWriter().write(json.toString());
		}
	}
	
}