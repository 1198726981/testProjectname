<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<%--responsive当页面缩小表格显示不完全则会有滚动条--%>
<div class="table-responsive">
    <%--table-strip 斑马线样式 bordered边框 hover鼠标悬停 condensed表格紧凑--%>
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr class="active">
                <th>表格标题</th>
                <th>表格标题</th>
                <th>表格标题</th>
            </tr>
        </thead>
        <tbody>
        <tr class="success">
            <td>表格单元</td>
            <td>表格单元</td>
            <td>表格单元</td>
        </tr>
        </tbody>
        <tbody>
        <tr class="info">
            <td>表格单元</td>
            <td>表格单元</td>
            <td>表格单元</td>
        </tr>
        </tbody>
        <tbody>
        <tr class="warning">
            <td>表格单元</td>
            <td>表格单元</td>
            <td>表格单元</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
