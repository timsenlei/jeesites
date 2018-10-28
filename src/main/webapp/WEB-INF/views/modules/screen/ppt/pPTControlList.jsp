<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>PPT管理</title>
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
		<li class="active"><a href="${ctx}/screen/ppt/pPTControl/">PPT列表</a></li>
		<shiro:hasPermission name="screen:ppt:pPTControl:edit"><li><a href="${ctx}/screen/ppt/pPTControl/form">PPT添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="pPTControl" action="${ctx}/screen/ppt/pPTControl/" method="post" class="breadcrumb form-search">
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
				<th>所属屏幕</th>
				<th>控制台文字</th>
				<th>使用状态</th>

				<shiro:hasPermission name="screen:ppt:pPTControl:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="pPTControl">
			<tr>
				<td>${pPTControl.whichScreen}</td>
				<td>${pPTControl.controlword}</td>
				<td><c:if test="${pPTControl.status=='1'}">使用中</c:if></td>

				<shiro:hasPermission name="screen:ppt:pPTControl:edit"><td>
    				<a href="${ctx}/screen/ppt/pPTControl/form?id=${pPTControl.id}">修改</a>
    				<a href="${ctx}/screen/ppt/pPTControl/updateIng?id=${pPTControl.id}&whichScreen=${pPTControl.whichScreen}">设置使用中</a>
					<a href="${ctx}/screen/ppt/pPTControl/preControl?id=${pPTControl.id}&type=1">预览控制台</a>
					<a href="${ctx}/screen/ppt/pPTControl/preControl?id=${pPTControl.id}&type=2">预览PPT</a>
					<a href="${ctx}/screen/ppt/pPTControl/delete?id=${pPTControl.id}" onclick="return confirmx('确认要删除该PPT吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>