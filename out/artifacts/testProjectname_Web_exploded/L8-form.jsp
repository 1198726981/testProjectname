<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<form role="form">
    <input type="text" class="form-control">
    <textarea class="form-control" rows="5">hello</textarea>
    <div class="checkbox">
        <label>
            <input type="checkbox" value="">
            1
        </label>
    </div>
    <div class="checkbox">
        <label>
            <input type="checkbox" value="">
            2
        </label>
    </div>
    <div class="radio">
        <label>
            <input name="optionRadios" type="radio" >男
        </label>
        <label>
            <input name="optionRadios" type="radio" checked>女
        </label>
    </div>

    <select class="form-control">
        <option>1</option>
        <option>2</option>
        <option>3</option>
    </select>
    <%--disabled不可选中状态--%>
    <input class="form-control" type="text" placeholder="hello" disabled>
</form>

<form role="form">
    <div class="form-group has-warning">
        <label>用户</label>
        <input class="form-control" type="text">
    </div>
    <div class="form-group has-success" >
        <label>用户</label>
        <input class="form-control" type="text">
    </div>
    <div class="form-group">
        <label>用户</label>
        <input class="form-control" type="text">
    </div>
</form>
</body>
</html>
