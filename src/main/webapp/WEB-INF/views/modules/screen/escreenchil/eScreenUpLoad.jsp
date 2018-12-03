<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>公司详细管理</title>
	<meta name="decorator" content="default"/>
	<style>
		.input-large-company {
			width: 80px;
		}
	</style>
	<script type="text/javascript">

	</script>

</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/screen/escreenchil/eScreenChildred/">公司详细列表</a></li>
		<li><a href="${ctx}/screen/escreenchil/eScreenChildred/form?id=${eScreenChildred.id}">公司详细<shiro:hasPermission name="screen:escreenchil:eScreenChildred:edit">${not empty eScreenChildred.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="screen:escreenchil:eScreenChildred:edit">查看</shiro:lacksPermission></a></li>
		<li  class="active"><a href="${ctx}/screen/escreenchil/eScreenChildred/uploadList">公司详细列表上传</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="eScreenChildred" action="${ctx}/screen/escreenchil/eScreenChildred/upload" method="post" enctype="multipart/form-data" class="form-horizontal">
		<div class="control-group">
			<label class="control-label">上传文件：</label>
			<div class="controls">
				<input type="file" name="file"><br/>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="screen:escreenchil:eScreenChildred:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>


</html>