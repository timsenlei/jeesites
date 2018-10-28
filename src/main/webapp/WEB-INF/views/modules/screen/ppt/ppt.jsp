<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/28 0028
  Time: 下午 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/ppt/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/ppt/css/lrtk.css" />
    <script src="${ctxStatic}/ppt/js/modernizr.custom.js"></script>
    <style type="text/css">
        button {
            position: relative;
            z-index: 100;
        }
        #alertbox,#alertbox1{
            display: none;
            width: 360px;
            height: 100px;
            position: fixed;
            z-index: 10000000;
            top: 50%;
            left: 50%;
            background: rgba(0,0,0,0.8);
            text-align: center;
            line-height: 100px;
            margin-left: -180px;
            margin-top: -50px;
            color: #fff;
            border-radius: 10px;
            font-size: 30px;
            box-shadow: 0 0 30px  #fff;
        }
        .boxgallery > nav span,button{
            display: none;
        }
    </style>

</head>
<body>
<div class="container">
    <!-- Top Navigation -->
    <div id="boxgallery" class="boxgallery" data-effect="effect-1">
        <c:set value="${fn:split(pPTControl.imgurl,'|') }" var="ths"></c:set>
        <c:forEach items="${ths}" var="item">
            <div class="panel"><img src="${item}" alt="Image 1"/></div>
        </c:forEach>
    </div>
    <button id="to-first"  onclick="homePage()">回到首页</button>
</div><!-- /container -->

<div id="alertbox">

    已经是第一页了哦！

</div>
<div id="alertbox1">这是最后一页了哦！</div>

<script src="${ctxStatic}/ppt/js/jquery-2.2.0.min.js"></script>
<script src="${ctxStatic}/ppt/js/classie.js"></script>
<script src="${ctxStatic}/ppt/js/boxesfx.js"></script>

<script>
    var newSwiper = new BoxesFx( document.getElementById( 'boxgallery' ) );
    function prePage(){
        newSwiper._navigate('prev')
    }
    function nextPage(){
        newSwiper._navigate('next')
    }
    function homePage(){
        newSwiper._navigate('home')

        if(!$("#alertbox").is(":hidden")){
            setTimeout(function() {
                $("#alertbox").hide("slow")
            }, 1500)
        }
    }

    $(window).keydown(function(e){
        if(e.keyCode==38){//上
            prePage()
        }
        if(e.keyCode==40){//下
            nextPage()
        }
        if(e.keyCode==32){//空格
            homePage()
        }
    })
</script>
</body>
</html>
