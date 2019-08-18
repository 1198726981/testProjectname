<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<%--role属性form-inline内敛表单--%>
<%--不添加内敛表单，宽度为fillparent100%，内敛表单宽度为自适应auto--%>
<form role="form" class="form-inline">
    <div class="form-group">
        <label >时间</label>
        <input type="date" class="form-control" placeholder="user">
        <label >email</label>
        <input type="email" class="form-control" placeholder="enter email">
    </div>

    <div class="form-group">
        <%--class="sr-only"可隐藏label--%>
        <label>密码</label>
        <input type="password" class="form-control" placeholder="enter password">
    </div>
    <div class="form-group">
        <label>选择文件</label>
        <input type="file" >
    </div>
</form>
<%--水平表单 使用栅格系统--%>
<%--class="form-control"输入框样式--%>
<form class=form-horizontal" role="form">
    <div class="form-group">
        <label class="col-sm-1 control-label">email</label>
        <div class="col-sm-11">
            <input type="email" class="form-control input-lg" placeholder="email">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-1 control-label">password</label>
        <div class="col-sm-11">
            <input type="password" class="form-control" placeholder="password">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-11">
            <div class="checkbox">
                <label>
                    <input type="checkbox">记住密码
                </label>
            </div>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-11">
            <button type="submit" class="btn btn-default">登录</button>
        </div>
    </div>
</form>
</body>
</html>
