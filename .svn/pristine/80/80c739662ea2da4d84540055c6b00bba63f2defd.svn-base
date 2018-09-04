<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>
<script type="text/javascript" src="${ctxStatic}/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/bootstrap/2.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

	function paytype(){
		
 		var paytype = $('select  option:selected').val();
 		alert(paytype);
 		$.ajax({
 			type : 'post',
 			url : "${ctx}/sys/sysScheduleJob/changeJobStatus",
			data : {
				paytype : paytype
			},
			success : function(data) {
			
			}
 			
 		
 		});
	}
</script>



</head>
<!-- 
<div style="text-align: center;">
	<select id="paytype" onchange="paytype()">
		<option value="微信">微信 </option>
		<option value="支付宝">支付宝 </option>
		<option value="现金">现金</option>
	</select>
</div>
 -->

<div style="height: 100px;"></div>
<table style="text-align: center;width: 100%;">
		<tr style="width: 100%;">
			<td style="width: 15%;"></td>
			<td><img style="width: 400px;height: 500px;" src="${ctxStatic}/images/wxf.jpg"></td>
			<td></td>
			<td ><img style="width: 400px;height: 500px;" src="${ctxStatic}/images/wxf.jpg"></td>
			<td style="width: 15%;"></td>
		</tr>
</table>
	
