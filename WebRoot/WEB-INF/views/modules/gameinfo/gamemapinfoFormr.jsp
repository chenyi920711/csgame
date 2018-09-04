<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>地图管理</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--     <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width"> -->
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.8&key=3569ec90020ba941e9269f398bc8896c&plugin=AMap.MouseTool,AMap.PolyEditor,AMap.CircleEditor,AMap.RectangleEditor,AMap.ToolBar"></script>
    <script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
	<script type="text/javascript" src="/csgame/static/jquery/jquery-1.8.3.js"></script>
    <style>
	    *{
	    	color: white;
	    	font-family: Microsoft Yahei;
	    	}
	    input{
	    	background-color: #000000;
	    	border: 1px solid #007274;
	    }
       #container{
          margin-right:25%;
          margin-top:1%;
          margin-bottom:1%;
          margin-left:1%;
          width:74%;
          height:98%;
       }
       #theinfo{
          margin-right:1%;
          margin-top:1%;
          margin-bottom:1%;
          margin-left:76%;
          width:23%;
          height:98%;
       }
       #thebutt{
 		  right:25%;
 		  bottom:1%;
          width:33%;
          height:3%;
       }       
        .context_menu {
            margin: 2px;
            padding: 2px;
            list-style-type: none;
            position: relative;
            background-color: rgb(255, 255, 255);
            border: 1px solid rgb(175, 175, 175);
            border-radius: 5px;
            box-shadow: rgb(153, 153, 153) 2px 2px 8px;
            white-space: nowrap;
            cursor: pointer;
        }
        .context_menu li {
            text-indent: 0.5em;
            color: blue;
            font-size: 13px;
            font-family: verdana;
            height: 20px;
            line-height: 20px;
            word-break: break-all;
            white-space: nowrap;
        }
        .context_menu li.split_line {
            border-bottom-color: rgb(204, 204, 204);
            border-bottom-style: solid;
            border-bottom-width: 1px;
        }
    </style>    
</head>
<body style="background-color: #00393A;" >
<div id="container"></div>
	<div id="theinfo">
	<table  style="border-collapse:separate; border-spacing:0px 1%;height:100%;width: 100%" >
		<tr style="height:42%;width: 90%;" >
			<td rowspan="4" style="background-color: #00CDCE;width: 3%;" > </td>
			<td style="border: 1px solid #007274;">
				<table style="height: 100%;">
					<tr style="height: 15%;" ><td><label>当前游戏区域</label></td></tr>
					<tr style="height: 70%;width: 100%"><td><img alt="sd" style="max-height: 100%;max-width: 100%;" src="/StuManagement/layer/theme/default/map1.png"> </td></tr>
					<tr style="height: 15%;">
						<td><input type="button" value="重新选择" style="background-color: #003B3B;" id="setarea" />&nbsp;
							<input type="button" value="截取屏幕" style="background-color: #003B3B;" id="setarea" />&nbsp;
						</td>
					</tr>
				</table>					
			</td>
		</tr>
		
		<tr style="height:27%;width: 90%;">
			<td style="border: 1px solid #007274;">
				<table style="height: 100%;">
					<tr>
						<td>添加标记</td>
					</tr>
					<tr>
						
						<td> 精度 <input type="text" id="Plengt" readonly="readonly" /> </td>
					</tr>
					<tr>
						
						<td> 纬度 <input type="text" id="Olengt" readonly="readonly" /> </td>
					</tr>
					<tr>
						<td>
							安全屋 <input type="radio" name = "imgmarko" id="imgmarko" value="safedot" />
							补给点 <input type="radio" name = "imgmarko" id="imgmarko" value="gundot" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="结束标记点" style="background-color: #003B3B;" id="takemark" onclick="endpoi()" />
