<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>定时任务管理</title>
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
		function changeJobStatus(jobId, cmd) {
			showWaitMsg();
			$.ajax({
				type : "POST",
				async : false,
				dataType : "JSON",
				cache : false,
				url : "${ctx}/sys/sysScheduleJob/changeJobStatus",
				data : {
					jobId : jobId,
					cmd : cmd
				},
				success : function(data) {
					hideWaitMsg();
					if (data.flag) {

						location.reload();
					} else {
						alert(data.msg);
					}

				}//end-callback
			});//end-ajax
		}
		function showWaitMsg(msg) {
			if (msg) {

			} else {
				msg = '正在处理，请稍候...';
			}
			var panelContainer = $("body");
			$("<div id='msg-background' class='datagrid-mask' style=\"display:block;z-index:10006;\"></div>").appendTo(panelContainer);
			var msgDiv = $("<div id='msg-board' class='datagrid-mask-msg' style=\"display:block;z-index:10007;left:50%\"></div>").html(msg).appendTo(
					panelContainer);
			msgDiv.css("marginLeft", -msgDiv.outerWidth() / 2);
		}
		function hideWaitMsg() {
			$('.datagrid-mask').remove();
			$('.datagrid-mask-msg').remove();
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/sysScheduleJob/">定时任务列表</a></li>
		<shiro:hasPermission name="sys:sysScheduleJob:edit"><li><a href="${ctx}/sys/sysScheduleJob/form">定时任务添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="sysScheduleJob" action="${ctx}/sys/sysScheduleJob/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>任务名称：</label>
				<form:input path="jobName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>任务名称</th>
				<th>任务分组</th>
				<th>任务状态</th>
				<th>cron表达式</th>
				<th>描述</th>
				<th>是否同步</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="sys:sysScheduleJob:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="sysScheduleJob">
			<tr>
				<td><a href="${ctx}/sys/sysScheduleJob/form?id=${sysScheduleJob.id}">
					${sysScheduleJob.jobName}
				</a></td>
				<td>
					${sysScheduleJob.jobGroup}
				</td>
				<td>
					${fns:getDictLabel(sysScheduleJob.jobStatus, 'task_state', '')}
				</td>
				<td>
					${sysScheduleJob.cronExpression}
				</td>
				<td>
					${sysScheduleJob.description}
				</td>
				<td>
					${fns:getDictLabel(sysScheduleJob.isConcurrent, 'yes_no', '')}
				</td>
				<td>
					<fmt:formatDate value="${sysScheduleJob.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${sysScheduleJob.remarks}
				</td>
				<shiro:hasPermission name="sys:sysScheduleJob:edit"><td>
    				<a href="${ctx}/sys/sysScheduleJob/form?id=${sysScheduleJob.id}">修改</a>
					<a href="${ctx}/sys/sysScheduleJob/delete?id=${sysScheduleJob.id}" onclick="return confirmx('确认要删除该定时任务吗？', this.href)">删除</a>
					<c:if test="${sysScheduleJob.jobStatus =='0' }">
						<a href="javascript:;" onclick="changeJobStatus('${sysScheduleJob.id}','start')">启用</a>
					</c:if>
					<c:if test="${sysScheduleJob.jobStatus =='1' }">
						<a href="javascript:;" onclick="changeJobStatus('${sysScheduleJob.id}','stop')">停止</a>&nbsp;
					</c:if>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>