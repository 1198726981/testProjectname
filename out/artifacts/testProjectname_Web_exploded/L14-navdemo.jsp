<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 23:27
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
    <%--class="nav-justified"充满布局，nav-pills不同的样式--%>
    <ul id="mytab" class="nav nav-tabs nav-justified" role="tablist">
        <li role="presentation " class="active"><a href="">home</a></li>
        <li role="presentation " ><a href="">home</a></li>
        <li role="presentation " ><a href="">home</a></li>
    </ul>
</div>

<script type="text/javascript" src="bootstrap/jq/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script>
    $("#mytab a").click(function (e) {
        e.preventDefault();
        $(this).tab("show");
    })
</script>
</body>
</html>
