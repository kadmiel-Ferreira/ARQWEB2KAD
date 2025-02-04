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
        if ("#".equals(tipoUsuario)) {
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
        
        usuario.setTipoUsuario(tipoUsuario);
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(EncriptadorDeSenha.encode(senha)); 
        usuario.setTelefone(telefone != null ? telefone.replaceAll("\\D", "") : null);

        usuario.setCpf(cpf);
        usuario.setCnpj(cnpj);
        usuario.setLogradouro(logradouro);
        usuario.setNumero(numero);
        usuario.setComplemento(complemento);
        usuario.setBairro(bairro);
        usuario.setCep(cep);
        usuario.setCidade(cidade);
        usuario.setEstado(estado);

        
       
        boolean usuarioCadastrado = usuarioDao.salvar(usuario);
        
        String resultado = usuarioCadastrado ? "registered" : "notRegistered";    
        req.setAttribute("result", resultado);
        return usuarioCadastrado ? "/login.jsp" : "cadastrarPessoa.jsp";
    }
}
