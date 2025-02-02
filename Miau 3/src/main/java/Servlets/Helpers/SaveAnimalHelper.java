package Servlets.Helpers;

import java.io.File;

import dao.AnimalDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Animal;
import model.Especie;
import model.Porte;
import model.Raca;
import model.Sexo;
import model.Status;
import model.Usuario;
import utils.DataSourceSearcher;


public class SaveAnimalHelper implements Helper {
    private static final String UPLOAD_DIR = "uploads"; // Pasta onde as imagens serão salvas

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("user");
        Long userId = user.getId();

        Long id = Long.parseLong(req.getParameter("id"));
        String nome = req.getParameter("nome");
        Especie especie = Especie.valueOf(req.getParameter("especie").toUpperCase());
        String racaCaesParam = req.getParameter("racaCaes");
        String racaGatosParam = req.getParameter("racaGatos");
        Raca racaCaes = null;
        Raca racaGatos = null;
        if (racaCaesParam != null && !racaCaesParam.isEmpty()) {
            racaCaes = Raca.valueOf(racaCaesParam.toUpperCase());
        }
        if (racaGatosParam != null && !racaGatosParam.isEmpty()) {
            racaGatos = Raca.valueOf(racaGatosParam.toUpperCase());
        }
        Raca raca = (racaCaes != null) ? racaCaes : racaGatos;
        int idade = Integer.parseInt(req.getParameter("idade"));
        Sexo sexo = Sexo.valueOf(req.getParameter("sexo").toUpperCase());
        Porte porte = Porte.valueOf(req.getParameter("porte").toUpperCase());
        boolean castrado = req.getParameter("castrado") != null;
        Status status = Status.valueOf("Disponível".toUpperCase());
        String descricao = req.getParameter("descricao");

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        Animal animal;

        if (id == 0) {
            
            animal = new Animal();
        } else {
            
            animal = animalDao.findById(id); 
            if (animal == null) {
                throw new RuntimeException("Animal não encontrado para edição");
            }
        }

        
        Part filePart = req.getPart("imagem");
        String fileName = extractFileName(filePart);
        String imagePath = animal.getImagem(); 

        if (fileName != null && !fileName.isEmpty()) {
            //String uploadPath = "C:\\Users\\kferreira\\Downloads\\ARQWEB2KAD-master\\MiAu\\src\\main\\webapp\\uploads";
            String uploadPath = "/Users/giovanioliveira/Documents/TESTE/ARQWEB2KAD/MiAu/src/main/webapp/uploads";
            
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            imagePath = UPLOAD_DIR + File.separator + fileName;
            filePart.write(uploadPath + File.separator + fileName);
        }

        // Atualiza os dados do animal
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
        animal.setImagem(imagePath); // Define a imagem (nova ou antiga)

        // Salvar ou atualizar
        if (id == 0) {
            if (animalDao.salvar(animal)) {
                req.setAttribute("result", "registered");
            }
        } else {
            if (animalDao.update(animal)) {
                req.setAttribute("result", "updated");
            }
        }

        return "/index.jsp";
    }

    private String extractFileName(Part part) {
        if (part == null) {
            return null;
        }
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("Header content-disposition: " + contentDisp);

        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                String fileName = content.substring(content.indexOf("=") + 2, content.length() - 1);
                return fileName.isEmpty() ? null : fileName;
            }
        }
        return null;
    }
}