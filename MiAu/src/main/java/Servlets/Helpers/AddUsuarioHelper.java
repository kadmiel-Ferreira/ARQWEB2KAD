package Servlets.Helpers;

import dao.UsuarioDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Animal;
import model.Usuario;
import utils.DataSourceSearcher;
import utils.EncriptadorDeSenha;

public class AddUsuarioHelper implements Helper {

    @Override
    public Object execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        
        String tipoUsuario = req.getParameter("tipoUsuario");
        System.out.println("Tipo usuário recebido: " + tipoUsuario);

        if ("#".equals(tipoUsuario) || tipoUsuario == null) {
            req.setAttribute("result", "notRegistered");
            return "cadastrarPessoa.jsp"; 
        }
        
        Long id = Long.parseLong(req.getParameter("id"));
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("password");
        String telefone = req.getParameter("telefone");
        String cpf = "ADOTANTE".equals(tipoUsuario) ? req.getParameter("cpf") : null;
        String cnpj = "ONG".equals(tipoUsuario) ? req.getParameter("cnpj") : null;
        String logradouro = req.getParameter("logradouro");
        String numero = req.getParameter("numero");
        String complemento = req.getParameter("complemento");
        String bairro = req.getParameter("bairro");
        String cep = req.getParameter("cep");
        String cidade = req.getParameter("cidade");
        String estado = req.getParameter("estado");

        UsuarioDao usuarioDao = new UsuarioDao(DataSourceSearcher.getInstance().getDataSource());
        Usuario usuario = new Usuario();
        
        
        if ("ADOTANTE".equals(tipoUsuario)) {
            usuario.setCnpj(null); // Garante que CNPJ seja NULL
        } else if ("ONG".equals(tipoUsuario)) {
            usuario.setCpf(null);  // Garante que CPF seja NULL
        }
        
        
        usuario.setTipoUsuario(tipoUsuario);
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(EncriptadorDeSenha.encode(senha)); 
        usuario.setTelefone(telefone != null ? telefone.replaceAll("\\D", "") : null);
        usuario.setCpf(cpf != null ? cpf.replaceAll("\\D", "") : null);
        usuario.setCnpj(cnpj != null ? cnpj.replaceAll("\\D", "") : null);
        usuario.setLogradouro(logradouro);
        usuario.setNumero(numero);
        usuario.setComplemento(complemento);
        usuario.setBairro(bairro);
        usuario.setCep(cep);
        usuario.setCidade(cidade);
        usuario.setEstado(estado);

        
        

        try {
            boolean usuarioSalvo = usuarioDao.salvar(usuario);
            if (usuarioSalvo) {
                req.setAttribute("result", "success");
                return "/index.jsp"; 
            } else {
                req.setAttribute("result", "error");
                return "cadastrarPessoa.jsp";
            }
        } catch (RuntimeException e) {
            req.setAttribute("error", e.getMessage());
            return "cadastrarPessoa.jsp";
        }

    }
}
