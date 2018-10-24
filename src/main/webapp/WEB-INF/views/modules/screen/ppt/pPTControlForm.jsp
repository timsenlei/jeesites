<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>PPT管理</title>
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
		<li><a href="${ctx}/screen/ppt/pPTControl/">PPT列表</a></li>
		<li class="active"><a href="${ctx}/screen/ppt/pPTControl/form?id=${pPTControl.id}">PPT<shiro:hasPermission name="screen:ppt:pPTControl:edit">${not empty pPTControl.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="screen:ppt:pPTControl:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="pPTControl" action="${ctx}/screen/ppt/pPTControl/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">屏幕：</label>
			<div class="controls">
				<select name="whichScreen">
					<option value="A" <c:if test="${pPTControl.whichScreen=='A'}">selected</c:if>>A屏</option>
					<option value="B" <c:if test="${pPTControl.whichScreen=='B'}">selected</c:if>>B屏</option>
					<option value="E" <c:if test="${pPTControl.whichScreen=='E'}">selected</c:if>>E屏</option>
					<option value="F" <c:if test="${pPTControl.whichScreen=='F'}">selected</c:if>>F屏</option>
					<option value="G" <c:if test="${pPTControl.whichScreen=='G'}">selected</c:if>>G屏</option>
					<option value="K" <c:if test="${pPTControl.whichScreen=='K'}">selected</c:if>>K屏</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">控制台文字：</label>
			<div class="controls">
				<form:input path="controlword" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">PPT图片：</label>
			<div class="controls">
				<input type="hidden" id="image" name="imgurl" value="${pPTControl.imgurl}" />
				<sys:ckfinder input="image" type="thumb" uploadPath="/cms/article" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">使用状态：</label>
			<div class="controls">
				<select name="status">
					<option value="1" <c:if test="${pPTControl.status=='1'}">selected</c:if>>使用中</option>
					<option value="0" <c:if test="${pPTControl.status=='0'}">selected</c:if>>未使用</option>
				</select>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="screen:ppt:pPTControl:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>