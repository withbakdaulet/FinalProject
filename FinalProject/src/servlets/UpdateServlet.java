package servlets;

import Models.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");


        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String cat = req.getParameter("cat");

        News news = new News();
        news.setTitle(title);
        news.setContent(content);

        Category category = new Category();
        category.setName(cat);

        if(DBmanager.saveNews(user,news,category)){
            resp.sendRedirect("update.jsp");
        }else{
            resp.sendRedirect("update/error.jsp");
        }

    }
}
