package Servlets.Helpers;

import java.sql.SQLException;
import java.util.List;

import dao.AnimalDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Animal;
import model.Especie;
import model.Usuario;
import model.filters.EspecieFilter;
import utils.DataSourceSearcher;

public class SearchForEspecieHelper implements Helper {
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String especie = req.getParameter("especie");
		Especie especieType = null;
		if(!especie.isEmpty()) {
			especieType = Especie.valueOf(especie);
		}
		HttpSession session = req.getSession(false);;
		Usuario user = (Usuario)session.getAttribute("user");
		
		EspecieFilter filter = new EspecieFilter();
		filter.setUser(user);
		filter.setEspecie(especieType);
		System.out.println("Especie selecionada: " + especieType);
		System.out.println("Usuário: " + user);
		AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
		List<Animal> userEspecies = null;
		try {
			userEspecies = animalDao.getEspecieByFilter(filter);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Quantidade de animais filtrados: " + (userEspecies != null ? userEspecies.size() : "null"));
		req.setAttribute("listaDeAnimais", userEspecies);
		System.out.println("Atributo listaDeAnimais setado no request.");
		return "/home.jsp";
	}
	
	
}
