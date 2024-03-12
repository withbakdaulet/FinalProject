package servlets;

import Models.DBmanager;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(value = "/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("profile.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");
        String password = req.getParameter("password");
        String repPassword = req.getParameter("repPassword");
        String role = req.getParameter("role");
        Long id = Long.valueOf(req.getParameter("user_id"));


        if(password.equals(repPassword)){
            User user = new User();
            user.setEmail(email);
            user.setFull_name(fullName);
            user.setPassword(password);
            user.setRole_id(role);
            user.setId(id);

            if(DBmanager.updateUser(user)){
                req.getSession().setAttribute("current", user);

                resp.sendRedirect("/profile");
            }
        }else {
            resp.sendRedirect("/profile?error");
        }
    }
}
