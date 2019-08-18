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
    <link rel="stylesheet" href="../bootstrap/css/room.css" >
</head>
<body>
<section >
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
                            <button type="button" class="btn btn-primary" onclick="loginsuccess()"> 确认登录</button>
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

    <div class="container-fluid row" style="padding-top: 68px;">
        <div class="left col-md-8">
            <div class="left-title">
                <div class="title-img col-md-2">
                    <picture>
                        <img src="/uploadimg/${room_Ownner.user_img}">
                    </picture>
                </div>
                <div class="title-info col-md-6">
                    <div class="title-roomname " >
                        <h3 style="margin-top: 0">房间名：${ownner_Room.room_name}</h3>
                    </div>
                    <div class="classify ">
                        <h5 >分类为：${ownner_Room.room_classify}</h5>
                    </div>
                    <div class="user ">
                        <h5>主播：${room_Ownner.user_name}</h5>
                    </div>
                </div>
                <div class="subscribe col-md-4 ">
                    <button type="button" class="btn btn-danger btn-lg "  onclick="addSubscribe()">关注</button>
                    <button class="hidden btn btn-success btn-lg">已关注</button>
                </div>
                <div style="clear:both"></div>
            </div>

            <div class="left-video" style="height: 65%" >
                <video <%--style="width: auto;height: auto" --%>src="" controls="controls" height="100%" width="100%" id="videoid">

                </video>
            </div>
        </div>
        <div class="right col-md-4">
            <div class="video-list" style="height: 15%;overflow:scroll;">
                <ul>
                    <%--data-src为自定义属性，--%>
                        <c:forEach items="${videos}" var="video">
                    <li><a class="dj" href="javascript:"  onclick="changesrc('/uploadvideo/${video.video_url}')"  >${video.video_name}</a></li>
                    <%--<li><a class="dj" href="javascript:"  onclick="changesrc('/video/mov_bbb.mp4')" >第二个</a></li>--%>
                        </c:forEach>
                </ul>
            </div>
            <div    class="chat-room " style="height: 55% ;overflow:scroll;" id="roomMessage" >

            </div>
            <div class="chat-editor" style="height: 10%">
                <div class="navbar-form navbar-left " role="presentation">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="这里输入聊天内容" id="text">
                        <button  class="btn btn-default" onclick="send()">发送</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

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
    };

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
var changesrc=function(vsrc){
    document.getElementById("videoid").src=vsrc;
    document.getElementById("videoid").play();
}

//防止聊天数据被刷新用ajax
    var addSubscribe=function (){
        var judge="${sessionScope.USER_SESSION.user_code}";
        if(judge==""){

            alert("请先登录");
        }else {
            $.post("<%=basePath%>/addSubscribe.action",
                {"user_code":"${sessionScope.USER_SESSION.user_code}","room_url":"${ownner_Room.room_url}"}, function (data) {
                if (data=="WRONG"){alert("已经关注！");}
                else {
                    if (data == "OK") {
                        alert("关注成功！");
                    }else {
                        alert("关注失败");
                    }
                }
            })
        }
    }



    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        //实现化WebSocket对象，指定要连接的服务器地址与端口
        websocket = new WebSocket("ws://localhost:8080/websocket/"+"${ownner_Room.room_url}");
    } else {
        alert('当前浏览器 Not support websocket')
    }

    //websocket对象的事件,给触发事件创建方法
    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
        setMessageInnerHTML("WebSocket连接成功");
    };

    //接收到消息的回调方法,onmessage 当websocket接收到服务器发来的消息的时触发的事件
    websocket.onmessage = function (event) {
        setMessageInnerHTML(event.data);
    };

    //连接关闭的回调方法
    websocket.onclose = function () {
        setMessageInnerHTML("WebSocket连接关闭");
    };

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    };

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('roomMessage').innerHTML += innerHTML + '<br/>';
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息
    function send() {
        var judge="${sessionScope.USER_SESSION.user_code}";
        if(judge==""){

            alert("请先登录");
        }else {
            var message = document.getElementById('text').value;
            websocket.send(judge+":"+message);
        }
    }

