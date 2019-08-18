<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 20:58
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
    <%--pull-right和dropdown-menu-right作用为放在右边--%>
    <div class="dropdown pull-right">
        <%--dropdown-toggle可以多次点击不同状态,必须添加--%>
        <button class="btn btn-default dropdown-toggle " type="button" data-toggle="dropdown">
            下拉菜单
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu  dropdown-menu-right" role="menu" >
            <li><a href="#" role="menuitem">第一个</a></li>
            <li><a href="#" role="menuitem">第一个</a></li>
            <li><a href="#" role="menuitem">第一个</a></li>
            <Li role="presentation" class="divider"></Li>
            <li><a href="#" role="menuitem">第一个</a></li>
            <li><a href="#" role="menuitem">第一个</a></li>
            <li><a href="#" role="menuitem">第一个</a></li>
        </ul>
    </div>
</div>


<script type="text/javascript" src="bootstrap/jq/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
