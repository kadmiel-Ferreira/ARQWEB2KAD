package br.edu.ifsp.arq.tsi.arqweb2.ifconect.controller;

import java.io.IOException;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao.ClienteDAO;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Endereco;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clienteRegister")
public class ClienteRegisterServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	public ClienteRegisterServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String telefone = req.getParameter("telefone");
		String cpf = req.getParameter("cpf");  
		String rua = req.getParameter("rua");
		String cidade = req.getParameter("cidade"); 
		String estado = req.getParameter("estado"); 
		String cep = req.getParameter("cep"); 
		
		Cliente cliente = new Cliente();
		cliente.setNome(name);
		cliente.setEmail(email);
		cliente.setTelefone(telefone);
		cliente.setCpf(cpf);
		Endereco endereco = new Endereco();
		endereco.setRua(rua);
		endereco.setCidade(cidade);
		endereco.setEstado(estado);
		endereco.setCep(cep);
		
		cliente.setEndereco(endereco);
		
		
		
		ClienteDAO clienteDao = new ClienteDAO(DataSourceSearcher.getInstance().getDataSource());
		
		RequestDispatcher dispatcher = null;
		
		if(clienteDao.save(cliente)) {
			req.setAttribute("result", "registered");
			dispatcher = req.getRequestDispatcher("/cliente.jsp");
		}else {
			req.setAttribute("result", "notRegistered");
			dispatcher = req.getRequestDispatcher("user-register.jsp");
		}
		
		dispatcher.forward(req, resp);
	}
}
