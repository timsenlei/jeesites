<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>桃树系统list</title>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/escreens/css/index.css"/>
</head>
<body>
<a href="/jeesite/b/checkscreen/query/secondPage?parentId=${parentId}&companys=${companys}" class="back"><img src="${ctxStatic}/escreens/images/back.png"/>返回</a>
<header class="header ">
    <div class="logobox fl">
        <img src="${comImgUrl}"/>
    </div>
    <div class="header_title fl">
        <h2>${comBusinessName}</h2>
        <ul class="header_list overflow">

            <c:set value="${fn:split(eScreenChildred.companyService,',')}" var="companys" />
            <c:forEach items="${companys}" var="com">
            <li>${com}</li>
            </c:forEach>
        </ul>
    </div>
    <div class="header_r fl">
        <div class="header_r1">
            <span>${eScreenChildred.companyAmount}</span>元
        </div>
        <p>${eScreenChildred.companyPersonRece}</p>
    </div>
</header>
<h2 class="titles">
    产品服务
</h2>
<ul class="details overflow">
    <c:forEach items="${productsMap}" var="map">
    <li>
        <div class="detailsimg fl">
            <img src="${map.value}"/>
        </div>
        <div class="detailstext fr">
                ${map.key}
        </div>
    </li>
    </c:forEach>
</ul>
</body>
</html>