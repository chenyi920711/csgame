<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<head>
<link href="/csgame/static/bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="/csgame/static/bootstrap-3.3.7/dist/css/bootstrap-combined.min.css" rel="stylesheet">
<link href="/csgame/static/bootstrap-3.3.7/dist/css/layoutit.css" rel="stylesheet">
<script type="text/javascript" src="/csgame/static/js/jquery-3.3.1.js"></script>
<!-- <script type="text/javascript" src="/csgame/static/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="/csgame/static/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
<script type="text/javascript">
 		function crossDomainRequest(){
 			$.ajax({
					url: "http://192.168.199.190:8080/railwaySys/admin/vrdata/vrdata/getVrJson?id=2",
		    		type : 'POST', 
					dataType : 'json', 
					success : function(){
						$("#content").html("请求成功！");
					}							
				});		
 		}
</script>
	
<div class="container-fluid">
	<div>
		<input type='button' value='开始测试ajax' onclick='crossDomainRequest()' />
		<input type='button' value='开始测试a' onclick='crossDomainRequestfora()' />
  		<div id="content"></div>
	</div>
</div>