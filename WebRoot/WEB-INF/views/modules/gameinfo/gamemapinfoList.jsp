<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>地图管理</title>
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
        function newarom(){
        	 window.location.href = "${ctx}/gameinfo/gamemapinfo/form?romid="+$("#therom").val(); 
        }
        
        function deletearom(){
        var chec = $("input[type='checkbox']:checked").length;
       		 if(chec>1||chec<=0){
 				alert("只能选择一条数据")
			}else{
				if(window.confirm("确定删除这条数据吗？")){
					window.location.href = "${ctx}/gameinfo/gamemapinfo/delete?gamemapid="+$("#checkedmap").val()+"&romid="+$("#therom").val()+""; 
				}
			}
        }
        
        function choicrom(){
			var chec = $("input[type='checkbox']:checked").length;
			var romid = $("#therom").val();
			
			if(chec>1||chec<=0){
 				alert("只能选择一条数据")
			}else{
				var checval = $("input[type='checkbox']:checked").val();
				$.ajax({
					url: "${ctx}/gamehomeinfo/gamehome/setmapid",
		    		type : 'POST', 
		 			data : {"romid" :romid,"mapid": checval},
					dataType : 'json', 
					success : function(data){
	        		  if(data.id == "false"){
						   alert("变更地图失败！请检查数据！");
	        		  }
        		 	  if(data.id == "success"){
        				   alert("变更地图成功！");	 	        		  
        			  }	
					}							
				});		
			}
			
        }        
	</script>
</head>
<body>
<%-- 	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/gameinfo/gamemapinfo/">地图列表</a></li>
		<shiro:hasPermission name="gameinfo:gamemapinfo:edit"><li><a href="${ctx}/gameinfo/gamemapinfo/form"  target="view_window" >地图添加</a></li></shiro:hasPermission>
	</ul> --%>
	<sys:message content="${message}"/>
	<div>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<tr>
				<td style="width: 80%;text-align: center;" rowspan="4">
	              <ul >
	              <c:forEach items="${page.list}" var="gamemap">
		              <li style="width: 45%;list-style-type: none;float: left;">
			                   <table>
									<tr>
										<td style="width: 5%;vertical-align: middle;" rowspan="2">
											<input type="checkbox" id="checkedmap" name="seleid" value="${gamemap.gamemapid}"/>
										</td>
										<td style="width: 80%" rowspan="2">
											<a href="${ctx}/gameinfo/gamemapinfo/formr?gamemapid=${gamemap.gamemapid}&romid=${gromid}"><img alt="" style="max-height: 100%;max-width: 100%;" src="/csgame/${gamemap.gamemapimg}" ></a>
										</td>	
									</tr>
									<tr>
	
									</tr>
								</table>
		                   </li>
	              </c:forEach>      
	              </ul>									
				</td>
			</tr>
			<tr>
				<td style="width: 20%;text-align: center;">
					<input type="button" value="创建地图" onclick="newarom()"/>
				</td>			
			</tr>
			<tr>
				<td style="width: 20%;text-align: center;">
					<input type="hidden" id="therom" value="${gromid}" />
					<input type="button" value="选择该地图" onclick="choicrom()"/>
				</td>			
			</tr>			
			<tr>
				<td style="width: 20%;text-align: center;">
					<input type="button" value="删除地图" onclick="deletearom()"/>	
				</td>
			</tr>
		</table>	
	</div>
	
	
	<div style="text-align: center;" class="pagination">${page}</div>
</body>
</html>