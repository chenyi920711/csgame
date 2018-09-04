<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>保存模式成功管理</title>
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
		<li class="active"><a href="${ctx}/gmoduleinfo/gamemodutype/">游戏模式列表</a></li>
		<shiro:hasPermission name="gmoduleinfo:gamemodutype:edit"><li><a href="${ctx}/gmoduleinfo/gamemodutype/form">游戏模式管理</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gamemodutype" action="${ctx}/gmoduleinfo/gamemodutype/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>模式类型：</label>
				<form:input path="gamemtype" htmlEscape="false" maxlength="22" class="input-medium"/>
				<form:hidden path="remarkshop" value = "${fns:getUser().company.id}"/>
			</li>
			<li><label>创建时间：</label>
				<input name="remarktime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${gamemodutype.remarktime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>模式名称</th>
				<th>模式类型</th>
				<th>结算排序</th>
				<th>创建门店</th>
				<th>创建人</th>
				<th>创建时间</th>
				<shiro:hasPermission name="gmoduleinfo:gamemodutype:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gamemodutype">
			<tr>
				<td><a href="${ctx}/gmoduleinfo/gamemodutype/form?id=${gamemodutype.id}">
					${gamemodutype.gamemname}
				</a></td>
				<td>
					${gamemodutype.gamemtype}
				</td>
				<td>
					${gamemodutype.gamemcount}
				</td>
				<td>
					${gamemodutype.remarkshop}
				</td>
				<td>
					${gamemodutype.remarkman}
				</td>
				<td>
					${gamemodutype.remarktime}
				</td>
				<shiro:hasPermission name="gmoduleinfo:gamemodutype:edit"><td>
    				<a href="${ctx}/gmoduleinfo/gamemodutype/form?id=${gamemodutype.id}">修改</a>
					<a href="${ctx}/gmoduleinfo/gamemodutype/delete?id=${gamemodutype.id}" onclick="return confirmx('确认要删除该保存模式成功吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>