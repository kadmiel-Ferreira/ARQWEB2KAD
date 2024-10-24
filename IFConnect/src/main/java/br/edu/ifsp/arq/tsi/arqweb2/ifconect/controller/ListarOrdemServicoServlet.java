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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	System.out.println("TEEEEEEEEEESTEEEEEEEEEEEE2");
            OrdemServicoDAO ordemServicoDAO = new OrdemServicoDAO(DataSourceSearcher.getInstance().getDataSource());
            List<OrdemServico> ordens = ordemServicoDAO.listarOrdens();

            
            request.setAttribute("ordens", ordens);

            System.out.println("TEEEEEEEEEESTEEEEEEEEEEE3");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/listarOrdens.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Erro ao listar ordens de serviço", e);
        }
    }
}
