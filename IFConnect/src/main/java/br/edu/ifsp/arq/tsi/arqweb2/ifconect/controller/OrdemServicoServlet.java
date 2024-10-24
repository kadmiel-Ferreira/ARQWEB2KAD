package br.edu.ifsp.arq.tsi.arqweb2.ifconect.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao.ClienteDAO;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao.OrdemServicoDAO;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.FormaPagamento;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.OrdemServico;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Status;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ordemServico")
public class OrdemServicoServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
	
	public OrdemServicoServlet() {
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			OrdemServico ordemservico = new OrdemServico();
	        Cliente cliente = new Cliente();
	        FormaPagamento formaPagamento = new FormaPagamento();
	        
			//int idCliente = cliente.setCodigo(Integer.parseInt(req.getParameter("cliente_id")));
	        cliente.setCodigo(Integer.parseInt(req.getParameter("cliente_id")));
            formaPagamento.setId(Integer.parseInt(req.getParameter("forma_pagamento_id")));
            ordemservico.setCliente(cliente);
            ordemservico.setFormapagamento(formaPagamento);;
            ordemservico.setStatus(Status.valueOf(req.getParameter("status")));  
            ordemservico.setDescricao(req.getParameter("descricao"));
            ordemservico.setDataCriacao(LocalDate.now());
			System.out.println(ordemservico);
			OrdemServicoDAO ordemservicodao = new OrdemServicoDAO(DataSourceSearcher.getInstance().getDataSource());
			
			RequestDispatcher dispatcher = null;
			
			if(ordemservicodao.save(ordemservico)) {
				req.setAttribute("result", "registered");
				dispatcher = req.getRequestDispatcher("/cliente.jsp");
			}else {
				req.setAttribute("result", "notRegistered");
				dispatcher = req.getRequestDispatcher("user-register.jsp");
			}
			
			dispatcher.forward(req, resp);
			
		}catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erro ao criar ordem de serviço", e);
        }
		
		
	}
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	System.out.println("TEEEEEEEEEESTEEEEEEEEEEEE2");
            ClienteDAO clienteDAO = new ClienteDAO(DataSourceSearcher.getInstance().getDataSource());
            List<Cliente> clientes = clienteDAO.listarClientes();

            
            request.setAttribute("clientes", clientes);

            System.out.println("TEEEEEEEEEESTEEEEEEEEEEE3");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ordemServico.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erro ao listar ordens de serviço", e);
        }
    }
	
}
