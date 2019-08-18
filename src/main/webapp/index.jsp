<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <%-- width=当前设备的宽度，缩放比例为1即完全不缩放--%>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>bootstrap</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

</head>
<body>
<%response.sendRedirect("/showSelectRoom");%>
<%--class="第一个为class的名称，第二个为样式可为默认，第三个为位置可为顶部"--%>

<%--
<div class="container">
    <div class="starter">
        <h1>botstrap</h1>
        <p class="lead">12345</p>
    </div>
    <form action="/addProduct.do" method="post" enctype="multipart/form-data">
        图片：<input type="file" name="file">
        <input type="submit" value="提交">
    </form>
</div>
--%>


</body>
</html>
