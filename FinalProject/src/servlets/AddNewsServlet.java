package servlets;

import Models.Category;
import Models.DBmanager;
import Models.News;
import Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/addNews")
public class AddNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = DBmanager.getCats();
        req.setAttribute("cat",categories);

        User user = (User) req.getSession().getAttribute("current");
        if(user!=null && user.getRole_id().equals("1")){
            req.getRequestDispatcher("/addNews.jsp").forward(req,resp);
        }else {
            resp.sendRedirect("/login?error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Long cat_id = Long.valueOf(req.getParameter("cat"));

        News news = new News();
        news.setTitle(title);
        Category cat = new Category();
        cat.setId(cat_id);
        news.setContent(content); news.setCategory(cat);

        DBmanager.addNews(news);
        resp.sendRedirect("/news");
    }
}
