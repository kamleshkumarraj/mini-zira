import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "home-servlet", value = "/home")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        System.out.println(System.getenv(("DB_USER")));
        System.out.println("Home redirecting ...");
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pages/home.jsp");
        dispatcher.forward(req,resp);

    }
}
