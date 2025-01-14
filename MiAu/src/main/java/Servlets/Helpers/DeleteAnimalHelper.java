package Servlets.Helpers;

import com.google.gson.JsonObject;

import dao.AnimalDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Animal;
import utils.DataSourceSearcher;

public class DeleteAnimalHelper implements Helper {
	@Override
	public JsonObject execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		Long animalId = Long.parseLong(req.getParameter("animal-id"));
		Boolean response;	
		AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
		Animal animal = animalDao.findById(animalId); 
		if(animal != null) {
			animalDao.delete(animal);
			response = true;
		}else {
			response = false;
		}
		JsonObject json = new JsonObject();
		json.addProperty("response", response);
		return json;
	}
}
