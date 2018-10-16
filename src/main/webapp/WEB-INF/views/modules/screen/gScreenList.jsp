<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>G屏管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/screen/gScreen/">G屏列表</a></li>
		<shiro:hasPermission name="screen:gScreen:edit"><li><a href="${ctx}/screen/gScreen/form">G屏添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gScreen" action="${ctx}/screen/gScreen/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>模板名称</th><th>全球注册用户</th><th>注册企业</th><th>累计发包金额</th><th>区域累计签约金额</th><th>线上商家数量</th><th>服务地区分布</th><th>当前模板</th><shiro:hasPermission name="screen:gScreen:edit"><th>操作</th></shiro:hasPermission>
			</tr>

		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gScreen">
			<tr>
				<td>${gScreen.templateName}</td>
				<td>${gScreen.consumerSum}</td>
				<td>${gScreen.enterpriseSum}</td>
				<td>${gScreen.sumOfMoney}</td>
				<td>${gScreen.regionMoneyTop}</td>
				<td>${gScreen.tradeOnlineCharts}</td>
				<td>${gScreen.coreArea}</td>
				<td style="color: red"><c:if test="${gScreen.templateStatus=='1'}">使用中</c:if></td>
				<shiro:hasPermission name="screen:gScreen:edit"><td>
    				<a href="${ctx}/screen/gScreen/form?id=${gScreen.id}">修改</a>|
					<a href="${ctx}/screen/gScreen/delete?id=${gScreen.id}" onclick="return confirmx('确认要删除吗？', this.href)">删除</a>|
					<a href="${ctx}/screen/gScreen/useThisTem?id=${gScreen.id}" onclick="return confirmx('确认要要使用当前模板么？', this.href)">置为使用中</a>|
					<a href="${ctx}/screen/gScreen/preLook?id=${gScreen.id}">预览</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>