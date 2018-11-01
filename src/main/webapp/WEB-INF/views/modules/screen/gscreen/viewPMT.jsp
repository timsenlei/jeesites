<%--
  Created by IntelliJ IDEA.
  User: zhanglei
  Date: 2018/11/1
  Time: 上午7:39
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
    <style type="text/css">
        button {
            position: relative;
            z-index: 100;
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
            <div class="panel"><img src="${ctxStatic}/ppt/images/2271540870335_.pic_hd.jpg" alt="Image 1"/></div>
    </div>
    <button id="to-first"  onclick="homePage()">回到首页</button>
</div><!-- /container -->

</body>
</html>
