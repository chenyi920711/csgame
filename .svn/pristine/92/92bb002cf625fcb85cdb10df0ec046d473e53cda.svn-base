<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>游戏模式列表</title>
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
		<li><a href="${ctx}/gmoduleinfo/gamemodutype/">游戏模式列表</a></li>
		<li class="active"><a href="${ctx}/gmoduleinfo/gamemodutype/form?id=${gamemodutype.id}">模式管理<shiro:hasPermission name="gmoduleinfo:gamemodutype:edit">${not empty gamemodutype.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gmoduleinfo:gamemodutype:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gamemodutype" action="${ctx}/gmoduleinfo/gamemodutype/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">模式名称：</label>
			<div class="controls">
				<form:input path="gamemname" htmlEscape="false" maxlength="66" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">模式类型：</label>
			<div class="controls">
				<form:select path="gamemtype" htmlEscape="false" >
					<form:option value="HP">血量</form:option>
					<form:option value="peocount">小队人数</form:option>
					<form:option value="attack">伤害</form:option>
				</form:select>
<%-- 				<form:input path="gamemtype" htmlEscape="false" maxlength="22" class="input-xlarge required"/> --%>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
<%-- 		<div class="control-group">
			<label class="control-label">结算排序：</label>
			<div class="controls">
				<form:input path="gamemcount" htmlEscape="false" value="high" maxlength="10" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">创建门店：</label>
			<div class="controls">
				<form:input path="remarkshop" value="${fns:getUser().company.id}" htmlEscape="false" maxlength="35" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建人：</label>
			<div class="controls">
				<form:input path="remarkman" value="${fns:getUser().name}" htmlEscape="false" maxlength="30" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="gmoduleinfo:gamemodutype:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>