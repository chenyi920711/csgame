<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>房间管理</title>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.8&key=3569ec90020ba941e9269f398bc8896c&plugin=AMap.MouseTool,AMap.PolyEditor,AMap.CircleEditor,AMap.RectangleEditor,AMap.ToolBar"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
	<script type="text/javascript" src="/csgame/static/jquery/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/csgame/static/layer/layer.js"></script>
	<style type="text/css">
		#thebutt{
			width:52%;
			float:right;
			margin-bottom: 0px;		
		}

		#thebutt input{
			width:50%;
			height:6%;
		}					
		#thebutt input{
			width:19%;
			height:6%;
		}
		
	</style>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</head>
<body>
<div id="container"></div>
<div id="tip" style="right: 0%;top: 25%;background-color: #282C35;" >
 	<div style="color: white;background-color: #282C35;width: 100%;border-bottom: 1px solid white;">
 		<span style="color: white;font-size: 16px;">玩<br>家<br>列<br>表<br></span>
 	</div>
<!--  	<div style="color: white;background-color: #282C35;width: 100%;">
 		<span style="color: white;font-size: 16px;">战<br>斗<br>日<br>志<br></span>
 	</div>   -->	  
</div>
<div class="button-group" id="thebutt" style="text-align: left;bottom: 1%;	">
  <input type="button" id="startgame" class="button" value="开始游戏" style="margin-right: 15%;background-color: #282C35;" onclick="gotostart()" />
  <input type="button" id="safegon" class="button" value="地图选择"  style="margin-right: 1%;background-color: #282C35;" onclick="chmap()" />
  <input type="button" id="ceeraingon" class="button" value="规则选择"  style="margin-right: 1%;background-color: #282C35;" onclick="chromset()" />
  <input type="button" id="checgetmap" class="button" value="返回"  style="margin-right: 1%;background-color: #282C35;" onclick="toreturn()" />
