<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: zhanglei
  Date: 2018/10/17
  Time: 上午9:09
  To change this template use File | Settings | File Templates.
--%>
<head>
    <meta charset="UTF-8">
    <title>桃树系统list1</title>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/escreens/css/index.css"/>
</head>
<body>
<a href="/jeesite/b/checkscreen/query/firstPage" class="back"><img src="${ctxStatic}/escreens/images/back.png"/>返回</a>
<h1 class="title">
    <img src="${entity.imgUrl}"/>${entity.businessName}   <span>${companys}个</span>
</h1>
<ul class="section1 overflow">
    <c:forEach items="${eScreenParentList}" var="item">
    <li>
        <a href="/jeesite/b/checkscreen/query/thirdPage?imgUrl=${item.imgUrl}&parentId=${entity.id}&businessName=${item.businessName}&id=${item.id}&companys=${companys}">
            <img src="${item.imgUrl}" class="fl"/>
            <div class="fr">${item.businessName}</div>
        </a>
    </li>
    </c:forEach>
</ul>
</body>
</html>
