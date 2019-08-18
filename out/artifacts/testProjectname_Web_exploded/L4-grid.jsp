<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <style>
        .row{
            margin-bottom:20px;
        }
        .row .row{
            margin-top:10px;
            margin-bottom: 0;
        }
        <%--通配式--%>
        [class*="col-"]{
            padding-top:15px ;
            padding-bottom: 15px;
            background-color: #eee;
            border:1px solid #ddd;
        }
    </style>
</head>
<body>
<div class="container">
    <!--行设计-->
    <div class="row">
        <!--col-md-1数字代表当前所占的比例为12分之1-->
        <%--手机为xs，中性显示器为md，大型显示器为lg--%>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
        <div class="col-md-1">col-md-1</div>
    </div>
    <div class="row">
        <div class="col-lg-3">col-md-3</div>
        <div class="col-lg-3">col-md-3</div>
        <div class="col-lg-3">col-md-3</div>
        <div class="col-lg-3">col-md-3</div>
        <div class="col-lg-3">col-md-3</div>
    </div>
    <div class="row">
        <%--offset偏移1个--%>
        <div class="col-md-4 col-md-offset-1">
            col-md-4
        </div>
    </div>
    <div class="row">
        <div class="col-sm-9">
        one
            <div class="row">
                <div class="col-xs-8">
                    first
                </div>
                <div class="col-xs-4">
                    two
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