</div>	
<%-- 	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gamehomeinfo/gamehome/">房间列表</a></li>
		<li class="active"><a href="${ctx}/gamehomeinfo/gamehome/form?id=${gamehome.id}">房间<shiro:hasPermission name="gamehomeinfo:gamehome:edit">${not empty gamehome.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="gamehomeinfo:gamehome:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/> --%>
	<form:form cssStyle="display:none;" id="inputForm" modelAttribute="gamehome" action="${ctx}/gamehomeinfo/gamehome/save" method="post" class="form-horizontal">
		<form:hidden path="id" id="theromid" />
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">所用地图：</label>
			<div class="controls">
				<form:input path="grommap" id="mapid" htmlEscape="false" maxlength="35" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>			
	</form:form>
	<div style="display: none;" >
		<input type="text" id="themap" />
		<input type="text" id="thesafec" />
		<input type="text" id="thesafe" />
		<input type="text" id="thegun" />
		<input type="text" id="thestatus" value="${gamehome.homestate}" />
	</div>
<script type="text/javascript">
 var heig =  window.innerHeight;

 var widh =  window.innerWidth;
 var mapid = $("#mapid").val();
$.ajax({
		url: "${ctx}/gamehomeinfo/gamehome/recshopmap",
   		type : 'POST', 
		data : {"manshopid" : mapid},
		dataType : 'json',
		async:false, 
		success : function(optss){
			 for (var i = 0; i < optss.length; i++) { 
                  $("#themap").val(optss[i].gamemapcenter);
                  $("#thesafec").val(optss[i].gamemaprang);
                  $("#thesafe").val(optss[i].gsafepoi);
                  $("#thegun").val(optss[i].ggunpoi);
                } 		 
		}		
});	
 var map = new AMap.Map("container", {
    	zoom:15,
    	resizeEnable: true,
        layers:[
                new AMap.TileLayer.Satellite()/* ,
                new AMap.TileLayer.RoadNet() */
         ]
    });

    if(document.getElementById("themap").value!=""){
	    //回显地图区域
	    	var cent = document.getElementById("themap").value.split("#");
	    	var patha = [];
	    	if(cent.length>0){
	    	for(var i=0;i<cent.length;i++){
	    		if(cent[i]!=""){
	    			patha.push(new AMap.LngLat(cent[i].split("-")[0],cent[i].split("-")[1]));
	    		}
	    	}
		      var  polygon = new AMap.Polygon({
		        path: patha,//设置多边形边界路径
		        strokeColor: "#FF33FF", //线颜色
		        strokeOpacity: 0.2, //线透明度
		        strokeWeight: 3,    //线宽
		        fillColor: "#1791fc", //填充色
		        fillOpacity: 0.35//填充透明度
		    });
		    polygon.setMap(map);
    	}
    }
    	
    //回显安全区
    if(document.getElementById("thesafec").value!=""){
    	var rang = document.getElementById("thesafec").value.split("#");
    	var ranen = rang[0]
    	var ranws = rang[1].split("-");    
        var circle = new AMap.Circle({
	        center: new AMap.LngLat(ranws[0], ranws[1]),// 圆心位置
	        radius: ranen, //半径
	        strokeColor: "#F33", //线颜色
	        strokeOpacity: 1, //线透明度
	        strokeWeight: 3, //线粗细度
	        fillColor: "#ee2200", //填充颜色
	        fillOpacity: 0.35//填充透明度
  		});
   		circle.setMap(map);
	}
   		//回显安全屋
   		if(document.getElementById("thesafe").value!=""){
	      var marksaf = document.getElementById("thesafe").value.split("#");
	      for(var ma = 0; ma<=marksaf.length-1;ma++){
		      if(marksaf[ma]!=""){
		      	var sma = marksaf[ma].split("-");	      
                 var marker = new AMap.Marker({
                     map: map,
                     position:new AMap.LngLat(sma[0], sma[1]), //基点位置
                     icon: new AMap.Icon({            
                         size: new AMap.Size(40, 50),  //图标大小
                         image: "/csgame/static/images/safe.png",
                         imageOffset: new AMap.Pixel(0, -60)
                		 })
                 });		      	
		      }
     	
	      }   		
   		}
      //回显补给点
   		if(document.getElementById("thegun").value!=""){
	      var marksaf = document.getElementById("thegun").value.split("#");
	      for(var ma = 0; ma<=marksaf.length-1;ma++){
		      if(marksaf[ma]!=""){
		      	var sma = marksaf[ma].split("-");	      
                 var marker = new AMap.Marker({
                     map: map,
                     position:new AMap.LngLat(sma[0], sma[1]), //基点位置
                     icon: new AMap.Icon({            
                         size: new AMap.Size(40, 50),  //图标大小
                         image: "/csgame/static/images/gun.png",
                         imageOffset: new AMap.Pixel(0, -60)
                		 })
                 });		      	
		      }
     	
	      }   		
   		}
    function chmap(){
	    var mapuri="";
	    var romid = $("#theromid").val();
	   	if($("#mapid").val()=="10000"){
			layer.open({
				  type: 2
				  ,offset: 'auto' //具体配置参考：offset参数项
				  ,maxmin: true
				  ,content: '${ctx}/gameinfo/gamemapinfo/list?romid='+romid
				  ,btn: '关闭'
				  ,area: [''+widh*0.7+'px', ''+heig+'px']
				  ,btnAlign: 'c' //按钮居中
				  ,shade: 0//不显示遮罩
				  ,yes: function(){
				    layer.closeAll();
				    window.location.replace("${ctx}/gamehomeinfo/gamehome/formr?id="+romid);
				  }
				});	   		
	   	}else{
			layer.open({
				  type: 2
				  ,offset: 'auto' //具体配置参考：offset参数项
				  ,maxmin: true
				  ,content: '${ctx}/gameinfo/gamemapinfo/list?romid='+romid
				  ,btn: '关闭'
				  ,area: [''+widh*0.7+'px', ''+heig*0.9+'px']
				  ,btnAlign: 'c' //按钮居中
				  ,shade: 0//不显示遮罩
				  ,yes: function(){
				    layer.closeAll();
				    window.location.replace("${ctx}/gamehomeinfo/gamehome/formr?id="+romid);
				  }
				});	  	   	
		}
    }
 	
 	function chromset(){
 	 var romid = $("#theromid").val();
			layer.open({
			  type: 2
			  ,offset: 'auto' //具体配置参考：offset参数项
			  ,maxmin: true
			  ,content: '${ctx}/gamehomeinfo/gamehome/formrrom?rommid='+romid
			  ,btn: '关闭'
			  ,area: [''+widh*0.5+'px', ''+heig*0.9+'px']
			  ,btnAlign: 'c' //按钮居中
			  ,shade: 0//不显示遮罩
			  ,end: function(){
			    layer.closeAll();
			  }
			});	  	 		
 	}
 	
 	function gotostart(){
 		var mapid = $("#mapid").val();
 		var romid = $("#theromid").val();
 		if(mapid==""||mapid=="10000"){
 			alert("开始游戏前请先选择地图！");
 		}else if($("#thestatus").val()=="1"){
 			alert("游戏已经开始,请先在房间列表页面停止该游戏！");
 		}else{
 		if(window.confirm("设置完成,确定开始游戏？")){
 			//将初始地图信息存入redis->db0
 			var mapran = document.getElementById("themap").value;//地图
 			//安全区
 			var rang = document.getElementById("thesafec").value.split("#");
	    	var ranen = rang[0];//半径
	    	var ranws = rang[1];//圆心
	    	//弹药点
	    	var gunpoi = document.getElementById("thegun").value;
	    	//生命点
	    	var hppoi = document.getElementById("thesafe").value;
			$.ajax({
					url: "${ctx}/gamehomeinfo/gamehome/mapredissave",
			   		type : 'POST', 
					data : {"ranen" : ranen,"ranws":ranws,"mapran":mapran,"gunpoi":gunpoi,"hppoi":hppoi,"roomid":romid,"rstaus":"1"},
					dataType : 'json', 
					async:false,
					success : function(){
						window.location = "${ctx}/gamehomeinfo/gamehome/formrr?id="+romid;
					}		
			});	    	
			window.location = "${ctx}/gamehomeinfo/gamehome/formrr?id="+romid;	  		
 		}

 		}
 	}
 	
 	function toreturn(){
 		window.close();
 	}
</script>	
</body>
</html>