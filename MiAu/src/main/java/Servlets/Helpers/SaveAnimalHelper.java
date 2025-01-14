package Servlets.Helpers;

import dao.AnimalDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Animal;
import model.Especie;
import model.Porte;
import model.Raca;
import model.Sexo;
import model.Status;
import model.Usuario;
import utils.DataSourceSearcher;

public class SaveAnimalHelper implements Helper {
	@Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		HttpSession session = req.getSession();
		Usuario user = (Usuario) session.getAttribute("user");
		Long userId = user.getId();
		System.out.println(userId);

    	Long id = Long.parseLong(req.getParameter("id")); 
    	String nome = req.getParameter("nome");
        Especie especie = Especie.valueOf(req.getParameter("especie").toUpperCase());
        Raca raca = Raca.valueOf(req.getParameter("raca").toUpperCase());
        int idade = Integer.parseInt(req.getParameter("idade"));
        Sexo sexo = Sexo.valueOf(req.getParameter("sexo").toUpperCase());
        Porte porte = Porte.valueOf(req.getParameter("porte").toUpperCase());
        boolean castrado = req.getParameter("castrado") != null;
        Status status = Status.valueOf(req.getParameter("status").toUpperCase());
        String descricao = req.getParameter("descricao");

        Animal animal = new Animal();
        Usuario usuario = new Usuario();
        animal.setNome(nome);
        animal.setEspecie(especie);
        animal.setRaca(raca);
        animal.setIdade(idade);
        animal.setSexo(sexo);
        animal.setPorte(porte);
        animal.setCastrado(castrado);
        animal.setStatus(status);
        animal.setDescricao(descricao);
        animal.setUserId(userId);
       
        
    	
    	
        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        if(id == 0) {
        	if (animalDao.salvar(animal)) {
    			req.setAttribute("result", "registered");
    		}
        } else {
			animal.setId(id);
			if(animalDao.update(animal)) {
				req.setAttribute("result", "registered");
			}
		}
        return "/index.jsp";
    }
}
