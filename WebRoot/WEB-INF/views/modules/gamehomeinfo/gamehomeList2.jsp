<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>房间管理</title>
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
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/gamehomeinfo/gamehome/">房间列表</a></li>
		<shiro:hasPermission name="gamehomeinfo:gamehome:edit"><li><a href="${ctx}/gamehomeinfo/gamehome/form">房间添加</a></li></shiro:hasPermission>
	</ul>
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
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>房间名称</th>
				<th>所用地图</th>
				<th>所用模式</th>
				<th>所属门店</th>
				<th>HP调整</th>
				<th>HP数值</th>
				<th>缩圈模式</th>
				<th>毒圈初始伤害</th>
				<th>毒圈叠加伤害</th>
				<th>组队类型</th>
				<th>队伍人数</th>
				<th>总人数</th>
				<th>创建人</th>
				<th>创建日期</th>
				<th>房间状态</th>
				<th>备注</th>
				<shiro:hasPermission name="gamehomeinfo:gamehome:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gamehome">
			<tr>
				<td><a href="${ctx}/gamehomeinfo/gamehome/form?id=${gamehome.id}">
					${gamehome.gromname}
				</a></td>
				<td>
					${gamehome.grommap}
				</td>
				<td>
					${gamehome.grommodu}
				</td>
				<td>
					${gamehome.createshop}
				</td>
				<td>
					${gamehome.adjusthp}
				</td>
				<td>
					${gamehome.peohp}
				</td>
				<td>
					${gamehome.havecircle}
				</td>
				<td>
					${gamehome.startinjur}
				</td>
				<td>
					${gamehome.everyinjur}
				</td>
				<td>
					${gamehome.teamtype}
				</td>
				<td>
					${gamehome.teampeo}
				</td>
				<td>
					${gamehome.allpeo}
				</td>
				<td>
					${gamehome.createby}
				</td>
				<td>
					${gamehome.createtime}
				</td>
				<td>
					${gamehome.homestate}
				</td>
				<td>
					${gamehome.remarks}
				</td>
				<shiro:hasPermission name="gamehomeinfo:gamehome:edit"><td>
    				<a href="${ctx}/gamehomeinfo/gamehome/form?id=${gamehome.id}">修改</a>
					<a href="${ctx}/gamehomeinfo/gamehome/delete?id=${gamehome.id}" onclick="return confirmx('确认要删除该房间吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>