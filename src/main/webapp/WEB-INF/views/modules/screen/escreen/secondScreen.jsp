<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhanglei
  Date: 2018/10/17
  Time: 上午9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>桃树系统list1</title>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/screen/css/escreens/css/index.css"/>
</head>
<body>
<a href="${ctx}/screen/escreen/eScreenParent/firstPage" class="back"><img src="${ctxStatic}/screen/css/escreens/images/back.png"/>返回</a>
<h1 class="title">
    <img src="${entity.imgUrl}"/>${entity.businessName}   <span>54881个</span>
</h1>
<ul class="section1 overflow">
    <c:forEach items="${eScreenParentList}" var="item">
    <li>
        <a href="${ctx}/screen/escreen/eScreenParent/thirdPage?imgUrl=${item.imgUrl}&parentId=${entity.id}&businessName=${item.businessName}&id=${item.id}">
            <img src="${item.imgUrl}" class="fl"/>
            <div class="fr">${item.businessName}</div>
        </a>
    </li>
    </c:forEach>
</ul>
</body>
</html>
