<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>云集</title>
    <link rel="stylesheet" href="${ctxStatic}/pptcontrol/css/index.css" />
    <script type="text/javascript">
        function homePage(){
            jsObject.homePage();
        }
        function prePage(){
            jsObject.prePage();
        }
        function nextPage(){
            jsObject.nextPage();
        }
    </script>
</head>
<body>
<h1 class="title">
    <img src="${ctxStatic}/pptcontrol/images/jiefanghao.png"/>${pPTControl.controlword}
</h1>
<section class="overflow section1 ">

    <hgroup class="page4">
        <a href="javascript:void(0)" class="pagea" onclick="prePage()">
            <img src="${ctxStatic}/pptcontrol/images/back2.png"/>
            <h4 class="text3" >上一步</h4>
        </a>
    </hgroup>
    <hgroup class="page4">
        <a href="javascript:void(0)" class="pagea" onclick="nextPage()">
            <img src="${ctxStatic}/pptcontrol/images/back3.png"/>
            <h4 class="text3" >下一步</h4>
        </a>
    </hgroup>
    <hgroup class="page4" style="margin-right: 0;    padding: 34px 38px 0;">
        <a href="javascript:void(0)" class="pagea" onclick="homePage()">
            <img src="${ctxStatic}/pptcontrol/images/back4.png"/>
            <h4 class="text3" >返回首页</h4>
        </a>
    </hgroup>

</section>
</body>
</html>