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
		<li class="active"><a href="${ctx}/screen/escreen/eScreenParent/">G屏列表</a></li>
		<li><a href="${ctx}/screen/escreen/eScreenParent/form">G屏添加</a></li>
		<li><a href="${ctx}/screen/escreen/eScreenParent/firstPage">预览</a></li>
	</ul>
	<form:form id="searchForm" modelAttribute="eScreenParent" action="${ctx}/screen/escreen/eScreenParent/" method="post" class="breadcrumb form-search">
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
				<th>名称</th><th>所属上级</th><th>是否为父节点</th><th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eScreenParent">
			<tr>
				<td>${eScreenParent.businessName}</td>

				<td>${eScreenParent.parent.id}</td>
				<td><c:if test="${eScreenParent.ifIsParent=='0'}">否</c:if><c:if test="${eScreenParent.ifIsParent=='1'}">是</c:if></td>
				<td>
    				<a href="${ctx}/screen/escreen/eScreenParent/form?id=${eScreenParent.id}">修改</a>
					<a href="${ctx}/screen/escreen/eScreenParent/delete?id=${eScreenParent.id}" onclick="return confirmx('确认要删除该E屏吗？', this.href)">删除</a>

				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>