<%@ page import="java.util.ArrayList" %>
<%@ page import="Models.News" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.List" %>
<%@ page import="Models.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
    <%@include file="vendor/navBar.jsp"%>
    <div class="container">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row">

                    <div class="col-6 mt-3">
                            <form action="/addNews" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Title</label>
                                    <input type="text" class="form-control" id="exampleInputEmail" name="title">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Content</label>
                                    <textarea class="form-control" name="content" id="exampleInputPassword1" style="width: 100%; height: 40%;"></textarea>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select name="cat" class="form-select">
                                        <%List<Category> categories =(List) request.getSession().getAttribute("cat");
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
                                <button type="submit" class="btn btn-success">Add New</button>
                            </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
