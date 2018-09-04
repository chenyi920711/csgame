<%@ page contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="org.apache.shiro.web.session.HttpServletSession"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>真人CS演练后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var submitflag = false;
		$().ready(function(){
			 $("#password").blur(function(){
				if($("#password").val().length<6){
					$('#passwordErr').text("密码长度不能小于6位");
					submitflag = false;
				}else{
					$('#passwordErr').text("");
					submitflag = true;
					//console.log($("#password").val().length);
				}
			});
			
			
			//原始js代码      var psd = document.getElementById("password").value;
	        
			$('#password2').blur(function(){
			var psd = $('#password').val();
			if(psd!=$('#password2').val()){
				submitflag = false;
				$('#password2Err').text("两次输入密码不一致");
			}else{
				$('#password2Err').text("");
				submitflag = true;
			}
			});
			
			//真实姓名校验
			$('#name').blur(function(){
			var regName =/^[\u4e00-\u9fa5]{2,4}$/;
			var name = $('#name').val();
			if(!regName.test(name)){
				submitflag = false;
				$('#nameErr').text("请输入真实姓名");
			}else{
				$('#nameErr').text("");
				submitflag = true;
			}
			});
			//身份证号码校验
			$('#idnumber').blur(function(){ 
			var regIdNo = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			var idnumber = $('#idnumber').val();
				if(!regIdNo.test(idnumber)){
					submitflag = false;
					$('#idnumberErr').text("请输入正确的身份证号码");
				}else{
					submitflag = true;
					$('#idnumberErr').text("");
				}
			});
			
			//电话号码验证
			
			$('#phone').blur(function(){
				var phone = $('#phone').val();
				var mobileRegex = /^(((1[3456789][0-9]{1})|(15[0-9]{1}))+\d{8})$/;
				if(!mobileRegex.test(phone)){
					submitflag = false;
					$('#phoneErr').text("请输入正确的电话号码");
				}else{
					submitflag = true;
					$('#phoneErr').text("");
				}
			});		
			//邀请码验证
			$('#yqm').blur(function(){
				var yqm = $('#yqm').val();
				$.ajax({
					url:"${ctx}/code",
					type:'POST',
					dataType : 'json',
					data:{'yq': yqm},
					success : function(data) {
		        		  if(data.id == "false"){
		        			  submitflag = false;
		        			   $("#yqmErr").html("该用户已注册，请联系管理员");
		        		  }else if(data.id == "success"){
		        			   submitflag = true;
		        			   $("#yqmErr").html("");	        		  }	
					}
				});
			
			});
			
		});
		function forsubmit(){
			var form1 = document.getElementById("subform");
			if(submitflag){
				form1.submit();
			}
		}
	</script>
  </head>
  
  <body>
  
  <div class="container">
  <div class="row" style="height:5%" ></div>
	<div class="row" style="height:80%" >
		<div class="col-md-4"></div>
			<div class="col-md-5">
				<div class="panel panel-primary">
					<div class="panel-heading"  style="text-align:center">
					<label style="font-size:17px;">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</label>
					</div>
						<div class="panel-body">
							<form class="form-horizontal" action="${ctx}/regist" id="subform" method="post">
							    <label id="error" style="color:red;">${error }</label>
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label>
								    <div class="col-sm-7">
								      <label id="usernameErr" style="color:red;"></label>
								      <input type="text"  autocomplete="off" required="required" class="form-control" id="username" name="username" placeholder="请填写用户名">
								    </div>
								    <label style="color:red;">*</label>
								  </div>
								 <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
								    <div class="col-sm-7">
								      <label id="passwordErr" style="color:red;"></label>
								      <input type="password" class="form-control" id="password"   name="password" required="required"  maxlength="20" placeholder="请输入密码">
								    </div>
								     <label style="color:red;">*</label>
								  </div>
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">重复密码</label>
								    <div class="col-sm-7">
								      <label id="password2Err" style="color:red;"></label>
								      <input type="password" class="form-control" required="required"   id="password2" name="password2"  maxlength="20" placeholder="请再次输入密码">
								    </div>
								     <label style="color:red;">*</label>
								  </div>
								 <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">店主姓名</label>
								    <div class="col-sm-7">
								    <label id="nameErr" style="color:red;"></label>
								      <input type="text" required="required" class="form-control" id="name" name="name" placeholder="请填写真实姓名">
								    </div>
								     <label style="color:red;">*</label>
								  </div>
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">身份证号</label>
								    <div class="col-sm-7">
								    <label id="idnumberErr" style="color:red;"></label>
								      <input type="text" class="form-control"  required="required" id="idnumber" name="idnumber" placeholder="请填写店主身份证号">
								      
								    </div>
								     <label style="color:red;">*</label>
								  </div>
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">门店位置</label>
								    <div class="col-sm-7">
								    <label id="localErr" style="color:red;"></label>
								      <input type="text" class="form-control" required="required"  id="loc" name="local" placeholder="请填写门店位置">
								    </div>
								     <label style="color:red;">*</label>
								  </div>
								    <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">联系方式</label>
								    <div class="col-sm-7">
								    <label id="phoneErr" style="color:red;"></label>
								      <input type="text"  required="required" class="form-control" id="phone"  name="phone" placeholder="请输入电话号码">
								    </div>
								     <label style="color:red;">*</label>
								  </div>
								  <div class="form-group">
								    <label for="inputEmail3" class="col-sm-3 control-label">邀&nbsp;&nbsp;请&nbsp;&nbsp;码</label>
								    <div class="col-sm-7">
								    <label id="yqmErr" style="color:red;"></label>
								      <input type="yqm" required="required" class="form-control" id="yqm" name="yqm" placeholder="请输入本店邀请码">
								    </div>
								     <label style="color:red;">*</label>
								  </div>
								  <div class="form-group">
								    <div class="col-sm-offset-4 col-sm-5">
								     <button type="button" onclick="forsubmit()" class="btn btn-default btn-lg active">提交</button>
								    </div>
								  </div>
								  <div>
								    <input type="hidden" name="create_by" value="1" />
								    <input type="hidden" name="update_by" value="1" />
								    <input type="hidden" name="company_id" value="1" />
								    <input type="hidden" name="office_id" value="2" />
								  </div>
								</form>
						 </div>
				</div>
			</div>
		<div class="col-md-3"></div>
		  <div class="row" style="height:15%" ></div>
	</div>
  </div>
<!--   <script type="text/javascript">
  function onblu(){
	  var password = $('#password').val;
	  
	  var password2 = $('#password2').val();
	   if(password!=password2){
	 	  $('#password2Err').text("两次输入密码不一致");
	   }
  }
 
  </script>
	  <script type="text/javascript">
	  function reg(){
	   var password = $('#password').val;
	   console.log(password.length);
	    if(password.length<6){
	    	alert(password.length);
	   		$('#passwordErr').text("密码长度不能少于6位");
	   } 

	  }  
	  </script> -->

  </body>
</html>
