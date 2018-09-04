<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>门店设备管理</title>
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
		
		function saveStoreno(id){
			var storeequipno =$("#storeequipno").val();
		      $.ajax({
		          type : 'post', 
		          async : false,
		          url : '${ctx}/equip/equipment/storeEquipment/changeStoreno',
		          dataType: 'json',
		          data : {"id":id , "storeequipno":storeequipno},     
		          success : function(data) {
		          if (data.success){ 
		            window.location.replace("${ctx}/equip/equipment/storeEquipment/list");//刷新父窗口
        			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        		    parent.layer.close(index);关闭窗口
		          	
		          }
		            else alert(data.msg);
		      }
		    })
		  
		}
	</script>
</head>
<body>

	<ul class="nav nav-tabs">
	<%-- 	<li><a href="${ctx}/equip/equipment/storeEquipment/">门店设备列表</a></li>--%>
  <li class="active"><a href="${ctx}/equip/equipment/storeEquipment/form?id=${storeEquipment.id}">店内编号<shiro:hasPermission name="equip:equipment:storeEquipment:edit">${not empty storeEquipment.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="equip:equipment:storeEquipment:edit">查看</shiro:lacksPermission></a></li> 
	</ul><br/>
	<%-- <form:form id="inputForm" modelAttribute="storeEquipment" action="${ctx}/equip/equipment/storeEquipment/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		 --%>
		<div class="control-group">
			<div class="controls">
			&nbsp;&nbsp;&nbsp;<input  type="text" required="required"  maxlength="255" class="input-xlarge " value="${storeEquipment.storeequipno}" id="storeequipno"/> 
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="equip:equipment:storeEquipment:edit">
					<button type="button" onclick="saveStoreno(this.id)" id="${storeEquipment.id}" class="width-35 pull-right btn btn-sm btn-primary"   style="width:100px;height:30px;margin-right:100px;" >
					  保存
					</button>
			</shiro:hasPermission>
			<!-- <input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn"  type="button" value="返 回" onclick="history.go(-1)"/> -->
		</div>
	<%-- </form:form> --%>
</body>
</html>