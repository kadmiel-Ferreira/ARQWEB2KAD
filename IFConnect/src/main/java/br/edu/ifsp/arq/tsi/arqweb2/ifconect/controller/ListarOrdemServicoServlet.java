package br.edu.ifsp.arq.tsi.arqweb2.ifconect.controller;

import java.io.IOException;
import java.util.List;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao.OrdemServicoDAO;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.OrdemServico;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.utils.DataSourceSearcher;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/listarOrdens")
public class ListarOrdemServicoServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    public ListarOrdemServicoServlet() {
		super();
	}
    
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url;
		
		try {
		OrdemServicoDAO ordemServicoDAO = new OrdemServicoDAO(DataSourceSearcher.getInstance().getDataSource());
		List<OrdemServico> ordens = ordemServicoDAO.listarOrdens();
		req.setAttribute("ordens", ordens);

		url = "/ordemServico.jsp";
		
		RequestDispatcher dispatcher = req.getRequestDispatcher(url);
		dispatcher.forward(req, resp);
		}catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erro ao listar ordens de serviço", e);
        }
	}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	
            OrdemServicoDAO ordemServicoDAO = new OrdemServicoDAO(DataSourceSearcher.getInstance().getDataSource());
            List<OrdemServico> ordens = ordemServicoDAO.listarOrdens();

            
            request.setAttribute("ordens", ordens);

            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/listarOrdens.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erro ao listar ordens de serviço", e);
        }
    }
}
