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
            initVal();
		});
		function addPic(obj){
			var indexs=$('#picture_id').children('div').length+1;
		   $("#picture_id").append("<div class='controls' ><label>产品名称：</label><input  name='productNames' class='input-large-money' type='text' value='' maxlength='1000'><input type='hidden' id='image_"+indexs+"' name='imgUrls' value=''><ol id='imagePreview_"+indexs+"'><li style='list-style:none;padding-top:5px;'>无</li></ol><a href='javascript:' onclick=imageFinderOpen('image_"+indexs+"','imagePreview_"+indexs+"') class='btn'>选择</a>&nbsp;<a href='javascript:' onclick='imageDelAll(this);' class='btn'>清除</a></div>")
		}
		var imageId="image_0",imagePreviewId="imagePreview_0";
        function imageFinderOpen(obj1,obj2){//
            imageId=obj1;
            imagePreviewId=obj2;
            var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);
            var url = "/jeesite/static/ckfinder/ckfinder.html?start=images:/&action=js&func=imageSelectAction&thumbFunc=imageThumbSelectAction&cb=imageCallback&dts=1&sm=0";
            windowOpen(url,"文件管理",1000,700);
            //top.$.jBox("iframe:"+url+"&pwMf=1", {title: "文件管理", width: 1000, height: 500, buttons:{'关闭': true}});
        }
        function imageSelectAction(fileUrl, data, allFiles){
            var url="", files=ckfinderAPI.getSelectedFiles();
            for(var i=0; i<files.length; i++){//
                url += files[i].getThumbnailUrl();//
                if (i<files.length-1) url+="|";
            }//
            $("#"+imageId+"").val(url);//
            imagePreview();
            //top.$.jBox.close();
        }
        function imageThumbSelectAction(fileUrl, data, allFiles){
            var url="", files=ckfinderAPI.getSelectedFiles();
            for(var i=0; i<files.length; i++){
                url += files[i].getThumbnailUrl();
                if (i<files.length-1) url+="|";
            }//
            $("#"+imageId+"").val(url);//
            imagePreview();
            //top.$.jBox.close();
        }
        function imageCallback(api){
            ckfinderAPI = api;
        }
        function imageDel(obj){
            var url = $(obj).prev().attr("url");
            $("#"+imageId+"").val($("#"+imageId+"").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));
            imagePreview();
        }
        function imageDelAll(obj){
            $(obj).parent().remove()
        }
        function imagePreview(){
            var li, urls = $("#"+imageId+"").val().split("|");
            $("#"+imagePreviewId+"").children().remove();
            for (var i=0; i<urls.length; i++){
                if (urls[i]!=""){//
                    li = "<li><img src=\""+urls[i]+"\" url=\""+urls[i]+"\" style=\"max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;\">";//
                    li += "&nbsp;&nbsp;<a href=\"javascript:\" onclick=\"imageDel(this);\">×</a></li>";
                    $("#"+imagePreviewId+"").append(li);
                }
            }
            if ($("#"+imagePreviewId+"").text() == ""){
                $("#"+imagePreviewId+"").html("<li style='list-style:none;padding-top:5px;'>无</li>");
            }
        }
        function initVal(){
            var imgUrl=$("#imgUrl").val();
            if(imgUrl!=''){$("#picture_id .controls").html("");}
            var imgUrlJson=JSON.parse(imgUrl);
            var indexs=0;
            for(keys in imgUrlJson){
                $("#picture_id").append("<div class='controls' ><label>产品名称：</label><input  name='productNames' class='input-large-money' type='text' value='"+keys+"' maxlength='1000'><input type='hidden' id='image_"+indexs+"' name='imgUrls' value='"+imgUrlJson[keys]+"'><ol id='imagePreview_"+indexs+"'><li><img src='"+imgUrlJson[keys]+"' url='"+imgUrlJson[keys]+"' style='max-width:200px;max-height:200px;_height:200px;border:0;padding:3px;'>&nbsp;&nbsp;<a href='javascript:' onclick='imageDel(this);'>×</a></li></ol><a href='javascript:' onclick=imageFinderOpen('image_"+indexs+"','imagePreview_"+indexs+"') class='btn'>选择</a>&nbsp;<a href='javascript:' onclick='imageDelAll(this);' class='btn'>清除</a></div>");
                indexs++;
            }
        }
        function companyNameChange(){
            $("input[name='companyName']").val($("select[name='parentId'] option:selected").text());
		}
	</script>

</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/screen/escreenchil/eScreenChildred/">公司详细列表</a></li>
		<li class="active"><a href="${ctx}/screen/escreenchil/eScreenChildred/form?id=${eScreenChildred.id}">公司详细<shiro:hasPermission name="screen:escreenchil:eScreenChildred:edit">${not empty eScreenChildred.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="screen:escreenchil:eScreenChildred:edit">查看</shiro:lacksPermission></a></li>
		<li><a href="${ctx}/screen/escreenchil/eScreenChildred/uploadList">公司详细列表上传</a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="eScreenChildred" action="${ctx}/screen/escreenchil/eScreenChildred/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="imgUrl"/>
		<sys:message content="${message}"/>

		<div class="control-group">
			<label class="control-label">公司名称：</label>
			<div class="controls">
				<input type="hidden" name="companyName" value="${eScreenChildred.companyName}">
				<select name="parentId" id="parentId" class="input-xlarge " onchange="companyNameChange()">
					<option value="">请选择</option>
					<c:forEach items="${listParent}" var="item">
						<option value="${item.id}" <c:if test="${item.id==eScreenChildred.parentId}">selected</c:if>>${item.businessName}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公司服务：</label>
			<div class="controls">
				<form:input path="companyService" htmlEscape="false" maxlength="500" class="input-xlarge "/><span style="color: red">*多个词汇用逗号分隔</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公司总金额：</label>
			<div class="controls">
				<form:input path="companyAmount" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">公司描述简介：</label>
			<div class="controls">
				<form:input path="companyPersonRece" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<select name="status">
					<option value="1" <c:if test="${eScreenChildred.status=='1'}">selected</c:if> >生效</option>
					<option value="0" <c:if test="${eScreenChildred.status=='0'}">selected</c:if> >无效</option>
				</select>
			</div>
		</div>
		<div class="control-group" id="picture_id">
			<label class="control-label">公司产品：</label><a></a><a href="javascript:" onclick="addPic(this);">新增</a>
			<div class="controls" >
					<label>产品名称：</label><input id="productNames" name="productNames" class="input-large-money " type="text" value="" maxlength="1000">
					<input type="hidden" id="image_0" name="imgUrls" value="">
					<ol id="imagePreview_0"><li style="list-style:none;padding-top:5px;">无</li></ol><a href="javascript:" onclick="imageFinderOpen('image_0','imagePreview_0');" class="btn">选择</a>&nbsp;<a href="javascript:" onclick="imageDelAll(this);" class="btn">清除</a>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="screen:escreenchil:eScreenChildred:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>


</html>