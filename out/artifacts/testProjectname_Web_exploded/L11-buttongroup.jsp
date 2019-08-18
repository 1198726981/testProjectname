<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <%--btn-group-g设置大小--%>
    <div class="btn-group">
        <button type="button" class="btn btn-default">left</button>
        <button type="button" class="btn btn-default">middle</button>
        <button type="button" class="btn btn-default">right</button>
    </div>

    <div class="btn-toolbar">
        <div class="btn-group">
            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-align-left"></span></button>
            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-align-left"></span></button>
            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-align-left"></span></button>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-align-center"></span></button>
            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-align-center"></span></button>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-align-right"></span></button>
        </div>
    </div>

</div>
</body>
</html>
