
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In</title>
    <%@include file="vendor/head.jsp"%>>
</head>
<body>
    <%@include file="vendor/navBar.jsp"%>
    <div class="container mt-3">
        <div style="margin-top: 30px; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);">
            <form action="/login" method="post">
                <label style="margin-bottom: 30px; font-size: 20px">Login Page</label>
                <br>
                <input class="form-control" style="margin-bottom: 10px" name="email" type="email" placeholder="Email">
                <br>
                <input class="form-control" style="margin-bottom: 10px"  name="password" type="password" placeholder="Password">
                <br>
                <button class="btn btn-success" type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
