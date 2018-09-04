<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<head>

	<style type="text/css">
		body .demo-class {
           background: black;
           border: none;
       }
	</style>
	</head>
	
	<title>门店设备管理</title>
	<meta name="decorator" content="default"/>
	<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/static/layer/skin/layer.css" rel="stylesheet" type="text/css">
	<!-- <link href="/csgame/static/bootstrap/2.3.1/css_all/bootstrap-switch.min.css" rel="stylesheet"> --> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
	<script type="text/javascript"src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
   <!--  <script src="/csgame/static/bootstrap/2.3.1/js/bootstrap-switch.min.js"></script> --> 


	<script type="text/javascript">
      $(document).ready(function() {
			var chec = $(".radio").each(function(){
				
				if($(this).val()=='1'){
					
					 $("input[name='isbinding1']").attr("checked",true);
					 $("input[name='isbinding2']").attr("checked",false);
				}
				if($(this).val()=='0'){
					$("input[name='isbinding1']").attr("checked",false);
					 $("input[name='isbinding2']").attr("checked",true);

				} 
			}); 
			
			$(".storeEquipmenRadio").off().on("click", function(){
				var id =$(this).parent().find(".storeEquipmentId").val();
				var isbinding = $(this).val();
          		var storeEquipmenRadios = $(this).parent().find(".storeEquipmenRadio");
				$.ajax({
			          type : 'post', 
			          async : false,
			          url : '${ctx}/equip/equipment/storeEquipment/changeStatus',
			          dataType: 'json',
			          data : {"id":id , "isbinding":isbinding},       
			          success : function(data) {
			          if (data.success){
			          		$.each(storeEquipmenRadios,function(i,v){
			          			if($(storeEquipmenRadios[i]).val()!=isbinding){
			          				$(storeEquipmenRadios[i]).prop("checked",false);
			          			}
			          		});
			          		layer.alert('状态修改成功', {icon: 1});
			          }
			          else {
			          		layer.alert('修改失败', {icon: 1});
			          }
			      }
			    }); 
			});
			
			
			
			/* var chec = $(".checkbox").each(function(){
					 console.log($(this).val()); 
					if($(this).val()=='1'){
						$(this).bootstrapSwitch('state', true);
					}
					if($(this).val()=='0'){
						$(this).bootstrapSwitch('state', false);
					} 
				});  */
		        /* 初始化控件 */  
		      /*   $(".checkbox").bootstrapSwitch({  
		            onText : "是",      // 设置ON文本  
		            offText : "否",    // 设置OFF文本  
		            onColor : "primary",// 设置ON文本颜色     (info/success/warning/danger/primary)  
		            offColor : "danger",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
		            size : "mini",    // 设置控件大小,从小到大  (mini/small/normal/large)  
		            handleWidth:"20",//设置控件宽度
		            
		            // 当开关状态改变时触发  
		            onSwitchChange : function(event, state) {  
		            //var ProductId = event.target.defaultValue;
		            	var id = "";
			            var switchStatus = "";
			            var bootstrapState = false;
			            if(switchStatus == '1'){
			            	bootstrapState = true;
			            }
			            if(switchStatus == '0'){
			            	bootstrapState = false;
			            }
		                if (state == true) {
		                //是
			                 id = $(this).attr('data-id');
			                 switchStatus = '1';
			              	 console.log(id);
		                } else {
		                //否
		                   	 id = $(this).attr('data-id');
			                 switchStatus = '0'; 
		                }
		                alert(1);
		                $.ajax({
					          type : 'post', 
					          async : false,
					          url : '${ctx}/equip/equipment/storeEquipment/changeStatus',
					          dataType: 'json',
					          data : {"id":id , "isbinding":switchStatus},       
					          success : function(data) {
					          if (data.success){ 
					          		$('#'+id).val(switchStatus);
					          		$('#'+id).bootstrapSwitch('state', bootstrapState);
					          		if(switchStatus == '1'){
					          		
					          		}
					          		if(switchStatus == '0'){
					          		
					          		}
					          		
					          		alert('设置成功');
					          }
					          else {
					          		alert('发生错误！');
					          }
					      }
					    }); 
		            }  
		        });  
			 */
			
			
		});
		
		
		

		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }



	

	   function updateStoreno(id){
	   	  
          layer.config({
             skin: 'demo-class'//自定义样式demo-class
          })
          layer.open({
          title: false, //不显示标题栏
		  type: 2,
		  offset: 'auto', //具体配置参考：offset参数项
		  maxmin: false,
		  scrollbar: false,
		  content: ['${ctx}/equip/equipment/storeEquipment/form?id=' + id,'no'],
		  area: ['400px', '200px'],
		  skin: 'yourclass',
		 // btn: '关闭全部',
		  btnAlign: 'c', //按钮居中
		  shade: 0,//不显示遮罩
		  /* yes: function(){
		    layer.closeAll();
		    window.location.replace("${ctx}/equip/equipment/storeEquipment/list");
		  } */
		  end: function () {
               location.reload("${ctx}/equip/equipment/storeEquipment/list");
             }
		  
		});
	 }

	
	</script>
	
