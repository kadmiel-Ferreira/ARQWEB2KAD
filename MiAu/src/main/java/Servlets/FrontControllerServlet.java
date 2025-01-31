package Servlets;

import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import Servlets.Helpers.Helper;
import Servlets.Helpers.HelperFactory;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ControllerServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB antes de armazenar no disco
    maxFileSize = 1024 * 1024 * 10,      // Tamanho máximo do arquivo: 10MB
    maxRequestSize = 1024 * 1024 * 50    // Tamanho máximo da requisição: 50MB
)
public class FrontControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public FrontControllerServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        String action = req.getParameter("action");

        if ((session == null || session.getAttribute("user") == null) &&
            (action == null || (!action.equals("login") && !action.equals("AdicionarPessoa")))) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return; // Evita continuar a execução
        } else {
            Helper helper = new HelperFactory().getHelper(req);
            try {
                Object response = helper.execute(req, resp);
                if (response instanceof JsonObject) {
                    resp.setContentType("application/json");
                    resp.getWriter().write(response.toString());
                } else if (response instanceof List) {
                    resp.setContentType("application/json");
                    resp.getWriter().write(new Gson().toJson(response));
                } else {
                    RequestDispatcher dispatcher = req.getRequestDispatcher(response.toString());
                    dispatcher.forward(req, resp);
                }
            } catch (Exception error) {
                throw new ServletException(error);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}