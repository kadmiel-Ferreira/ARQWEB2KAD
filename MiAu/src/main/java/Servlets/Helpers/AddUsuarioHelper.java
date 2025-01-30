package Servlets.Helpers;


import dao.UsuarioDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import utils.DataSourceSearcher;
import utils.EncriptadorDeSenha;


public class AddUsuarioHelper implements Helper {


    @Override
    public Object execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	String tipoUsuario = req.getParameter("tipoUsuario");
        String nome = req.getParameter("nome");
        String email = req.getParameter("email");
        String senha = req.getParameter("password");
        String telefone = req.getParameter("telefone");
        String cpf = req.getParameter("cpf");
        String cnpj = req.getParameter("cnpj");
        if (tipoUsuario.equals("ADOTANTE")) {
        	cnpj = null;
        } else if (tipoUsuario.equals("ONG")) {
        	cpf = null;
        }
        String logradouro = req.getParameter("logradouro");
        String numero = req.getParameter("numero");
        String complemento = req.getParameter("complemento");
        String bairro = req.getParameter("bairro");
        String cep = req.getParameter("cep");
        String cidade = req.getParameter("cidade");
        String estado = req.getParameter("estado");
        
        Usuario usuario = new Usuario();
        usuario.setTipoUsuario(tipoUsuario);
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(EncriptadorDeSenha.encode(senha)); 
        usuario.setTelefone(telefone);
        usuario.setCpf(cpf);
        usuario.setCnpj(cnpj);
        usuario.setLogradouro(logradouro);
        usuario.setNumero(numero);
        usuario.setComplemento(complemento);
        usuario.setBairro(bairro);
        usuario.setCep(cep);
        usuario.setCidade(cidade);
        usuario.setEstado(estado);

        UsuarioDao usuarioDao = new UsuarioDao(DataSourceSearcher.getInstance().getDataSource());
        
        
        if (usuarioDao.salvar(usuario)) {
			req.setAttribute("result", "registered");
			return "/login.jsp";
		} else {
			req.setAttribute("result", "notRegistered");
			return "user-register.jsp";
		}
    }

}
