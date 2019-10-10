<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我是乐清人，我接力！清明祭扫，不烧纸钱不放鞭炮……</title>
<script src="js/meta.js"></script>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/memorial.css">
<script src="js/jquery.min.js"></script>
<!--  <script src="js/memorial.js"></script>-->
</head>
<body>
<div class="wrap">
    <ul class="tabUl">
        <li class="tabli fl">
            <img class="verticl" src="images/01.png" alt=""  onClick="javascript:location.href='http://v.yqcn.com/bmwj/asp/h5/gt31/index.asp'">
            <img class="smallImg" src="images/03.jpg" alt="">
        </li>
        <li class="liner"></li>
        <li class="tabli fr">
            <img class="verticl" src="images/02.png" alt="">
            <img class="smallImg" src="images/04.png" alt="">
        </li>
    </ul>

    <!--1-->
    <div class="main1" id="commitShow1">
        <div class="container1">
            <ul>
                <li class="formLi center">
                    <img src="images/06.png" alt="">
                </li>
                <li class="formLi center">
                    <img class="vertical" src="images/07.png" alt="">
                    <span class="flower">鲜花</span>
                </li>
                <li class="formLi">
                    <span class="merLeft">祭奠对象：</span>
                    <input type="text" id="merObkect" class="merObject">
                </li>
                <li class="formLi">
                    <span class="merLeft">祭奠人：</span>
                    <input type="text" id="merMan" class="merObject">
                </li>
                <li class="formLi empty"></li>
            </ul>
            <div class="btn" id="commitY">确认提交</div>
        </div>
    </div>
    <!--2-->
    <div class="main1 main2" id="commitShow2">
        <div class="container1">
            <div class="rightTopInfo">转发呼唤更多亲友追思</div>
            <div class="title">
                亲爱的<span class="name"></span>
            </div>
            <div class="empInfo">

            </div>
            <span class="come">到访追思：</span>
            <div class="flowsValue">
                <div class="letFlow">
                    <img class="flowImgTop" src="images/08.png" alt="">
                    <span class="flowFt">献花</span>
                </div>
                <input type="text" class="rightValue">
            </div>
            <div class="lineEmp">
                <span class="fr">发起人：<span class="Launch"></span></span>
            </div>
        </div>
    </div>

    <footer class="fixedMain">
        <div class="mymemor">
            <img src="images/05.png" alt="" onClick="javascript:location.href='index4.jsp'">
        </div>
        <img class="logo" src="images/logo.png" alt="">
    </footer>
</div>
</body>
</html>