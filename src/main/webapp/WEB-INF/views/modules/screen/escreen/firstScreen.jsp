<%--
  Created by IntelliJ IDEA.
  User: zhanglei
  Date: 2018/10/17
  Time: 上午9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>桃树系统首页</title>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script src="${ctxStatic}/screen/css/escreens/js/jquery-2.2.0.min.js"></script>
    <script src="${ctxStatic}/screen/css/escreens/js/prefixfree.min.js"></script>
    <style type="text/css">
        body{
            background: url(${ctxStatic}/screen/css/escreens/images/indexbj2.png) no-repeat;
            background-size: 100% 100%;
            overflow: hidden;
        }

        @keyframes rotate {
            0% {
                transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(0);
            }
            100% {
                transform: perspective(400px) rotateZ(20deg) rotateX(-40deg) rotateY(-360deg);
            }
        }
        .stars {
            transform: perspective(500px);
            transform-style: preserve-3d;
            position: absolute;
            bottom: 0;
            perspective-origin: 50% 100%;
            left: 50%;
            animation: rotate 90s infinite linear;
        }

        .star {
            width: 2px;
            height: 2px;
            background: #F7F7B6;
            position: absolute;
            top: 0;
            left: 0;
            transform-origin: 0 0 -300px;
            transform: translate3d(0, 0, -300px);
            backface-visibility: hidden;
        }
    </style>
</head>
<body>
<div class="stars"></div>
<ul class="indexfoot">
    <c:forEach items="${eScreenParentList}" var="item">
    <li>
        <a href="${ctx}/screen/escreen/eScreenParent/secondPage?parentId=${item.id}">
            <img src="${item.imgUrl}"/>
            <div>${item.businessName}</div>
        </a>
    </li>
    </c:forEach>
</ul>
</body>
<script src='${ctxStatic}/screen/css/escreens/js/stopExecutionOnTimeout.js'></script>
<script>
    $(document).ready(function () {
        var stars = 800;
        var $stars = $('.stars');
        var r = 800;
        for (var i = 0; i < stars; i++) {
            if (window.CP.shouldStopExecution(1)) {
                break;
            }
            var $star = $('<div/>').addClass('star');
            $stars.append($star);
        }
        window.CP.exitedLoop(1);
        $('.star').each(function () {
            var cur = $(this);
            var s = 0.2 + Math.random() * 1;
            var curR = r + Math.random() * 300;
            cur.css({
                transformOrigin: '0 0 ' + curR + 'px',
                transform: ' translate3d(0,0,-' + curR + 'px) rotateY(' + Math.random() * 360 + 'deg) rotateX(' + Math.random() * -50 + 'deg) scale(' + s + ',' + s + ')'
            });
        });
    });

</script>
</html>
