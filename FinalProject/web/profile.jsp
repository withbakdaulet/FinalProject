<%@ page import="Models.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<div class="container">
    <div class="row mt-3">
        <div class="col">
            <h1>This is ESTIP BIL NEWS portal</h1>
        </div>
    </div>
    <%
    if (user!=null){
    %>
    <div class="row mt-3">
        <div class="col">
            <form action="/profile" method="post">
                <div class="mb-3">
                    <label class="form-label">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail" name="email"
                           readonly value="<%=user.getEmail()%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" value="<%=user.getPassword()%>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Repeat Password</label>
                    <input type="password" class="form-control" name="repPassword" >
                </div>
                <div class="mb-3">
                    <label class="form-label">FullName</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" value="<%=user.getFull_name()%>">
                </div>
                <div class="mb-3">
                    <input type="hidden" class="form-control" name="role" value="<%=user.getRole_id()%>">
                </div>
                <div class="mb-3">
                    <input type="hidden" class="form-control" name="user_id" value="<%=user.getId()%>">
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
    <%
    }
    %>


</div>
</body>
</html>
