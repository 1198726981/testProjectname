<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/15
  Time: 14:06
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
    <div class="panel panel-default">
        <div class="panel-heading">
            斗鱼网站
        </div>
        <div class="panel-body">
            12222222222<br>
            12333333333333333333<br>
            1222222222222222222222222222
        </div>
        <%--可在body下添加<table><ul>--%>
        <div class="panel-footer">
            www.douyu.com
        </div>
    </div>
</div>
<div class="container">
    <div class="starter">
        <h1>botstrap</h1>
        <p class="lead">12345</p>
    </div>
    <form action="${pageContext.request.contextPath}/addProduct.do" method="post" enctype="multipart/form-data">
        图片：<input type="file" name="file">
        <input type="submit" value="提交">
    </form>
</div>

</body>
</html>
