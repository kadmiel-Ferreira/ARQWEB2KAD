package Servlets.Helpers;

import java.util.List;

import dao.AnimalDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Animal;
import model.Usuario;
import utils.DataSourceSearcher;

public class ListAnimalUsersHelper implements Helper{
	@Override
	public Object execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession(false);
		
		Usuario user = (Usuario)session.getAttribute("user");
		// listar atividades do usuário logado
		AnimalDao animalDao = 
				new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
		List<Animal> listaDeAnimaisUser = 
				animalDao.getAnimalsByUser(user);
		req.setAttribute("listaDeAnimaisUser", listaDeAnimaisUser);
		return "/animaisCadastrados.jsp?action=ListAnimal";
	}
}
