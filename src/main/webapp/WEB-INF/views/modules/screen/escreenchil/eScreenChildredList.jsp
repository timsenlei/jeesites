<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公司详细管理</title>
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
		<li class="active"><a href="${ctx}/screen/escreenchil/eScreenChildred/">公司详细列表</a></li>
		<shiro:hasPermission name="screen:escreenchil:eScreenChildred:edit"><li><a href="${ctx}/screen/escreenchil/eScreenChildred/form">公司详细添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="eScreenChildred" action="${ctx}/screen/escreenchil/eScreenChildred/" method="post" class="breadcrumb form-search">
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
				<th>公司名称</th><th>公司服务</th><th>公司金额</th><th>公司描述</th><th>公司产品</th>
				<shiro:hasPermission name="screen:escreenchil:eScreenChildred:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="eScreenChildred">
			<tr>
				<td>${eScreenChildred.companyName}</td><td>${eScreenChildred.companyService}</td><td>${eScreenChildred.companyAmount}</td><td>${eScreenChildred.companyPersonRece}</td><td>${eScreenChildred.companyProduct}</td>
				<shiro:hasPermission name="screen:escreenchil:eScreenChildred:edit"><td>
    				<a href="${ctx}/screen/escreenchil/eScreenChildred/form?id=${eScreenChildred.id}">修改</a>
					<a href="${ctx}/screen/escreenchil/eScreenChildred/delete?id=${eScreenChildred.id}" onclick="return confirmx('确认要删除该公司详细吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>