</script>
</body>
</html>

    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../bootstrap/css/main.css" >
    <link rel="stylesheet" href="../bootstrap/css/room.css" >
</head>
<body>
<section >
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
                            <button type="button" class="btn btn-primary" onclick="loginsuccess()"> 确认登录</button>
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

    <div class="container-fluid row" style="padding-top: 68px;">
        <div class="left col-md-8">
            <div class="left-title">
                <div class="title-img col-md-2">
                    <picture>
                        <img src="/uploadimg/${room_Ownner.user_img}">
                    </picture>
                </div>
                <div class="title-info col-md-6">
                    <div class="title-roomname " >
                        <h3 style="margin-top: 0">房间名：${ownner_Room.room_name}</h3>
                    </div>
                    <div class="classify ">
                        <h5 >分类为：${ownner_Room.room_classify}</h5>
                    </div>
                    <div class="user ">
                        <h5>主播：${room_Ownner.user_name}</h5>
                    </div>
                </div>
                <div class="subscribe col-md-4 ">
                    <button type="button" class="btn btn-danger btn-lg "  onclick="addSubscribe()">关注</button>
                    <button class="hidden btn btn-success btn-lg">已关注</button>
                </div>
                <div style="clear:both"></div>
            </div>

            <div class="left-video" style="height: 65%" >
                <video <%--style="width: auto;height: auto" --%>src="" controls="controls" height="100%" width="100%" id="videoid">

                </video>
            </div>
        </div>
        <div class="right col-md-4">
            <div class="video-list" style="height: 15%;overflow:scroll;">
                <ul>
                    <%--data-src为自定义属性，--%>
                        <c:forEach items="${videos}" var="video">
                    <li><a class="dj" href="javascript:"  onclick="changesrc('/uploadvideo/${video.video_url}')"  >${video.video_name}</a></li>
                    <%--<li><a class="dj" href="javascript:"  onclick="changesrc('/video/mov_bbb.mp4')" >第二个</a></li>--%>
                        </c:forEach>
                </ul>
            </div>
            <div    class="chat-room " style="height: 55% ;overflow:scroll;" id="roomMessage" >

            </div>
            <div class="chat-editor" style="height: 10%">
                <div class="navbar-form navbar-left " role="presentation">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="这里输入聊天内容" id="text">
                        <button  class="btn btn-default" onclick="send()">发送</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

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
    };

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
var changesrc=function(vsrc){
    document.getElementById("videoid").src=vsrc;
    document.getElementById("videoid").play();
}

//防止聊天数据被刷新用ajax
    var addSubscribe=function (){
        var judge="${sessionScope.USER_SESSION.user_code}";
        if(judge==""){

            alert("请先登录");
        }else {
            $.post("<%=basePath%>/addSubscribe.action",
                {"user_code":"${sessionScope.USER_SESSION.user_code}","room_url":"${ownner_Room.room_url}"}, function (data) {
                if (data=="WRONG"){alert("已经关注！");}
                else {
                    if (data == "OK") {
                        alert("关注成功！");
                    }else {
                        alert("关注失败");
                    }
                }
            })
        }
    }



    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        //实现化WebSocket对象，指定要连接的服务器地址与端口
        websocket = new WebSocket("ws://localhost:8080/websocket/"+"${ownner_Room.room_url}");
    } else {
        alert('当前浏览器 Not support websocket')
    }

    //websocket对象的事件,给触发事件创建方法
    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
        setMessageInnerHTML("WebSocket连接成功");
    };

    //接收到消息的回调方法,onmessage 当websocket接收到服务器发来的消息的时触发的事件
    websocket.onmessage = function (event) {
        setMessageInnerHTML(event.data);
    };

    //连接关闭的回调方法
    websocket.onclose = function () {
        setMessageInnerHTML("WebSocket连接关闭");
    };

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    };

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('roomMessage').innerHTML += innerHTML + '<br/>';
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发