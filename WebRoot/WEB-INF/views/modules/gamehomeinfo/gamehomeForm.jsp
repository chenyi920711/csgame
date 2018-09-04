<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>房间管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		$("#hpnumber").hide();
		$("#everyinjur").hide();
		$('input[type=radio][name=adjusthp]').change(function() {
		        if (this.value == '1') {
		            $("#hpnumber").hide();
		            $("#hpnumber").val("100");
		        }
		        else if (this.value == '0') {
		            $("#hpnumber").show();
		        }
		    });		
		    
		$('input[type=radio][name=havecircle]').change(function() {
		        if (this.value == '1') {
					$("#startinjur").show();
					$("#everyinjur").show();
		        }else if (this.value == '0') {
					$("#startinjur").hide();
					$("#everyinjur").hide();
		        }else if(this.value == '2'){
					$("#startinjur").show();
					$("#everyinjur").hide();		        
		        }
		    });	
		    			
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
<%-- 	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gamehomeinfo/gamehome/">房间列表</a></li>
		<li class="active"><a href="${ctx}/gamehomeinfo/gamehome/form?id=${gamehome.id}">房间<shiro:hasPermission name="gamehomeinfo:gamehome:edit">${not empty gamehome.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gamehomeinfo:gamehome:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	<form:form id="inputForm" modelAttribute="gamehome" action="${ctx}/gamehomeinfo/gamehome/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>

		<sys:message content="${message}"/>		
		<div style="text-align: center;" class="control-group">
			<span style="font-size: 18px;font-family: Microsoft Yahei;margin-top: 10%;"> 创建房间之前请先初始化房间数据 </span>
		</div>		
		<div class="control-group">
			<label class="control-label">房间名称：</label>
			<div class="controls">
				<form:input path="gromname" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div style="display:none; " class="control-group">
			<label class="control-label">所用模式：</label>
			<div class="controls">
 				<form:select path="grommodu" id="gromoduid" htmlEscape="false" class="form-control"  >
					<form:option value="0">请选择</form:option>
				</form:select>					
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<form:hidden path="createshop" htmlEscape="false" maxlength="33" value="${fns:getUser().company.id}" class="input-xlarge required"/>
		<div class="control-group">
			<label class="control-label">HP调整：</label>
			<div class="controls">
				<form:radiobutton path="adjusthp" value="0"/>开启调整
				<form:radiobutton path="adjusthp" value="1" checked="checked"/>关闭调整
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div id="hpnumber" class="control-group">
			<label class="control-label">HP数值：</label>
			<div class="controls">
				<form:input type="number" value="100" path="peohp" htmlEscape="false" maxlength="11" class="input-xlarge" required="required" />
			</div>
		</div>
		<div style="display: none;" class="control-group">
			<label class="control-label">缩圈模式：</label>
			<div class="controls">
			    <form:radiobutton path="havecircle" value="0" checked="checked"/>关闭毒圈
				<form:radiobutton path="havecircle" value="1"/>多次缩圈
				<form:radiobutton path="havecircle" value="2" />全屏毒圈
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div id="startinjur" class="control-group">
			<label class="control-label">友军伤害：</label>
			<div class="controls">
				<form:radiobutton path="startinjur" value="0"/>开启
				<form:radiobutton path="startinjur" value="1" checked="checked"/>关闭
				<span class="help-inline"><font color="red">*</font> </span>
				<form:hidden path="everyinjur" value="100" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组队类型：</label>
			<div class="controls">
				<form:radiobutton path="teamtype" value="0" checked="checked"/>自选组队
				<form:radiobutton path="teamtype" value="1" />系统组队
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">队伍人数：</label>
			<div class="controls">
				<form:input path="teampeo" type="number" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">总人数：</label>
			<div class="controls">
				<form:input path="allpeo" type="number" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建人：</label>
			<div class="controls">
				<form:input path="createby" htmlEscape="false" maxlength="50" value="${fns:getUser().name}" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="gamehomeinfo:gamehome:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>