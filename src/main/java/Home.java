import com.auth0.jwt.interfaces.DecodedJWT;
import com.mini_zira.entities.Users;
import com.mini_zira.services.profile.ProfileServiceImpl;
import com.mini_zira.utility.Auth.JWTUtils;
import com.mini_zira.utility.Cookie.CookieUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "home-servlet", value = "/app/home")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/pages/home.jsp");
        String token = CookieUtils.getCookie(req, "token");
        if(token == null || token.isEmpty()){
            dispatcher.forward(req, resp);
            return;
        }
        DecodedJWT jwt =  JWTUtils.verifyToken(token);
        if(jwt == null){
            dispatcher.forward(req,resp);
            return;
        }
        String email = jwt.getClaim("email").asString();
        System.out.println(email);
        ProfileServiceImpl profileService = new ProfileServiceImpl();
        Users user = profileService.getProfile(email);

        if(user == null){
            dispatcher.forward(req,resp);
            return;
        }

        req.setAttribute("fullName", user.getFullName());
        req.setAttribute("email", user.getEmail());

        System.out.println(user.getEmail());

        dispatcher.forward(req, resp);



    }
}
