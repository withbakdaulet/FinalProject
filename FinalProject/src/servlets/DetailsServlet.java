package servlets;

import Models.Category;
import Models.Comment;
import Models.DBmanager;
import Models.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/detailsNews")
public class DetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    Long id = Long.valueOf(req.getParameter("id"));
    News news = DBmanager.getNews(id);
    req.setAttribute("news",news);

    List<Category> categories = DBmanager.getCats();
    req.setAttribute("categories",categories);

    List<Comment> comments = DBmanager.getComment(id);
    req.setAttribute("comments",comments);

    req.getRequestDispatcher("detailsNews.jsp").forward(req,resp);

    }
}
