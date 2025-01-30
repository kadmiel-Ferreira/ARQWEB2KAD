package Servlets.Helpers;

import dao.AnimalDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.*;
import utils.DataSourceSearcher;
import java.io.File;


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
        Raca raca = Raca.valueOf(req.getParameter("raca").toUpperCase());
        int idade = Integer.parseInt(req.getParameter("idade"));
        Sexo sexo = Sexo.valueOf(req.getParameter("sexo").toUpperCase());
        Porte porte = Porte.valueOf(req.getParameter("porte").toUpperCase());
        boolean castrado = req.getParameter("castrado") != null;
        Status status = Status.valueOf(req.getParameter("status").toUpperCase());
        String descricao = req.getParameter("descricao");

        AnimalDao animalDao = new AnimalDao(DataSourceSearcher.getInstance().getDataSource());
        Animal animal;

        if (id == 0) {
            // Cadastro de novo animal
            animal = new Animal();
        } else {
            // Edição: buscamos o animal atual para manter a imagem se necessário
            animal = animalDao.findById(id); // Método que busca o animal pelo ID
            if (animal == null) {
                throw new RuntimeException("Animal não encontrado para edição");
            }
        }

        // Processar o upload da imagem (se houver)
        Part filePart = req.getPart("imagem");
        String fileName = extractFileName(filePart);
        String imagePath = animal.getImagem(); // Mantém a imagem antiga por padrão

        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = "C:\\Users\\Faculdade\\git\\ARQWEB2KAD\\MiAu\\src\\main\\webapp\\uploads";
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