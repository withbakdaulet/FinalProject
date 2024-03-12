<%@ page import="java.util.ArrayList" %>
<%@ page import="Models.News" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %>
<%@ page import="Models.Category" %>
<%@ page import="Models.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
    <%@include file="vendor/navBar.jsp"%>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row">
                <%News news = (News) request.getAttribute("news");
                    if(news!=null){
                    if( user != null && user.getRole_id().equals("1")){
                %>
                    <div class="col-6 mt-3">
                        <form action="/update" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" name="title"
                                           value="<%=news.getTitle()%>>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Content</label>
                                    <textarea class="form-control" name="content" id="exampleInputPassword1"
                                              style="width: 100%; height: 40%;"> <%=news.getContent()%></textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select name="cat" class="form-select">
                                        <%
                                            List<Category> categories =(List) request.getAttribute("categories");
                                            if(categories!=null){
                                                for(Category cat: categories){
                                        %>
                                        <option value="<%=cat.getId()%>"><%=cat.getName()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-success">UPDATE NEWS</button>
                        </form>

                        <form action="/delete" method="post" style="margin-top: 100px">
                            <input type="hidden" class="form-control"  name="id" value="<%=news.getId()%>">
                            <button type="submit" class="btn btn-danger">DELETE NEWS</button>
                        </form>
                    <%}
                    } else if(user!= null && news!=null && user.getRole_id().equals("2")){
                    %>
                        <div class="col-12 mt-3">
                            <div class="card" style="width: 100%;">
                                <div class="card-body text-primary" style="border: blueviolet 1px solid; border-radius: 5px">
                                    <h5 class="card-title"><%=news.getTitle()%></h5>
                                    <p class="card-text"><%=news.getContent()%></p>
                                    <p class="text-secondary"><%=news.getPost_date()%></p>
                                    <p class="text-secondary"><%=news.getCategory().getName()%></p>
                                </div>
                            </div>
                        </div>
                     <div class="container"> <%--getcomment--%>
                            <div class="row">
                                <div class="col-6">
                                        <div class="row">
                                        <%List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                                            if(comments!=null){
                                                for(Comment n: comments){
                                        %>
                                        <div class="row-3 mt-3">
                                            <div class="card" style="width: 100%;">
                                                <div class="card-body text-primary" style="border: blueviolet 1px solid; border-radius: 5px">
                                                    <h5 class="card-title"><%=n.getUser().getEmail()%></h5>
                                                    <p class="card-text"><%=n.getComment()%></p>
                                                    <p class="text-secondary"><%=n.getPost_date()%></p>
                                                </div>
                                            </div>
                                        </div>
                            <%
                                    }
                                }
                            %>
                                </div>
                            </div>
                            </div>
                        <div class="col-6">
                            <%if (user!=null){

                            %>
                            <form action="/comment" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Comment</label>
                                    <input type="text" class="form-control" name="comment">
                                </div>
                                <div class="mb-3">
                                    <input type="hidden" class="form-control" name="user_id" value="<%=user.getId()%>">
                                    <input type="hidden" class="form-control" name="news_id" value="<%=news.getId()%>">
                                </div>
                                <div class="mb-3">
                                <button type="submit" class="btn btn-success">Write comment</button>
                                </div>
                            </form>
                            <%
                            }
                            %>
                        </div>

                    <%
                        }
                    %>
                </div>
            </div>
        </div>


    </div>
</body>
</html>
