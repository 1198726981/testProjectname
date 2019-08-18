<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/14
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
</head>
<body>
${fileName};
<img src="/" alt="" class="img-circle">
<img src="" alt="" class="img-rounded">
<img src="" alt="" class="img-responsive">
<%--<c:forEach items="${productList}" var="product">
    <tr>
        <td><img src="/uploadimg/${product.pimage}"></td>
    </tr>
</c:forEach>--%>
</body>
</html>
