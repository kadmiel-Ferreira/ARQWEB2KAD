package Servlets.Helpers;


import java.io.IOException;

import dao.UsuarioDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import utils.DataSourceSearcher;
import utils.EncriptadorDeSenha;

public class EditUsuarioHelper implements Helper{


	 @Override
	    public Object execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        try {
        	String tipoUsuario = req.getParameter("tipoUsuario");
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
            Usuario usuario = usuarioDao.getUserById(id);
            
            if (usuario != null) {
            	if ("ADOTANTE".equals(tipoUsuario)) {
            	    if (usuario.getCnpj() != null) {
            	        usuario.setCnpj(null); 
            	    }
            	} else if ("ONG".equals(tipoUsuario)) {
            	    if (usuario.getCpf() != null) {
            	        usuario.setCpf(null); 
            	    }
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
                usuarioDao.update(usuario);
                req.setAttribute("result", "success");
                System.out.println("sucesso ao editar");
                req.getSession().setAttribute("user", usuario);	

                return "paginaUsuario.jsp";
            } else {
            	req.setAttribute("result", "error");
                System.out.println("erro ao editar");

                return "/cadastrarPessoa.jsp";
            }
        } catch (Exception e) {
            
            req.setAttribute("result", "error");
            System.out.println("erro ao editar");

            return "/cadastrarPessoa.jsp";
            
        }
    }
}

	
