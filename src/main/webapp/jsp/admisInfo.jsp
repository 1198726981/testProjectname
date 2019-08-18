
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
    <link rel="stylesheet" href="../bootstrap/css/userinfocss.css" >
</head>
<body onload="userAppsList()">
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
<div class="container">
    <div class="u_headr">
        <h1>管理中心</h1>
    </div>
    <div class="u_main">
        <div class="col-sm-2 u_nav"  >
            <%--class=disabled--%>
            <ul style="clear: both ;" class="nav nav-pills nav-stacked">
                <li><a  data-toggle="tab" data-target="#room_application" class="btn" onclick="userAppsList()">房间申请管理</a></li>
                <li><a  data-toggle="tab" data-target="#room_content" class="btn" onclick="usersAllVideosList()">房间内容管理</a></li>
                <%--<li><a  data-toggle="tab" data-target="#user_authority" class="btn">用户禁言管理</a></li>--%>
            </ul>

        </div>
        <div class="col-sm-10 u_main_body tab-content" >
            <div id="room_application" class="tab-pane fade in active">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">用户列表</div>
                            <table class="table table-bordered table-striped">
                                <thread>
                                    <tr>
                                        <th class="col-lg-2" >用户账号</th>
                                        <th class="col-lg-2" >用户名</th>
                                        <th class="col-lg-2" >操作</th>
                                    </tr>
                                </thread>
                                <tbody id="user_app_list">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div id="room_content" class="tab-pane fade in" style="overflow:scroll;">
                <div class="row">
                    <div class="col-lg-12" style="height: 70%">
                        <div class="panel panel-default">
                            <div class="panel-heading">用户列表</div>
                            <table class="table table-bordered table-striped user_video_list">
                                <thread>
                                    <tr>
                                        <th class="col-lg-3" >用户账号</th>
                                        <th class="col-lg-7" >文件名</th>
                                        <th class="col-lg-2" >操作</th>
                                    </tr>
                                </thread>
                                <tbody class="allUserVideos">

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>

            <div id="user_authority" class="tab-pane fade in">

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

    function userAppsList(){
        $.ajax({
            type:"get",
            url:"/userAppsList.action",
            success:function (data) {
                $("#user_app_list").empty();
                var arr=data.userList;
                for(var i=0;i<data.userList.length;i++){
                    var user_code=arr[i].user_code;
                    var user_name=arr[i].user_name;//onclick='consentApp("+user_code+")'>同意</a></td></tr>")这样的用法则onclick传的字符串被当作变量无法解析
                    $("#user_app_list").append("<tr><td>"+user_code+"</td><td>"+user_name+"</td><td><a class='btn btn-danger btn-xs' onclick=consentApp(\'"+user_code+"\')>同意</a></td></tr>")
                }
            }
        })
    };

    function consentApp (user_code){
        $.ajax({
            type: "get",
            url: "<%=basePath%>consentApp.action",
            data:{"user_code":user_code},
            success:function (data) {
                if(data=="FALL"){
                    alert("开启房间 失败！");
                }else{
                    if(data=="SUCCESS"){
                        alert("同意申请！");
                        window.location.reload();
                    }else {
                        alert("已经同意申请");
                        window.location.reload();
                    }
                }
        }
        })
    }

    function usersAllVideosList(){
        $.ajax({
            url:"/selectAllUserVideos.action",//后台的接口地址
            type:"post",//post请求方式:参数在请求体里 常用于修改。get请求方式：参数在url，不安全， 常用于查询
            cache: false,//只有get方式有用？作用为true的话会读缓存，而不是重新到服务器获取
            processData: false,
            contentType: false,//在form中设置了enctype = “multipart/form-data”，防止冲突
            success:function (data) {
                var arr=data.AllUservideoList;
                for(var i=0;i<data.AllUservideoList.length;i++){
                    var user_code=arr[i].user_code;
                    var video_id=arr[i].video_id;
                    var video_name=arr[i].video_name;
                    $(".allUserVideos").append("<tr><td>"+user_code+"</td><td>"+video_name+"</td><td><a class='btn btn-danger btn-xs' onclick=adminDeleteVideo(\'"+video_name+"\',\'"+user_code+"\')>删除</a></td></tr>")
                }
            },error:function () {
                alert("操作失败~");
            }
        })
    }

    function adminDeleteVideo(video_name,user_code) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/adminDeleteVideo.action",
            data:{"video_name":video_name,"user_code":user_code},
            success:function (data) {
                if(data=="SUCCESS"){
                    alert("删除成功!");
                    window.location.reload();
                }else{
                    alert("删除失败！");
                }
            }
        });
    }
</script>
</body>
</html>