<!-- 							<input type="button" value="取消" style="background-color: #003B3B;" id="takemark" />
 -->						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr style="height:27%;width: 90%;" >
			<td style="width: 100%;border: 1px solid #007274;">
				<table style="height: 100%;">
					<tr>
						<td>安全区规则</td>
					</tr>
					<tr>
						<td> 收缩耗时 <input type="number" value="${gamemapinfo.scirintime}" id="cirinjtime" min="0.0" step="0.1" required="required" onkeypress='return( /[\d]/.test(String.fromCharCode(event.keyCode) ) )' /> </td>
					</tr>
					<tr>
						<td> 变化间隔 <input type="number" value="${gamemapinfo.scrichtime}" id="cirtime" min="0.0" step="0.1" required="required" onkeypress='return( /[\d]/.test(String.fromCharCode(event.keyCode) ) )' /> </td>
					</tr>
					<tr>
						<td> 初始伤害 <input type="number" value="${gamemapinfo.stinjur}" id="startinj" min="0.0" step="0.1" required="required" onkeypress='return( /[\d]/.test(String.fromCharCode(event.keyCode) ) )' /> </td>
					</tr>
					<tr>
						<td> 增加伤害 <input type="number" value="${gamemapinfo.addinjur}" id="everyinj" min="0.0" step="0.1" required="required" onkeypress='return( /[\d]/.test(String.fromCharCode(event.keyCode) ) )' /> </td>
					</tr>
					

				</table>
			</td>
		</tr>
		<tr style="height:4%;width: 90%;" >
			<td style="text-align: center;"> <input type="button" style="background-color: #003B3B;" value="确定" onclick="takemapform()" /> </td>
		</tr>		
	</table>

	</div>
<div class="button-group" id="thebutt">
  <input type="button" id="polygon" class="button" value="区域选择" />
  <input type="button" id="safegon" class="button" value="安全区选择"/>
  <input type="button" id="ceeraingon" class="button" value="确定区域" />
  <input type="button" id="checgetmap" class="button" value="移除一组区域" onClick="removcirorrec()"/>
</div>	
	
	<form:form cssStyle="display:none;" id="inputForm" modelAttribute="gamemapinfo" action="${ctx}/gameinfo/gamemapinfo/resave" method="post" class="form-horizontal">
		<sys:message content="${message}"/>		
		<input type="hidden" id="romidd" name = "romidd" value = "${romid}"/>
		<div class="control-group">
			<label class="control-label">主键：</label>
			<div class="controls">
				<form:input path="gamemapid" htmlEscape="false" maxlength="33" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地图快照：</label>
			<div class="controls">
				<form:input path="gamemapimg"  htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属门店：</label>
			<div class="controls">
				<form:input path="gamemapshop" htmlEscape="false" value="${fns:getUser().company.id}" maxlength="35" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">补给点：</label>
			<div class="controls">
				<form:input path="ggunpoi" id="gunpoi" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地图范围：</label>
			<div class="controls">
				<form:input path="gamemapcenter" id="maprange" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">初始安全区：</label>
			<div class="controls">
				<form:input path="gamemaprang" id="saferange" htmlEscape="false" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">安全屋点：</label>
			<div class="controls">
				<form:input path="gsafepoi" id="safepoi" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建人：</label>
			<div class="controls">
				<form:input path="creatby" value="${fns:getUser().name}" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">缩圈时间：</label>
			<div class="controls">
				<form:input path="scirintime" id="cirintime" htmlEscape="false" class="input-xlarge required number"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">缩圈间隔：</label>
			<div class="controls">
				<form:input path="scrichtime" id="circhtime" htmlEscape="false" class="input-xlarge required number"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">初始伤害：</label>
			<div class="controls">
				<form:input path="stinjur" id="stinj" htmlEscape="false" class="input-xlarge required number"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">叠加伤害：</label>
			<div class="controls">
				<form:input path="addinjur" id="addinjur" htmlEscape="false" class="input-xlarge required number"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">remarks：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="100" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">remarkstw：</label>
			<div class="controls">
				<form:input path="remarkstw" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">remarksth：</label>
			<div class="controls">
				<form:input path="remarksth" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="gameinfo:gamemapinfo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

