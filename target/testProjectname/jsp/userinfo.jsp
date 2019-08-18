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
<body>
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
        <h1>个人中心</h1>
    </div>
    <div class="u_main">
        <div class="col-sm-2 u_nav"  >
            <%--class=disabled--%>
            <ul style="clear: both ;" class="nav nav-pills nav-stacked">
                <li><a  data-toggle="tab" data-target="#my_info" class="btn">我的资料</a></li>
               <%-- <li><a  data-toggle="tab" data-target="#my_letter" class="btn">站内信</a></li>--%>
                <%--<li><a  data-toggle="tab" data-target="#my_subscribe" class="btn" onclick="select_Subscribe()">我的关注</a></li>--%>
                <c:if test="${sessionScope.USER_SESSION.identity==1}">
                    <li><a  data-toggle="tab" data-target="#my_application" class="btn">申请房间</a></li>
                </c:if>
                <c:if test="${sessionScope.USER_SESSION.identity==2}">
                    <li><a  data-toggle="tab" data-target="#my_room" class=" btn " onclick="showMyRoomInfo()">我的房间</a></li>
                    <li><a  data-toggle="tab" data-target="#upload_file" class=" btn " onclick="showAllVideo()">上传文件</a></li>
                </c:if>
            </ul>

        </div>
        <div class="col-sm-10 u_main_body tab-content" >
            <div id="my_info" class="tab-pane fade in active">
                    <div class="uimage">
                        <%--session.USER_SESSION保存的是登录时的session，数据没有更新--%>
                        <form action="${pageContext.request.contextPath}/uploadImg.action" method="post" enctype="multipart/form-data">
                            <img alt="头像为空" src="/uploadimg/${sessionScope.USER_SESSION.user_img}" class="uimage_form_img ">
                            <p class="glyphicon glyphicon-user">修改头像</p>
                        <%--<a class="btn btn-lg btn-warning"><p>修改头像</p></a>--%>
                            <button type="submit" class="btn btn-primary"  >提交</button>
                            <input type="file" name="file">

                        </form>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="edit_customer_form">
                            <div class="form-group">
                                <label for="edit_customerName" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="edit_customerName" placeholder="用户名" name="user_name" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_customerage" class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="edit_customerage" placeholder="年龄" name="age" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_customer_form" class="col-sm-2 control-label">修改密码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="edit_customerpassword" placeholder="密码" name="password" />
                                </div>
                            </div>
                            <div class=" radio ">
                                <label>
                                    <input name="gender" type="radio" checked value="男">男
                                </label>
                                <label>
                                    <input name="gender" type="radio" value="女">女
                                </label>
                            </div>
                            <div class="modal-footer" style="text-align: center">
                                <button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
                            </div>
                        </form>
                    </div>
            </div>

            <%--<div id="my_letter" class="tab-pane fade in">
                <p>letter</p>
            </div>--%>

            <%--<div id="my_subscribe" class="tab-pane fade in">
                <ul  style="list-style-type: none;display: block">
                    <c:forEach items="${roomList}" var="room">
                        <li class="layout-cover-item col-md-3 " >
                            <div class="content-all ">
                                <div class="radius">
                                    <a href="${pageContext.request.contextPath}/openRoom?room_url=${room.room_url}&room_ownner=${room.room_ownner}" target="_blank">
                                        <div  class="room-img" style="">
                                            <img src="/uploadimg/${room.room_img}" class="img-rounded">
                                        </div>
                                        <div class="room-content" style="margin:0;padding:0">
                                            <div>
                                                <h4>${room.room_name}</h4>
                                            </div>
                                            <div style="margin:0;padding:0">
                                                <span>在线人数：${room.room_online}</span>
                                                <span>点击量：${room.room_play_count}</span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>--%>

            <div id="my_application" class="tab-pane fade in">
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_application_form" action="${pageContext.request.contextPath}/addApplication" method="post">
                        <span id="appMessage" class="text-danger ">${appMessage}</span>
                        <div class="form-group">
                            <label for="edit_customer_form" class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_application_id" placeholder="账号" name="user_code" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_customer_form" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_application_phone" placeholder="用户名" name="user_name" />
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center">
                            <button type="submit" class="btn btn-primary" >提交</button>
                        </div>
                    </form>
                </div>
            </div>

            <div id="my_room" class="tab-pane fade in form-group">
                <h3 style="text-align: center">我的房间地址:<small id="room_url"></small></h3>
                <div class="modal-body">
                    <form class="userRoom_info">
                        <div class="left col-sm-4">
                            <div class="">
                                <label for="selectclassify">所属分类</label>
                                <select class="form-control " id="selectclassify" name="selectclassify">
                                    <option value="运动">运动</option>
                                    <option value="教学">教学</option>
                                    <option value="娱乐">娱乐</option>
                                    <option value="其他">其他</option>
                                    <option value="其他">直播</option>
                                </select>
                            </div>
                            <div class="">
                                <label for="room_name" >房间名</label>
                                <input type="text" id="room_name" class="form-control " name="room_name"/>
                            </div>
                        </div>
                    </form>
                    <form  method="post" enctype="multipart/form-data" id="uploadRoomImg">
                        <div class="right col-sm-8 ">
                            <div class="uroom">
                                <label for="room_img">房间封面</label>
                                <div >
                                    <img alt="房间封面为空"id="room_img" src="" class="uroom_from_img"/>
                                </div>
                                <input  name="upload" type="button" value="上传" onclick="uploadRoomImg_File()"/>
                                <input id="roomImgfile" type="file" name="file" >
                            </div>
                        </div>
                    </form>
                    <form style="clear:both"></form>
                    <div style="clear:both;height: 10%"></div>
                    <div class="modal-footer" style="text-align: center">
                        <button type="button" class="btn btn-primary" onclick="updateRoom_info()">保存修改</button>
                    </div>


                </div>
            </div>

            <div id="upload_file" class="tab-pane fade in">
                <%--<a href="#" class="btn btn-primary" onclick="upload_File">上传</a>--%>
                <form method="post" enctype="multipart/form-data" id="uploadform">
                    <p>请选择要上传的文件：</p>
                    <input id="file" name="file" type="file"/>
                    <input id="upload" name="upload" type="button" value="上传" onclick="upload_File()"/>
                </form>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">上传文件列表</div>
                            <table class="table table-bordered table-striped">
                                <thread>
                                    <tr>
                                        <th class="col-lg-2" >编号</th>
                                        <th class="col-lg-8" >文件名</th>
                                        <th class="col-lg-2" >操作</th>
                                    </tr>
                                </thread>
                                <tbody id="video_list">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
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

    var updateCustomer=function()  {
        $.post("<%=basePath%>/update.action",$("#edit_customer_form").serialize(),function(data){
            if(data =="OK"){
                alert("客户信息更新成功！");
                window.location.reload();
            }else{
                alert("客户信息更新失败！");
                window.location.reload();
            }
        });
    }

    var upload_File=function () {
        var formData = new FormData($('#uploadform')[0]);//获取表单中第一个元素的数据，在这只有一个数据即文件
        //ajax请求
        $.ajax({
            url:"/uploadFile",//后台的接口地址
            type:"post",//post请求方式
            data:formData,//参数
            cache: false,//只有get方式有用？作用为true的话会读缓存，而不是重新到服务器获取
            processData: false,
            contentType: false,//在form中设置了enctype = “multipart/form-data”，防止冲突
            success:function (data) {
                    var video_id=data.video_id;
                    var video_name=data.video_name;
                    $("#video_list").append("<tr><td>"+video_id+"</td><td>"+video_name+"</td><td><a class='btn btn-danger btn-xs' onclick=deleteVideo(\'"+video_name+"\')>删除</a></td></tr>")

            },error:function () {
                alert("操作失败~");
            }
        })
    };

    var showAllVideo=function () {
        $.ajax({
            url:"/showAllVideo",//后台的接口地址
            type:"post",//post请求方式:参数在请求体里 常用于修改。get请求方式：参数在url，不安全， 常用于查询
            cache: false,//只有get方式有用？作用为true的话会读缓存，而不是重新到服务器获取
            processData: false,
            contentType: false,//在form中设置了enctype = “multipart/form-data”，防止冲突
            success:function (data) {
                $("#video_list").empty();//清空div的方法
                var arr=data.videoList;
                for(var i=0;i<data.videoList.length;i++){
                    var video_id=arr[i].video_id;
                    var video_name=arr[i].video_name;
                    $("#video_list").append("<tr><td>"+video_id+"</td><td>"+video_name+"</td><td><a class='btn btn-danger btn-xs' onclick=deleteVideo(\'"+video_name+"\')>删除</a></td></tr>")
                }
            },error:function () {
                alert("操作失败~");
            }
        })
    };

    /*var video_name;*/
    function deleteVideo(video_name) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/deleteVideo.action",
            data:{"video_name":video_name},
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

    var showMyRoomInfo=function()  {
        $.ajax({
            type:"get",
            url:"<%=basePath%>/showMyRoomInfo.action",
            success:function (data) {
                $("#room_url").text(data.room_url);
                $("#selectclassify").val(data.room_classify);
                $("#room_name").val(data.room_name);
                $("#room_img").attr("src","/uploadimg/"+data.room_img);
            }
        });
    }


    var uploadRoomImg_File=function () {
        var formData = new FormData($('#uploadRoomImg')[0]);//获取表单中第一个元素的数据，在这只有一个数据即文件
        //ajax请求
        $.ajax({
            url:"/uploadRoomImg.action",//后台的接口地址
            type:"post",//post请求方式
            data:formData,//参数
            cache: false,//只有get方式有用？作用为true的话会读缓存，而不是重新到服务器获取
            processData: false,
            contentType: false,//在form中设置了enctype = “multipart/form-data”，防止冲突
            success:function (data) {
                $("#room_img").attr("src","/uploadimg/"+data);

            },error:function () {
                alert("操作失败~");
            }
        })
    };

    var updateRoom_info= function() {
        $.post("<%=basePath%>/updateRoom_info.action", $(".userRoom_info").serialize(), function (data) {
            $("#room_name").val(data.room_name);
            $("#selectclassify").val(data.room_classify);
        })
    }
</script>
</body>
</html>
