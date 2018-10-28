<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>E屏管理</title>
	<meta name="decorator" content="default"/>
	<style>
		.input-large-money {
			width: 50px;
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
		function addMoneyTop(obj,val) {
		    if("moneyTop"==val){
                $("#moneyTopId").append("<div class='controls'><label>区域:</label><input id='regionMoneyTop' name='regionMoneyTopName' class='input-large-money ' type='text' value='' maxlength='1000'><label>占比(%):</label><input id='regionMoneyTopValue' name='regionMoneyTopValue' class='input-large-money ' type='text' value='' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
			}else if("businessTop"==val){
                $("#businessTopId").append("<div class='controls'><label>区域:</label><input id='regionBusinessName' name='regionBusinessName' class='input-large-money ' type='text' value='' maxlength='1000'><label>占比(%):</label><input id=regionBusinessValue'' name='regionBusinessValue' class='input-large-money ' type='text' value='' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
			}else if("tradeOnlineCharts"==val){
                $("#tradeOnlineChartsId").append("<div class='controls'><label>区域:</label><input id='tradeOnlineChartsName' name='tradeOnlineChartsName' class='input-large-money ' type='text' value='' maxlength='1000'><label>占比(%):</label><input id='tradeOnlineChartsValue' name='tradeOnlineChartsValue' class='input-large-money ' type='text' value='' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
            }else if("cloudSoftTop"==val){
                $("#cloudSoftTopId").append("<div class='controls'><label>区域:</label><input id='cloudSoftTopName' name='cloudSoftTopName' class='input-large-money ' type='text' value='' maxlength='1000'><label>占比(%):</label><input id='cloudSoftTopValue' name='cloudSoftTopValue' class='input-large-money ' type='text' value='' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
            }

        }
        function initVal(){
		    var regionMoneyTop=$("#regionMoneyTop").val();
		    var regionBusinessTop=$("#regionBusinessTop").val();
		    var tradeOnlineCharts=$("#tradeOnlineCharts").val();
		    var cloudSoftTop=$("#cloudSoftTop").val();

            if(regionMoneyTop!=''){$("#moneyTopId .controls").html("");}
            if(regionBusinessTop!=''){ $("#businessTopId .controls").html("");  }
            if(tradeOnlineCharts!=''){$("#tradeOnlineChartsId .controls").html(""); }
            if(cloudSoftTop!=''){ $("#cloudSoftTopId .controls").html(""); }
            var regionBusinessTopJson=JSON.parse(regionBusinessTop);
            var tradeOnlineChartsJson=JSON.parse(tradeOnlineCharts);
            var cloudSoftTopJson=JSON.parse(cloudSoftTop);
            var regionMoneyTopJson=JSON.parse(regionMoneyTop);

            for(keys in regionBusinessTopJson){
                $("#businessTopId").append("<div class='controls'><label>区域:</label><input id='regionBusinessName' name='regionBusinessName' class='input-large-money ' type='text' value='"+keys+"' maxlength='1000'><label>占比(%):</label><input id=regionBusinessValue'' name='regionBusinessValue' class='input-large-money ' type='text' value='"+regionBusinessTopJson[keys]+"' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
            }
            for(keys in tradeOnlineChartsJson){
                $("#tradeOnlineChartsId").append("<div class='controls'><label>区域:</label><input id='tradeOnlineChartsName' name='tradeOnlineChartsName' class='input-large-money ' type='text' value='"+keys+"' maxlength='1000'><label>占比(%):</label><input id='tradeOnlineChartsValue' name='tradeOnlineChartsValue' class='input-large-money ' type='text' value='"+tradeOnlineChartsJson[keys]+"' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
            }
            for(keys in cloudSoftTopJson){
                $("#cloudSoftTopId").append("<div class='controls'><label>区域:</label><input id='cloudSoftTopName' name='cloudSoftTopName' class='input-large-money ' type='text' value='"+keys+"' maxlength='1000'><label>占比(%):</label><input id='cloudSoftTopValue' name='cloudSoftTopValue' class='input-large-money ' type='text' value='"+cloudSoftTopJson[keys]+"' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
            }
            for(keys in regionMoneyTopJson){
                $("#moneyTopId").append("<div class='controls'><label>区域:</label><input id='regionMoneyTop' name='regionMoneyTopName' class='input-large-money ' type='text' value='"+keys+"' maxlength='1000'><label>占比(%):</label><input id='regionMoneyTopValue' name='regionMoneyTopValue' class='input-large-money ' type='text' value='"+regionMoneyTopJson[keys]+"' maxlength='1000'><a href='###' onclick='deleteRe(this)'>删除</a></div>");
            }
		}
		function deleteRe(obj) {
		   $(obj).parent().remove()
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/screen/gScreen/">E屏列表</a></li>
		<li class="active"><a href="${ctx}/screen/gScreen/form?id=${gScreen.id}">E屏<shiro:hasPermission name="screen:gScreen:edit">${not empty gScreen.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="screen:gScreen:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gScreen" action="${ctx}/screen/gScreen/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="regionMoneyTop"/>
		<form:hidden path="regionBusinessTop"/>
		<form:hidden path="tradeOnlineCharts"/>
		<form:hidden path="cloudSoftTop"/>

		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">模板名称：</label>
			<div class="controls">
				<form:input path="templateName" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">全球注册用户：</label>
			<div class="controls">
				<form:input path="consumerSum" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">注册企业：</label>
			<div class="controls">
				<form:input path="enterpriseSum" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">平台累计发包金额：</label>
			<div class="controls">
				<form:input path="sumOfMoney" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" id="moneyTopId" >
			<label class="control-label" >区域累计签约金额top6：</label><a href="###" onclick="addMoneyTop(this,'moneyTop')">新增</a>
			<div class="controls">
				<label>区域:</label><input id="regionMoneyTopName" name="regionMoneyTopName" class="input-large-money " type="text" value="" maxlength="1000"><label>占比(%):</label><input id="regionMoneyTopValue" name="regionMoneyTopValue" class="input-large-money " type="text" value="" maxlength="1000">
				<a href="###" onclick="deleteRe(this)">删除</a>
			</div>
		</div>
		<div class="control-group" id="businessTopId">
			<label class="control-label" >区域线上商家数量top6：</label><a href="###" onclick="addMoneyTop(this,'businessTop')">新增</a>
			<div class="controls">
				<label>区域:</label><input id="regionBusinessName" name="regionBusinessName" class="input-large-money " type="text" value="" maxlength="1000"><label>占比(%):</label><input id="regionBusinessValue" name="regionBusinessValue" class="input-large-money " type="text" value="" maxlength="1000"><a href="###" onclick="deleteRe(this)">删除</a>
			</div>
		</div>
		<div class="control-group" id="tradeOnlineChartsId">
			<label class="control-label">线上交易服务类型排行榜：</label><a href="###" onclick="addMoneyTop(this,'tradeOnlineCharts')">新增</a>
            <div class="controls">
                <label>区域:</label><input id="tradeOnlineChartsName" name="tradeOnlineChartsName" class="input-large-money " type="text" value="" maxlength="1000"><label>占比(%):</label><input id="tradeOnlineChartsValue" name="tradeOnlineChartsValue" class="input-large-money " type="text" value="" maxlength="1000"><a href="###" onclick="deleteRe(this)">删除</a>
            </div>
		</div>
		<div class="control-group" id="cloudSoftTopId">
			<label class="control-label">云上软件园入驻商家top6：</label><a href="###" onclick="addMoneyTop(this,'cloudSoftTop')">新增</a>
            <div class="controls">
                <label>区域:</label><input id="cloudSoftTopName" name="cloudSoftTopName" class="input-large-money " type="text" value="" maxlength="1000"><label>占比(%):</label><input id="cloudSoftTopValue" name="cloudSoftTopValue" class="input-large-money " type="text" value="" maxlength="1000"><a href="###" onclick="deleteRe(this)">删除</a>
            </div>
		</div>
        <div class="control-group">
            <label class="control-label">核心服务地区分布：</label>
            <div class="controls">
                <form:textarea path="coreArea" htmlEscape="false" maxlength="1000" class="textarea-xlarge "/><span style="color: red">*多个词汇用逗号分隔</span>
            </div>
        </div>
		<div class="control-group">
			<label class="control-label">搜索热词：</label>
			<div class="controls">
				<form:textarea path="searchHotWords" htmlEscape="false" maxlength="1000" class="textarea "/><span style="color: red">*多个词汇用逗号分隔</span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="screen:gScreen:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>