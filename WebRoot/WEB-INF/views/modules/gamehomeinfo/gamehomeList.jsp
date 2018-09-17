<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>房间管理</title>
	<meta name="decorator" content="default"/>
	<script src="/csgame/static/layer/layer.js"></script>
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
 			layer.open({
				  type: 2
				  ,offset: 'auto' //具体配置参考：offset参数项
				  ,maxmin: true
				  ,area:['800px','500px']
				  ,content: '${ctx}/gamehomeinfo/gamehome/form'
				  ,btn: '关闭全部'
				  ,btnAlign: 'c' //按钮居中
				  ,shade: 0//不显示遮罩
				  ,yes: function(){
				    layer.closeAll();
				    window.location.replace("${ctx}/gamehomeinfo/gamehome/form");
				  }
				}); 

		/* 		window.open("${ctx}/gamehomeinfo/gamehome/form"); */				        
        }
		function tostoparom(romid){
			if(window.confirm("确定停止该房间游戏？")){
				window.location = "${ctx}/gamehomeinfo/gamehome/endredissave?roomid="+romid+"&rstaus=0";
			}	
		}        
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/gamehomeinfo/gamehome/">房间列表</a></li>
<%-- 		<shiro:hasPermission name="gamehomeinfo:gamehome:edit"><li><a href="${ctx}/gamehomeinfo/gamehome/form">房间添加</a></li></shiro:hasPermission>
 --%>	</ul>
	<form:form id="searchForm" modelAttribute="gamehome" action="${ctx}/gamehomeinfo/gamehome/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>房间状态：</label>
				<form:input path="homestate" htmlEscape="false" maxlength="3" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<div>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<tr>
				<td style="width: 80%;text-align: center;" rowspan="2">
	              <ul >
	              		<c:forEach items="${page.list}" var="gameroom">
	                   <li style="width: 30%;list-style-type: none;float: left;">
		                   <table>
								<tr>
									<td style="width: 5%;vertical-align: middle;" rowspan="2">
										<input type="checkbox" name="seleid" value="${gameroom.id}"/>
									</td>
									<td style="width: 80%" rowspan="2">
										<c:if test="${gameroom.homestate==1}">
										   <a href ="javascript:return false;" >
											<ul>
												<li style="list-style-type: none;opacity: 0.2;">
													${gameroom.allpeo}人房间
												</li>
												<li style="list-style-type: none;opacity: 0.2;">
													<c:if test="${gameroom.teamtype==0}">
														自由组队
													</c:if>
													<c:if test="${gameroom.teamtype==1}">
														随机组队
													</c:if>
												</li>												
												<li style="list-style-type: none;opacity: 0.2;">
													<c:if test="${gameroom.startinjur==0}">
														友军伤害开启
													</c:if>
													<c:if test="${gameroom.startinjur==1}">
														友军伤害关闭
													</c:if>
												</li>
												<li style="list-style-type: none;opacity: 0.2;">
													<c:if test="${gameroom.homestate==0}">
														未进行游戏
													</c:if>
													<c:if test="${gameroom.homestate==1}">
														已开始游戏
													</c:if>
												</li>												
											</ul>
										</a>
										</c:if>	
										
										<c:if test="${gameroom.homestate==0}">
										   <a href="${ctx}/gamehomeinfo/gamehome/formr?id=${gameroom.id}" target="_blank" >
											<ul>
												<li style="list-style-type: none;">
													${gameroom.allpeo}人房间
												</li>
												<li style="list-style-type: none;">
													<c:if test="${gameroom.teamtype==0}">
														自由组队
													</c:if>
													<c:if test="${gameroom.teamtype==1}">
														随机组队
													</c:if>
												</li>												
												<li style="list-style-type: none;">
													<c:if test="${gameroom.startinjur==0}">
														友军伤害开启
													</c:if>
													<c:if test="${gameroom.startinjur==1}">
														友军伤害关闭
													</c:if>
												</li>
												<li style="list-style-type: none;o">
													<c:if test="${gameroom.homestate==0}">
														未进行游戏
													</c:if>
													<c:if test="${gameroom.homestate==1}">
														已开始游戏
													</c:if>
												</li>												
											</ul>
										</a>
										</c:if>																			
										<%-- <a href="${ctx}/gamehomeinfo/gamehome/formr?id=${gameroom.id}" target="_blank" >
											<ul>
												<li style="list-style-type: none;">
													${gameroom.allpeo}人房间
												</li>
												<li style="list-style-type: none;">
													<c:if test="${gameroom.teamtype==0}">
														自由组队
													</c:if>
													<c:if test="${gameroom.teamtype==1}">
														随机组队
													</c:if>
												</li>												
												<li style="list-style-type: none;">
													<c:if test="${gameroom.startinjur==0}">
														友军伤害开启
													</c:if>
													<c:if test="${gameroom.startinjur==1}">
														友军伤害关闭
													</c:if>
												</li>
												<li style="list-style-type: none;">
													<c:if test="${gameroom.homestate==0}">
														未进行游戏
													</c:if>
													<c:if test="${gameroom.homestate==1}">
														已开始游戏
													</c:if>
												</li>												
											</ul>
										</a> --%>
									</td>
									<td style="width: 15%">
									<input type="button" value="观战" />
									</td>
								</tr>
								<tr>
									<td style="width: 20%">
									<c:if test="${gameroom.homestate=='0'}">
										<input type="button" value="停止游戏" onclick="tostoparom('${gameroom.id}')" disabled="disabled" />
									</c:if>
									<c:if test="${gameroom.homestate=='1'}">
										<input type="button" value="停止游戏" onclick="tostoparom('${gameroom.id}')" />
									</c:if>																			
<%-- 										<input type="button" value="停止游戏" onclick="tostoparom('${gameroom.id}')" /> --%>
									</td>
								</tr>
							</table>
	                   </li>	              		              		
	              		</c:forEach>

	              </ul>									
				</td>
				<td style="width: 20%;text-align: center;">
					<input type="button" value="创建房间" onclick="newarom()"/>
				</td>
			</tr>
			<tr>
				<td style="width: 20%;text-align: center;">
					<input type="button" value="删除房间" onclick="newarom()"/>	
				</td>
			</tr>
		</table>	
	</div>

	<div style="text-align: center;" class="pagination">${page}</div>
</body>
</html>