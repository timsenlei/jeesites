<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>E屏管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/screen/escreen/eScreenParent/">E屏列表</a></li>
		<li class="active"><a href="${ctx}/screen/escreen/eScreenParent/form?id=${eScreenParent.id}">E屏<shiro:hasPermission name="screen:escreen:eScreenParent:edit">${not empty eScreenParent.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="screen:escreen:eScreenParent:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="eScreenParent" action="${ctx}/screen/escreen/eScreenParent/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">图片地址：</label>
			<div class="controls">
				<form:input path="imgUrl" htmlEscape="false" maxlength="200" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="businessName" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">父节点：</label>
			<div class="controls">
				<select name="parent.id" class="input-xlarge ">
					<option value="" >无</option>
					<c:forEach items="${parents}" var="par">
						<option value="${par.id}" <c:if test="${par.id==parent.id}">selected</c:if>>${par.businessName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">是否为父节点：</label>
			<div class="controls">
				<select name="ifIsParent">
					<option value="0" <c:if test="${ifIsParent=='0'}">selected</c:if>	>否</option>
						<option value="1" <c:if test="${ifIsParent=='1'}">selected</c:if>>是</option>
				</select>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="screen:escreen:eScreenParent:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>