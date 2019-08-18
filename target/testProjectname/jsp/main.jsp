<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../bootstrap/css/main.css" >
</head>
<%--判断输入是否为空
判断用户是否登录的过滤器
判断注册用户账号是否已有
判断登录是否成功--%>
<body <%--style="padding-right: 0px!important; "--%>id="mainbg">

<nav class="navbar navbar-border " role="navigation" id="navbg">
    <a class="navbar-brand "  href="#"><img alt="Brand" src="../img/brand48.png"></a>
    <div class="container-fluid">
        <div class="navbar-header">
            <p class="navbar-brand" >长颈鹿网</p>
        </div>
        <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav" id="mytab">
                <li <%--class="active"--%>><a href="${pageContext.request.contextPath}/showSelectRoom">首页</a></li>
            </ul>
            <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/showSelectRoom">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索" name="queryText">
                    <button type="submit" class="btn btn-default">搜索</button>
                </div>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="${pageContext.request.contextPath}/selectSubscribe"  id="subscribe_a">关注</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类<span class="caret"></span> </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${pageContext.request.contextPath}/classify?room_classify=运动">运动</a></li>
                        <li><a href="${pageContext.request.contextPath}/classify?room_classify=教学">教学</a></li>
                        <li><a href="${pageContext.request.contextPath}/classify?room_classify=娱乐">娱乐</a></li>
                        <li><a href="${pageContext.request.contextPath}/classify?room_classify=其他">其它</a></li>
                        <li><a href="${pageContext.request.contextPath}/classify?room_classify=直播">直播</a></li>
                    </ul>
                </li>
                <li >
                    <c:if test="${sessionScope.USER_SESSION!=null&&sessionScope.USER_SESSION.identity!='3'}" >
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" id="userlist" >用户<span class="caret"></span> </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/jsp/userinfo.jsp">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout.action">退出</a></li>
                    </ul>
                    </c:if>
                </li>
                <li >
                    <c:if test="${sessionScope.USER_SESSION!=null&&sessionScope.USER_SESSION.identity=='3'}" >
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" id="adminlist" >管理员<span class="caret"></span> </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/jsp/admisInfo.jsp">管理信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout.action">退出</a></li>
                    </ul>
                    </c:if>
                </li>
                <li  >
                    <c:if test="${sessionScope.USER_SESSION==null}" >
                    <%--data-toggle作用为启用模态框，data-target作用为弹出框的内容,需引入jq和js文件--%>
                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#loginCustomerDialog" >登录</a>
                    </c:if>
                </li>
                <li>
                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#newCustomerDialog"  >注册</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="loginCustomerDialog" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">登录用户</h4>
            </div>
            <div class="modal-body">
                <span id="message"></span>
                <form class="form-horizontal login_user" id=""  method="post" >
                    <div class="form-group">
                        <label for="user_code" class="col-sm-2 control-label">
                            账号名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="user_code" placeholder="账号名" name="user_code" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">
                            密码
                        </label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" placeholder="密码" name="password" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="loginsuccess();"> 确认登录</button>
                    </div>
                </form>

            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabe2">注册账号信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_user"  method="post" >
                    <div class="form-group">
                        <label for="new_username" class="col-sm-2 control-label">
                            用户名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_username" placeholder="用户名" name="new_username" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_usercode" class="col-sm-2 control-label">
                            账号名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_usercode" placeholder="账号名" name="new_usercode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_password" class="col-sm-2 control-label">
                            密码
                        </label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="new_password" placeholder="密码" name="new_password" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_password2" class="col-sm-2 control-label">
                            再次输入密码
                        </label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="new_password2" placeholder="再次输入密码" name="new_password2" />
                        </div>
                    </div>
                    <span id="wrong"></span>
                    <span id="wrong2"></span>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" onclick="createUser()">确认注册</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<div >
    <div class=" container-fluid" >
        <div class="prompt-container" style="width: 100%; height:50px;">
        </div>
        <div class="">
            <ul class=" " style="list-style-type: none;display: block">
                <c:forEach items="${pageInfo.list}" var="room">
                    <li class="layout-cover-item col-md-3 " >
                        <div class="content-all ">
                            <div class="radius">
                                <a href="${pageContext.request.contextPath}/openRoom?room_url=${room.room_url}&room_ownner=${room.room_ownner}" target="_blank">
                                    <div  class="room-img">
                                        <img src="/uploadimg/${room.room_img}" class="img-rounded">
                                    </div>
                                    <div class="room-content">
                                        <div>
                                            <h3>${room.room_name}</h3>
                                        </div>
                                        <div>
                                            <span>在线人数：${room.room_online}</span>
                                            <span>点击量：${room.room_play_count}</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
                </c:forEach>

                <div style="clear:both">
                </div>
            </ul>

            <div class="footer" style="display: block">
                <ul class="pagination " >
                    <li><a href="showSelectRoom?pageNo=${pageInfo.firstPage}">首页</a></li>
                    <li><a href="showSelectRoom?pageNo=${pageInfo.pageNum-1}">&laquo</a></li>
                    <c:forEach items="${pageInfo.navigatepageNums}"
                               var="pagenum">
                        <c:if test="${pagenum==pageInfo.pageNum}">
                            <li class="active">
                                <a href="#">${pagenum}</a>
                            </li>
                        </c:if>
                        <c:if test="${pagenum!=pageInfo.pageNum}">
                            <li>
                                <a href="showSelectRoom?pageNo=${pagenum}">${pagenum}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <li><a href="showSelectRoom?pageNo=${pageInfo.pageNum+1}">&raquo</a></li>
                    <li><a href="showSelectRoom?pageNo=${pageInfo.lastPage}">尾页</a></li>
                </ul>
            </div>
        </div>



    </div>
</div>



<script type="text/javascript" src="../bootstrap/jq/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var loginsuccess= function() {
        $.post("<%=basePath%>/login.action", $(".login_user").serialize(), function (data) {
            if (data == "OK") {
                alert("登录成功");
                window.location.reload();
            } else {
                $("#message").text("账号或密码错误，请重新输入！");
                alert("登录失败");
            }
        })
    }

    var createUser=function () {
        $("#wrong").text("");
        $("#wrong2").text("");
        $.post("<%=basePath%>/register.action",
            $("#new_user").serialize(),function(data){
                if(data =="WRONG"){
                    $("#wrong").text("两次输入的密码不同");
                }else{
                    if(data=="WRONG2"){
                        $("#wrong2").text("已存在账户名");
                    }else {
                        if(data=="OK"){
                            alert("用户创建成功！");
                            window.location.reload();
                        }else {
                            alert("用户创建失败");
                        }
                    }
                }
            });
    }

</script>
</body>
</html>