<script type="text/javascript">
 var map = new AMap.Map("container", {
    	zoom:15,
    	resizeEnable: true,
        layers:[
                new AMap.TileLayer.Satellite()/* ,
                new AMap.TileLayer.RoadNet() */
         ]
    });
  var mouseTool = new AMap.MouseTool(map);    
    var poliste =  AMap.event.addDomListener(document.getElementById('polygon'), 'click', function() {
        mouseTool.polygon();
    }, false);
    var safepoi =  AMap.event.addDomListener(document.getElementById('safegon'), 'click', function() {
        mouseTool.circle();
    }, false);
    var safepoi =  AMap.event.addDomListener(document.getElementById('ceeraingon'), 'click', function() {
    	mouseTool.close();
    }, false);

    var menu=new ContextMenu(map);
    function ContextMenu(map) {
        var me = this;
        this.mouseTool = new AMap.MouseTool(map); //地图中添加鼠标工具MouseTool插件
        this.contextMenuPositon = null;
        var content = [];
        content.push("<div>");
        content.push("    <ul class='context_menu'>");
        content.push("        <li onclick='menu.zoomMenu(0)'>缩小</li>");
        content.push("        <li class='split_line' onclick='menu.zoomMenu(1)'>放大</li>");
        content.push("        <li class='split_line' onclick='menu.distanceMeasureMenu()'>距离量测</li>");
        content.push("        <li id='centpoi'  onclick='menu.addcentMenu()'>添加中心点</li>");
        content.push("        <li id='safepoi'  onclick='menu.addMarkerMenu()'>添加补给点</li>");
        content.push("        <li id='centpoi'  onclick='menu.removMarkerMenu()'>移除上一个标记点</li>");
        content.push("    </ul>");
        content.push("</div>");
        this.contextMenu = new AMap.ContextMenu({isCustom: true, content: content.join('')});//通过content自定义右键菜单内容

       //地图绑定鼠标右击事件——弹出右键菜单
        /* map.on('rightclick', function(e) {
            me.contextMenu.open(map, e.lnglat);
            me.contextMenuPositon = e.lnglat; //右键菜单位置
        }); */ 
        
        map.on('click', function(e) {
           var radval = $('input:radio[name="imgmarko"]:checked').val();
           if(radval!=null){
        	   $("#Plengt").val(e.lnglat.P);
        	   $("#Olengt").val(e.lnglat.O);
        	   if(radval=="safedot"){
                   var marker = new AMap.Marker({
                       map: map,
                       position: e.lnglat, //基点位置
                       icon: new AMap.Icon({            
                           size: new AMap.Size(40, 50),  //图标大小
                           image: "/csgame/static/images/safe.png",
                           imageOffset: new AMap.Pixel(0, -60)
                  		 })
                   });
                   marker.on("click",function(e){
                	   if(window.confirm("删除该标记点")){
                		   this.setMap(null);
                	   }
                   });
        	   }
        	   if(radval=="gundot"){
        		   var marker = new AMap.Marker({
                       map: map,
                       position: e.lnglat, //基点位置
                       icon: new AMap.Icon({            
                           size: new AMap.Size(40, 50),  //图标大小
                           image: "/csgame/static/images/gun.png",
                           imageOffset: new AMap.Pixel(0, -60)
                  		 })
                   });  
                   marker.on("click",function(e){
                	   if(window.confirm("删除该标记点")){
                		   this.setMap(null);
                	   }
                   });
        	   }
           }
        });                
    }

    ContextMenu.prototype.zoomMenu = function zoomMenu(tag) {//右键菜单缩放地图
        if (tag === 0) {
            map.zoomOut();
        }
        if (tag === 1) {
            map.zoomIn();
        }
        this.contextMenu.close();
    }
    ContextMenu.prototype.distanceMeasureMenu=function () {  //右键菜单距离量测
        this.mouseTool.rule();
        this.contextMenu.close();
    }
    ContextMenu.prototype.addMarkerMenu=function () {  //右键菜单添加Marker标记
        this.mouseTool.close();
        var cListts = map.getAllOverlays('marker');
        if(cListts.length<1){
        	alert("请先确定中心点后再进行添加补给点！");
        }else{
            var marker = new AMap.Marker({
                map: map,
                position: this.contextMenuPositon //基点位置
            });
        }
        this.contextMenu.close();
    }
    ContextMenu.prototype.addcentMenu=function () {  //添加中心点
        this.mouseTool.close();
        var cListt = map.getAllOverlays('marker');
        if(cListt.length>0){
        	alert("已经添加过中心点，请删除后添加");
        }else{
            var marker = new AMap.Marker({
                map: map,
                position: this.contextMenuPositon, //基点位置
                icon: new AMap.Icon({            
                    size: new AMap.Size(40, 50),  //图标大小
                    image: "https://webapi.amap.com/theme/v1.3/images/newpc/way_btn2.png",
                    imageOffset: new AMap.Pixel(0, -60)
           		 })
            });        	
        }
        this.contextMenu.close();
    }
    ContextMenu.prototype.removMarkerMenu=function () {  
        this.mouseTool.close();
        var cListts = map.getAllOverlays('marker');
        if(cListts.length<1){
        	alert("请先添加点后才能移除");
           
        }else{
        	 cListts[cListts.length-1].setMap(null);       	
        }

        this.contextMenu.close();
    }
    

    if(document.getElementById("maprange").value!=""){
	    //回显地图区域
	    	var cent = document.getElementById("maprange").value.split("#");
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
    if(document.getElementById("saferange").value!=""){
    	var rang = document.getElementById("saferange").value.split("#");
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
   		if(document.getElementById("safepoi").value!=""){
	      var marksaf = document.getElementById("safepoi").value.split("#");
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
   		if(document.getElementById("gunpoi").value!=""){
	      var marksaf = document.getElementById("gunpoi").value.split("#");
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
    
     function removcirorrec(){
    	var sli = map.getAllOverlays('polygon');
    	if(sli.length>0){
    		sli[0].setMap(null);
    	}
    	var sli = map.getAllOverlays('circle');
    	if(sli.length>0){
    		sli[0].setMap(null);
    	}
    }
    
    function takemapform(){
    	var tslii = map.getAllOverlays('marker');
    	var tsliip = map.getAllOverlays('polygon');
    	var tsliic = map.getAllOverlays('circle');
    	var tform = document.getElementById("inputForm");
    	var aarea = ""
    	var safp = "";
    	var gunp = "";
		var ssafe = "";
    	if(tsliip.length>1||tsliic.length>1){
    		alert("只能选择一组区域！");
    	}

    	if(tsliip.length<1||tsliic.length<1){
    		alert("缺少安全区或者游戏区域");
    	} 
    	
    	if($("#cirinjtime").val()==""||$("#cirtime").val()==""
    	||$("#startinj").val()==""||$("#everyinj").val()==""){
    	
    		alert("请正确填写安全区规则");
    	}
    	
		if(tsliip.length==1&&tsliic.length==1
			&&$("#cirinjtime").val()!=""&&$("#cirtime").val()!=""
			&&$("#startinj").val()!=""&&$("#everyinj").val()!=""){   		
	    	for(var p = 0;p<tsliip[0].getPath( ).length;p++){
	    		aarea = aarea + tsliip[0].getPath( )[p].P+"-"+tsliip[0].getPath( )[p].O+"#";
	    	}    		
    		ssafe = ssafe+tsliic[0].getRadius( )+"#"+tsliic[0].getCenter( ).P+"-"+tsliic[0].getCenter( ).O;
	    	for(var i=0;i<tslii.length;i++){
	    		if(tslii[i].getIcon( ).F.image.indexOf("safe")>-1){
	    			safp +=  tslii[i].getPosition().P+"-"+tslii[i].getPosition().O+"#";
	    		}else if(tslii[i].getIcon( ).F.image.indexOf("gun")>-1){
	    			gunp +=  tslii[i].getPosition().P+"-"+tslii[i].getPosition().O+"#";
	    		}
	    	}  
	    	
	    	 $("#gunpoi").val(gunp);
	    	 $("#safepoi").val(safp);
	    	 $("#maprange").val(aarea);	
	    	 $("#saferange").val(ssafe);
	    	 $("#cirintime").val($("#cirinjtime").val());
	    	 $("#circhtime").val($("#cirtime").val());
	    	 $("#stinj").val($("#startinj").val());
	    	 $("#addinjur").val($("#everyinj").val());
	    	 tform.submit();
    	}   	
    }
    function endpoi(){
    	$('input:radio[name="imgmarko"]').removeAttr('checked');
    }
    
</script>
</body>

</html>