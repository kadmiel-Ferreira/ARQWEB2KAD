package Servlets.Helpers;

import java.util.List;

import dao.AnimalDao;
import dto.AnimalByType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;
import utils.DataSourceSearcher;

public class AnimalStatisticsByTypeHelper implements Helper{
	@Override
	public List<AnimalByType> execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(false);
		Usuario user = (Usuario)session.getAttribute("user");	
		AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
		return animalDao.getAnimaisStatisticByType();
	}
}
