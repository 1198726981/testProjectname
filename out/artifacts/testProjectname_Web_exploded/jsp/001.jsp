<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/17
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <li <%--class="active"--%>><a href="#">link</a></li>
                    <li><a href="">link</a></li>
                    <li><a href="">link</a></li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="搜索">
                        <button type="submit" class="btn btn-default">搜索</button>
                    </div>
                </form>

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="">关注</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类<span class="caret"></span> </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">运动</a></li>
                            <li><a href="#">教学</a></li>
                            <li><a href="#">娱乐</a></li>
                            <li><a href="#">其它</a></li>
                        </ul>
                    </li>
                    <li >
                        <%--<a href="#" class="btn btn-default " data-toggle="modal" data-target="#userDialog"  id="userbutton" >用户</a>--%>
                        <a href="#" class="dropdown-toggle hidden" data-toggle="dropdown" id="userlist" >用户<span class="caret"></span> </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="#">退出</a></li>
                        </ul>
                    </li>
                    <%--<li >
                        <a href="#" class="dropdown-toggle hidden" data-toggle="dropdown" id="anchorlist" >主播<span class="caret"></span> </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="#">房间信息</a></li>
                            <li><a href="#">退出</a></li>
                        </ul>
                    </li>--%>
                    <li >
                        <a href="#" class="dropdown-toggle hidden" data-toggle="dropdown" id="adminlist" >管理员<span class="caret"></span> </a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">管理信息</a></li>
                            <li><a href="#">退出</a></li>
                        </ul>
                    </li>
                    <li  >
                        <%--data-toggle作用为启用模态框，data-target作用为弹出框的内容,需引入jq和js文件--%>
                        <a href="#" class="btn btn-default" data-toggle="modal" data-target="#loginCustomerDialog" id="loginbutton">登录</a>
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
                    <h4 class="modal-title" id="myModalLabel">登录客户</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="new_customer_form">
                        <div class="form-group">
                            <label for="new_customerName" class="col-sm-2 control-label">
                                客户名称
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_customerName" placeholder="客户名称" name="cust_name" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="loginsuccess();" data-dismiss="modal">确认登录</button>

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
                    <h4 class="modal-title" id="myModalLabe2">新建客户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="new_customer_form2">
                        <div class="form-group">
                            <label for="new_customerName" class="col-sm-2 control-label">
                                客户名称
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_customerName2" placeholder="客户名称" name="cust_name" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" <%--onclick="createCustomer()"--%>>确认注册</button>

                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid row" style="padding-top: 68px;">
        <div class="left col-md-8">
            <div class="left-title">
                <div class="title-img col-md-2">
                    <picture>
                        <img src="../img/timg.jpg">
                    </picture>
                </div>
                <div class="title-info col-md-6">
                    <div class="title-roomname " >
                        <h3 style="margin-top: 0">房间名</h3>
                    </div>
                    <div class="classify ">
                        <h5 >房间分类</h5>
                    </div>
                    <div class="user ">
                        <h5>用户</h5>
                    </div>
                </div>
                <div class="subscribe col-md-4 ">
                    <button class="btn btn-danger btn-lg ">关注</button>
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
            <div class="video-list" style="height: 15%">
                <ul>
                    <%--data-src为自定义属性，--%>
                    <li><a class="dj" href="javascript:"  onclick="changesrc('/video/movie.mp4')"  >第一个</a></li>
                    <li><a class="dj" href="javascript:"  onclick="changesrc('/video/mov_bbb.mp4')" >第二个</a></li>
                </ul>
            </div>
            <div class="chat-room" style="height: 55%">

            </div>
            <div class="chat-editor" style="height: 10%">
                <form class="navbar-form navbar-left " role="presentation">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="这里输入聊天内容">
                        <button type="submit" class="btn btn-default">发送</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>



<script type="text/javascript" src="../bootstrap/jq/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
var changesrc=function(vsrc){
    document.getElementById("videoid").src=vsrc;
    document.getElementById("videoid").play();
}


var loginsuccess= function(){
    $("#userlist").removeClass("hidden");
    $("#anchorlist").removeClass("hidden");
    $("#adminlist").removeClass("hidden");
    $("#loginbutton").attr("class","hidden");
    /*window.location.reload();*/
}
</script>
</body>
</html>
