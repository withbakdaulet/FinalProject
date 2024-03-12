<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
<%@include file="vendor/navBar.jsp"%>
<div class="container">
    <div class="row mt-3">
        <div class="col">
            <h1>This is BITLAB portal</h1>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col">
           <form action="/register" method="post">
               <div class="mb-3">
                    <label class="form-label">Email addres</label>
                   <input type="email" class="form-control" id="exampleInputEmail" name="email">
               </div>
               <div class="mb-3">
                   <label class="form-label">Password</label>
                   <input type="password" class="form-control" id="exampleInputPassword1" name="password">
               </div>
               <div class="mb-3">
                   <label class="form-label">Repeat Password</label>
                   <input type="password" class="form-control" id="exampleInputPassword2" name="repPassword">
               </div>
               <div class="mb-3">
                   <label class="form-label">FullName</label>
                   <input type="text" class="form-control" id="fullName" name="fullName">
               </div>
               <button type="submit" class="btn btn-primary">Register</button>
           </form>
        </div>
    </div>
</div>
</body>
</html>
