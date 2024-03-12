package servlets;

import Models.DBmanager;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String fullName = req.getParameter("fullName");
        String password = req.getParameter("password");
        String repPassword = req.getParameter("repPassword");

        if(password.equals(repPassword)){
            User user = new User();
            user.setEmail(email);
            user.setFull_name(fullName);
            user.setPassword(password);
            if(DBmanager.addUser(user)){
                resp.sendRedirect("/login");
            }
        }else {
            resp.sendRedirect("/register?passwordNotEqual");
        }
    }
}