</head>

<body>

	
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/equip/equipment/storeEquipment/">门店设备列表</a></li>
		<%-- <shiro:hasPermission name="equip:equipment:storeEquipment:edit"><li><a href="${ctx}/equip/equipment/storeEquipment/form">门店设备添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="storeEquipment" action="${ctx}/equip/equipment/storeEquipment/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="storeNo" name="storeNo"  type="hidden" value="${fns:getUser().company.id}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>设备编号：</label>
				<form:input path="equipmentno" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>设备名称：</label>
				<form:input path="equipmentname" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<%-- <li><label>质保日期：</label>
				<input name="equipmentdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${storeEquipment.equipmentdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li> --%>
			<li><label>设备型号：</label>
				<form:input path="equipmenttype" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<%-- <li><label>绑定小程序：</label>
				<form:radiobuttons path="isbinding" items="${fns:getDictList('isbinding')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>--%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li> 
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed" >
		<thead>
			<tr >
				<th>设备编号</th>
				<th>设备名称</th>
				<th>质保日期</th>
				<th>设备型号</th>
				<th>店内编号</th>
				<th>绑定小程序</th>
				<shiro:hasPermission name="equip:equipment:storeEquipment:edit"><th >操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="storeEquipment">
			<tr>
				<td><a href="${ctx}/equip/equipment/storeEquipment/form?id=${storeEquipment.id}">
					${storeEquipment.equipmentno}
				</a></td>
				<td>
				${storeNo}
					${storeEquipment.equipmentname}
				</td>
				<td>
					<fmt:formatDate value="${storeEquipment.equipmentdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${storeEquipment.equipmenttype}
				</td>
				<td>
					${storeEquipment.storeequipno}
				</td>
				<c:if test="${storeEquipment.isbinding eq '1'}">
					<td >
						<input type="hidden" class="storeEquipmentId" value="${storeEquipment.id}"/>
						<input type="radio" class="storeEquipmenRadio" value="0">绑定
						<input type="radio" class="storeEquipmenRadio" checked="checked"  value="1"/>未绑定
					</td>
				</c:if>
				<c:if test="${storeEquipment.isbinding eq '0'}">
					<td >
						<input type="hidden" class="storeEquipmentId" value="${storeEquipment.id}"/>
						<input type="radio" class="storeEquipmenRadio" checked="checked" value="0">绑定
						<input type="radio" class="storeEquipmenRadio" value="1"/>未绑定
					</td>
				</c:if>
				<%-- <td >${storeEquipment.isbinding  }${storeEquipment.isbinding == '1' }
						<input type="radio"  name="isbinding1"  id="isbinding1"  class="radio" value="${storeEquipment.isbinding}" <c:if test="${storeEquipment.isbinding eq '1' }">checked="checked"</c:if>/>绑定
						<input type="radio"   name="isbinding2" id="isbinding2"  />未绑定
				</td> --%>
				<shiro:hasPermission name="equip:equipment:storeEquipment:edit"><td>
					<button type="button" id="${storeEquipment.id}" onclick="updateStoreno(this.id)"  class="width-35 pull-right btn btn-sm btn-primary"   style="width:100px;height:30px;margin-right:100px;" >
						<i class="icon-key" >修改店内编号</i>
					</button>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>