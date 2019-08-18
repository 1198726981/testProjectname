<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/19
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<div class="container">
    <div class="u_headr">
        <h1>个人中心</h1>
    </div>
    <div class="u_main">
        <div class="col-sm-2 u_nav"  >
            <ul style="clear: both ;" class="nav nav-pills nav-stacked">
                <li><a href="#" data-toggle="tab" data-target="#my_info" class="btn">我的资料</a></li>
                <li><a href="#" data-toggle="tab" data-target="#my_letter" class="btn">站内信</a></li>
                <li><a href="#" data-toggle="tab" data-target="#my_subscribe" class="btn">我的关注</a></li>
                <li><a href="#" data-toggle="tab" data-target="#my_application" class="btn">申请房间</a></li>
                <li><a class="disabled btn " href="#" data-toggle="tab" data-target="#my_room">我的房间</a></li>
            </ul>

        </div>
        <div class="col-sm-10 u_main_body tab-content" >
            <div id="my_info" class="tab-pane fade in active">
                <div class="uimage">
                    <form >
                        <img src="../img/sport.jpg" class="uimage_form_img ">
                        <p class="glyphicon glyphicon-user">修改头像</p>
                    <%--<a class="btn btn-lg btn-warning"><p>修改头像</p></a>--%>
                        <input type="file" >
                    </form>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_customer_form">
                        <div class="form-group">
                            <label for="edit_customer_form" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_customerName" placeholder="用户名" name="cust_name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_customer_form" class="col-sm-2 control-label">年龄</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_customerage" placeholder="年龄" name="cust_age" />
                            </div>
                        </div>
                        <div class=" radio ">
                            <label>
                                <input name="optionRadios" type="radio" checked>男
                            </label>
                            <label>
                                <input name="optionRadios" type="radio" >女
                            </label>
                        </div>
                    </form>
                    <div class="modal-footer" style="text-align: center">

                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                        <button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
                    </div>
                </div>
            </div>

            <div id="my_letter" class="tab-pane fade in">
                <p>letter</p>
            </div>

            <div id="my_subscribe" class="tab-pane fade in">
                <ul class="clearfix" style="list-style-type: none;display: block">
                    <li class="layout-cover-item col-md-3 " >
                        <div class="content-all ">
                            <div class="radius">
                                <a href="" target="_blank">
                                    <div id="" class="room-img">
                                        <img src="../img/bg.jpg" class="img-rounded">
                                    </div>
                                    <div class="room-content">
                                        <div>
                                            <h5>房间名</h5>
                                        </div>
                                        <div>
                                            <span>在线人数</span>
                                            <span>点击次数</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div id="my_application" class="tab-pane fade in">
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_application_form">
                        <div class="form-group">
                            <label for="edit_customer_form" class="col-sm-2 control-label">身份证</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_application_id" placeholder="身份证" name="cust_name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_customer_form" class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_application_phone" placeholder="手机号" name="cust_age" />
                            </div>
                        </div>
                    </form>
                    <div class="modal-footer" style="text-align: center">
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                        <button type="button" class="btn btn-primary" onclick="updateCustomer()">提交</button>
                    </div>
                </div>
            </div>

            <div id="my_room" class="tab-pane fade in">
                <p>room</p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../bootstrap/jq/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
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
