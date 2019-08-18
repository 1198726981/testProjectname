<%--
  Created by IntelliJ IDEA.
  User: walse
  Date: 2019/3/15
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap/css/application.css" >
</head>
<body>

<div class="onepage">
    <div class="onepage-bg" id="onepagebg"></div>
    <div class="container">
            <div class="row">
                <div class="title-text">
                    <div class="col-md-12 headfontsize">
                        <h1 class="headh1content">
                            斗鱼<br>
                        </h1>
                        <p style="margin-top: 50px;line-height: 33px;margin-left: 10px">精彩都在这里<br>相信自己</p>
                        <p class="btn-app-store">
                            <a class="btn btn-success btn-lg" href="">立即注册</a>
                        </p>
                    </div>
                </div>
            </div>
    </div>
</div>

<div class="twopage">
    <div class="twopage-text">
        <h1 class="twopage-text-h1">
            选择分类房间进行观看<img src="img/click_64px.png">
        </h1>
    </div>
    <div class="row" style="height: 410px">
        <div class="twopage-courses col-md-4">
            <a href="">
                <img src="img/sport.jpg" style="width: 100%">
                <div class="classicon">
                    <h3>运动</h3>
                    <h1><strong>列表</strong></h1>
                </div>
            </a>
        </div>
        <div class="twopage-courses col-md-4">
            <a href="">
                <img src="img/study.jpeg" style="width: 100%">
                <div class="classicon">
                    <h3>学习</h3>
                    <h1><strong>列表</strong></h1>
                </div>
            </a>
        </div>
        <div class="twopage-courses col-md-4">
            <a href="">
                <img src="img/entertainment.jpg" style="width: 100%">
                <div class="classicon">
                    <h3>娱乐</h3>
                    <h1><strong>列表</strong></h1>
                </div>
            </a>
        </div>
    </div>
    <div class="twopagebtn">
        <a id="twopage-easy" href="" class="btn btn-success btn-lg">点击这里分类</a>
    </div>
</div>

<div class="threepage">
    <div class="threepage-bg" id="threepagebg">
        <div class="threepagecontent">
            <div class="threepagetext">
                <h1>为什么要学习变成思想</h1>
                <p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb</p>
            </div>
            <a href="" class="btn btn-success btn-lg threepagebtncontent">快速注册</a>
        </div>
    </div>
</div>

<div class="fourpage">
    <div class="container">
        <div class="coursexingqing-text">
            <h1>要干活，不许工具要到位</h1>
            <p>怎么才能做到快速学习</p>
        </div>
        <%--data-interval="5000"5秒滑动一次--%>
        <%--data-target通过id来索引--%>
        <div id="carousel-example-generic" class="carousel slide" data-interval="5000" style="height:300px">
            <ol class="carousel-indicators" style="margin-top: 200px;">
                <li data-target="#carousel-example-generic" data-slide="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide="1" ></li>
                <li data-target="#carousel-example-generic" data-slide="2" ></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active" style="width:500px">
                    <img src="img/study.jpeg">
                </div>

            </div>
            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                <span class="glyphicon glyphicon-align-left"></span>
            </a>
            <a class="right carousel  -control" href="#carousel-example-generic" data-slide="next">
                <span class="glyphicon glyphicon-align-right"></span>
            </a>
        </div>
    </div>
</div>
<%--<script type="text/javascript" src="bootstrap/jq/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/Carousel.js"></script>--%>
</body>
</html>
