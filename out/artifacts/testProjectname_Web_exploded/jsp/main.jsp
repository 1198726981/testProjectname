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
                <li <%--class="active"--%>><a href="#">link</a></li>
                <li><a href="">link</a></li>
                <li><a href="">link</a></li>
            </ul>
            <form class="navbar-form navbar-left" role="search" action="/showSelectRoom">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索" name="queryText">
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
                    <c:if test="${sessionScope.USER_SESSION!=null}" >
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" id="userlist" >用户<span class="caret"></span> </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout.action">退出</a></li>
                    </ul>
                    </c:if>
                </li>
                <li >
                    <c:if test="${sessionScope.USER_SESSION!=null}" >
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" id="adminlist" >管理员<span class="caret"></span> </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">管理信息</a></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                    </c:if>
                </li>
                <li  >
                    <c:if test="${sessionScope.USER_SESSION==null}" >
                    <%--data-toggle作用为启用模态框，data-target作用为弹出框的内容,需引入jq和js文件--%>
                    <a href="#" class="btn btn-default" data-toggle="modal" data-target="#loginCustomerDialog" id="loginbutton">登录</a>
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
                <form class="form-horizontal" id="login_user"  method="post" >
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
                <c:forEach items="${roomList}" var="room">
                    <li class="layout-cover-item col-md-3 " >
                        <div class="content-all ">
                            <div class="radius">
                                <a href="${room.room_url}" target="_blank">
                                    <div  class="room-img">
                                        <img src="/uploadimg/${room.room_img}" class="img-rounded">
                                    </div>
                                    <div class="room-content">
                                        <div>
                                            <h3>${room.room_name}</h3>
                                        </div>
                                        <div>
                                            <span>${room.room_online}</span>
                                            <span>${room.room_play_count}</span>
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
                    <li><a href="#">&laquo</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">&raquo</a></li>
                </ul>
            </div>
        </div>



    </div>
</div>



<script type="text/javascript" src="../bootstrap/jq/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var loginsuccess= function() {
        $.post("<%=basePath%>/login.action", $("#login_user").serialize(), function (data) {
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

<%--

<a href="#" class="btn btn-primary" data-toggle="modal"
   data-target="#newCustomerDialog" onclick="clearCustomer()">新建</a>

<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建客户信息</h4>
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
                    <div class="form-group">
                        <label for="new_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_customerFrom" name="cust_source">
                                <option value="">--请选择--</option>
                                <c:forEach items="${fromType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}">selected</c:if>>
                                            ${item.dict_item_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_custIndustry"  name="cust_industry">
                                <option value="">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>
                                            ${item.dict_item_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_custLevel" name="cust_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_linkMan" placeholder="联系人" name="cust_linkman" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_phone" placeholder="固定电话" name="cust_phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_mobile" placeholder="移动电话" name="cust_mobile" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_zipcode" placeholder="邮政编码" name="cust_zipcode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_address" placeholder="联系地址" name="cust_address" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createCustomer()">创建客户</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
//清空新建客户窗口中的数据
	function clearCustomer() {
	    $("#new_customerName").val("");
	    $("#new_customerFrom").val("")
	    $("#new_custIndustry").val("")
	    $("#new_custLevel").val("")
	    $("#new_linkMan").val("");
	    $("#new_phone").val("");
	    $("#new_mobile").val("");
	    $("#new_zipcode").val("");
	    $("#new_address").val("");
	}
	// 创建客户
	//POST - 向指定的资源提交要处理的数据，通过jQuery Ajax的post请求将id为new_customer_form的表单序列化，
	//然后提交到/create.action的请求，function():定义请求成功时执行的回调的函数，data - 包含返回的来自请求的结果数据
	//？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
	//序列化后表单的数据会全连接成一串字符串，为什么到controller的方法是customer对象
	function createCustomer() {
	$.post("<%=basePath%>customer/create.action",
	$("#new_customer_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("客户创建成功！");
	            window.location.reload();
	        }else{
	            alert("客户创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的客户信息
	//$.ajax() 方法通过 HTTP 请求加载远程数据,简单易用的高层实现为 $.get, $.post，ajax方法为底层实现
	//第一个data，类型：String，发送到服务器的数据。将自动转换为请求字符串格式。GET 请求中将附加在 URL ，格式为Key/Value
	//第二个data - 包含返回的来自请求的结果数据:customer对象
	//？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？为什么后端controller不能返回java对象到前端
	//ajax对返回数据的要求很严格，一定要是严格的JSON数据返回才会进行success的回调，只要有一条数据不是严格的JSON格式就会调用error的回调函数，最好将查询结果封装为一个类，每次查询返回这个类，类中包含查询结果或者错误信息。
	//. Bean转换成json代码　JSONObject jsonObject = JSONObject.fromObject(new JsonBean());
	function editCustomer(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>customer/getCustomerById.action",
	        data:{"id":id},
	        //dataType:"json",
	        success:function(data) {
	        	//console.log(data);
	            $("#edit_cust_id").val(data.cust_id);
	            $("#edit_customerName").val(data.cust_name);
	            $("#edit_customerFrom").val(data.cust_source)
	            $("#edit_custIndustry").val(data.cust_industry)
	            $("#edit_custLevel").val(data.cust_level)
	            $("#edit_linkMan").val(data.cust_linkman);
	            $("#edit_phone").val(data.cust_phone);
	            $("#edit_mobile").val(data.cust_mobile);
	            $("#edit_zipcode").val(data.cust_zipcode);
	            $("#edit_address").val(data.cust_address);

	        },
	      error:function(XMLHttpRequest,textStatus,errorThrown){

	       alert("111");
	      }
	    });
	}
    // 执行修改客户操作
    //？？？？？？？？？？？？？？？？？？？？？？？？？？
    //为什么表单序列化提交到controller是提交对象
	function updateCustomer() {
		$.post("<%=basePath%>customer/update.action",$("#edit_customer_form").serialize(),function(data){
			if(data =="OK"){
				alert("客户信息更新成功！");
				window.location.reload();
			}else{
				alert("客户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除客户
	function deleteCustomer(id) {
	    if(confirm('确实要删除该客户吗?')) {
	$.post("<%=basePath%>customer/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("客户删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除客户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>--%>
