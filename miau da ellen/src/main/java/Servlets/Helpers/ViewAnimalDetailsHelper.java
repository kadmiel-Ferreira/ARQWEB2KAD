package Servlets.Helpers;

import dao.AnimalDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Animal;
import utils.DataSourceSearcher;

public class ViewAnimalDetailsHelper implements Helper{
	@Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        Long idAnimal = Long.parseLong(req.getParameter("animal-id"));
        System.out.println(idAnimal);
        AnimalDao dao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        Animal animal = dao.findById(idAnimal);
        if(animal != null) {
            req.setAttribute("animal", animal); 
        }
        return "/viewAnimalDetails.jsp";
    }
}
